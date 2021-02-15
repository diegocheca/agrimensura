<?php

namespace TCG\Voyager\Http\Controllers;

use Exception;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Database\Schema\SchemaManager;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Events\BreadDataDeleted;
use TCG\Voyager\Events\BreadDataRestored;
use TCG\Voyager\Events\BreadDataUpdated;
use TCG\Voyager\Events\BreadImagesDeleted;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\Traits\BreadRelationshipParser;
use App\Expediente;
use App\Log;

use File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
use App\Mail\ExpedienteNuevoEmail;
use App\Movimiento;
use App\Area;
use App\Persona;
use TCG\Voyager\Models\User;


use App\Mail\VerificationEmail;





class VoyagerBaseController extends Controller
{
    use BreadRelationshipParser;

    //***************************************
    //               ____
    //              |  _ \
    //              | |_) |
    //              |  _ <
    //              | |_) |
    //              |____/
    //
    //      Browse our Data Type (B)READ
    //
    //****************************************

    

    public function index(Request $request)
    {
        // GET THE SLUG, ex. 'posts', 'pages', etc.
        $slug = $this->getSlug($request);

        // GET THE DataType based on the slug
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();
        //var_dump($dataType);die();
        // Check permission
        $this->authorize('browse', app($dataType->model_name));

        $getter = $dataType->server_side ? 'paginate' : 'get';

        $search = (object) ['value' => $request->get('s'), 'key' => $request->get('key'), 'filter' => $request->get('filter')];

        $searchNames = [];
        if ($dataType->server_side) {
            $searchable = SchemaManager::describeTable(app($dataType->model_name)->getTable())->pluck('name')->toArray();
            $dataRow = Voyager::model('DataRow')->whereDataTypeId($dataType->id)->get();
            foreach ($searchable as $key => $value) {
                $field = $dataRow->where('field', $value)->first();
                $displayName = ucwords(str_replace('_', ' ', $value));
                if ($field !== null) {
                    $displayName = $field->getTranslatedAttribute('display_name');
                }
                $searchNames[$value] = $displayName;
            }
        }

        $orderBy = $request->get('order_by', $dataType->order_column);
        $sortOrder = $request->get('sort_order', $dataType->order_direction);
        $usesSoftDeletes = false;
        $showSoftDeleted = false;

        // Next Get or Paginate the actual content from the MODEL that corresponds to the slug DataType
        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);

            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $query = $model->{$dataType->scope}();
            } else {
                $query = $model::select('*');
            }

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model)) && Auth::user()->can('delete', app($dataType->model_name))) {
                $usesSoftDeletes = true;

                if ($request->get('showSoftDeleted')) {
                    $showSoftDeleted = true;
                    $query = $query->withTrashed();
                }
            }

            // If a column has a relationship associated with it, we do not want to show that field
            $this->removeRelationshipField($dataType, 'browse');

            if ($search->value != '' && $search->key && $search->filter) {
                $search_filter = ($search->filter == 'equals') ? '=' : 'LIKE';
                $search_value = ($search->filter == 'equals') ? $search->value : '%'.$search->value.'%';
                $query->where($search->key, $search_filter, $search_value);
            }

            if ($orderBy && in_array($orderBy, $dataType->fields())) {
                $querySortOrder = (!empty($sortOrder)) ? $sortOrder : 'desc';
                $dataTypeContent = call_user_func([
                    $query->orderBy($orderBy, $querySortOrder),
                    $getter,
                ]);
            } elseif ($model->timestamps) {
                $dataTypeContent = call_user_func([$query->latest($model::CREATED_AT), $getter]);
            } else {
                $dataTypeContent = call_user_func([$query->orderBy($model->getKeyName(), 'DESC'), $getter]);
            }

            // Replace relationships' keys for labels and create READ links if a slug is provided.
            $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType);
        } else {
            // If Model doesn't exist, get data from table name
            $dataTypeContent = call_user_func([DB::table($dataType->name), $getter]);
            $model = false;
        }

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($model);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'browse', $isModelTranslatable);

        // Check if server side pagination is enabled
        $isServerSide = isset($dataType->server_side) && $dataType->server_side;

        // Check if a default search key is set
        $defaultSearchKey = $dataType->default_search_key ?? null;

        // Actions
        $actions = [];
        if (!empty($dataTypeContent->first())) {
            foreach (Voyager::actions() as $action) {
                $action = new $action($dataType, $dataTypeContent->first());

                if ($action->shouldActionDisplayOnDataType()) {
                    $actions[] = $action;
                }
            }
        }

        // Define showCheckboxColumn
        $showCheckboxColumn = false;
        if (Auth::user()->can('delete', app($dataType->model_name))) {
            $showCheckboxColumn = true;
        } else {
            foreach ($actions as $action) {
                if (method_exists($action, 'massAction')) {
                    $showCheckboxColumn = true;
                }
            }
        }

        // Define orderColumn
        $orderColumn = [];
        if ($orderBy) {
            $index = $dataType->browseRows->where('field', $orderBy)->keys()->first() + ($showCheckboxColumn ? 1 : 0);
            $orderColumn = [[$index, $sortOrder ?? 'desc']];
        }

        $view = 'voyager::bread.browse';

        if (view()->exists("voyager::$slug.browse")) {
            $view = "voyager::$slug.browse";
        }
        //MIS MODIFICACIONES
        // 1 - limito los expedientes que pueden ver los agrimensores
        //1.1 veo si el slug es expedientes y tmb si soy agrimensor
        //var_dump(Auth::user()->role_id);die(); el role_id = 3 es el agrimensor
        //si soy admin o mesa de entrada o empleado de la dgr debo ver todos los expedientes
        if( 
            ($slug== "expedientes") 
            && 
            ( 
                (Auth::user()->role_id == 4) // es para agentes de  la dgr
                || 
                (Auth::user()->role_id == 6) // para el rol de mesa de entrada
            ) // para el caso de ser agente de la dgr
        )
        {
            $elementos_a_eliminar = [];
            //voy a recorrer el array entero con todos los expedientes. aca voy a ver si hay expediente que yo no deberia ver.
            //si es asi, entonces voy a anaotarlos en una lista, y luego los saco del array original
            //se tiene q hacer en dos for, no se puede hacer en uno solo, xq a medida q vaya borrando elemmentos del array se modifican los limites del for
            /*
            PASOS a seguir:
            Paso 1 - busco todos los movimientos que esten en mi oficina
            Paso 2 - pasar los movimientos a un array con indice ordenado y ascendente, para luego ser ordenados
            Paso 3 - Ordenar los movimientos, es necesario ordenarolos para louego hacer la comparacion contra la query que hizo voyager,
            la query de voyager devuelve los movimientos ordenados descendentemente, por eso necesito tenerlos igual para comparar eficientemente.
            Paso 4 - con los movimientos ya ordenados, puedo hacer la comparativa contra la query de voyager y ver q elemento voy a sacar
            */
            //Paso 1 - busco todos los movimientos que esten en mi oficina
            $movimientos_en_oficina = Movimiento::select('*')
            ->where('id_area', '=', Auth::user()->id_area)
            ->where('fecha_salida', '=', null)
            ->orderBy('id', 'desc')
            ->get()
            ->unique('id_expediente');
            $movimientos_ordenados = [];
            //var_dump($movimientos_en_oficina);die();
            //Paso 2 - pasar los movimientos a un array con indice ordenado y ascendente, para luego ser ordenados
            for ($i=0 , $contador = 0; $i < 99999 ; $i++) { 
                if(isset($movimientos_en_oficina[$i]))
                {
                    $movimientos_ordenados [$contador] = [ "id"=> $movimientos_en_oficina[$i]["id"] , "id_exp"=> $movimientos_en_oficina[$i]["id_expediente"]] ;
                    $contador++;
                }
                if($contador >= count($movimientos_en_oficina))
                    break;
            }
            //var_dump($movimientos_ordenados);
            $y = $i;
            $l = $contador;
            //Paso 3 - Ordenar los movimientos, es necesario ordenarolos para louego hacer la comparacion contra la query que hizo voyager,
            //la query de voyager devuelve los movimientos ordenados descendentemente, por eso necesito tenerlos igual para comparar eficientemente.
            // ordenar
            //https://juncotic.com/ordenamiento-de-burbuja-algoritmos-de-ordenamiento/
            do
            {
                $n=0;
                //Recorrer la lista
                for($i=1;$i< $l;$i++)
                {
                    //Verificar si los dos valores estan ordenados
                    if(intval($movimientos_ordenados[$i-1]["id_exp"]) < intval($movimientos_ordenados[$i]["id_exp"]))
                    {
                        //Ordenar si es necesario
                        $temp=$movimientos_ordenados[$i-1];
                        $movimientos_ordenados[$i-1]=$movimientos_ordenados[$i];
                        $movimientos_ordenados[$i]=$temp;
                        $n=$i;
                    }
                }
                $l=$n;
            }
            while($n!=0);
            //var_dump("--------------------------------------------------");
            //var_dump($movimientos_ordenados);
            //die();
            //var_dump(count($dataTypeContent));die();
            //Paso 4 - crear el array ordenado listo para luego para ser comparado
            for ($i=0 , $indice_a_eliminar=0, $indice_elem_ordenados = 0; $i < count($dataTypeContent) ; $i++) { 
                // mi numero de departamento o area es: Auth::user()->id_area
                //voy a comprobar si cada uno de esots 
                /*var_dump("comparo:       ");
                var_dump($dataTypeContent[$i]["id"]);
                var_dump(" - y: ");*/
                //corto cuando termino de recoorer el array mas cortito (el de movimientos de mi area)
                if($indice_elem_ordenados >= count($movimientos_ordenados))
                { // significa que ya complete mi array de elementos a borrar , entonces borro el resto de "todos"
                    //var_dump("nada");
                    $elementos_a_eliminar [$indice_a_eliminar] = $i; // agrego los id de los exp q no son mios , luego los voy as sacar
                    $indice_a_eliminar++;// sumo la cantidad de registros que no son mios
                    continue;
                }
                else {
                    //var_dump($movimientos_ordenados[$indice_elem_ordenados]["id_exp"]);
                    if($dataTypeContent[$i]["id"] != $movimientos_ordenados[$indice_elem_ordenados]["id_exp"] ) // mi supuesto id_persona
                    {
                        //echo "son desiguales";
                        //echo "---    voy a comprar".$dataTypeContent[$i]["id_persona"]."|2   el id es:".$dataTypeContent[$i]["id"]."en la vuelta:".$i."   ---";
                        $elementos_a_eliminar [$indice_a_eliminar] = $i; // agrego los id de los exp q no son mios , luego los voy as sacar
                        $indice_a_eliminar++;// sumo la cantidad de registros que no son mios
                    }
                    else // significa que los elementos coinciden y no tienen q ser borrados, pero si avanzo el $indice_elem_ordenados
                    {
                        //echo "son iguales";
                        $indice_elem_ordenados++;
                    }
                }
            }
            if($i )
            //var_dump($elementos_a_eliminar);
            //die();
            //Paso 5 - con los movimientos ya ordenados, puedo hacer la comparativa contra la query de voyager y ver q elemento voy a sacar
            for ($y=0; $y < count($elementos_a_eliminar); $y++) { 
                //voy a empezar a eliminar los registros que no sean mios
                //array_splice($dataTypeContent, $elementos_a_eliminar[$y], 1); // empiezo a recorrer el arreglo de eliminar para ir sacandolos del arreay q voy a pasar
                unset($dataTypeContent[$elementos_a_eliminar[$y]]);
                // array_splice  (array_a_eliminar_elementos, el indice del elemento a eliminar, cantidad de elementos a eliminar a partir del numero anterior)
            }
            //var_dump(count($dataTypeContent));
            //var_dump($dataTypeContent);
            //die();
        }
        elseif( 
            ($slug== "expedientes") 
            && 
                (Auth::user()->role_id == 3)  // para los agrimensores
        ) 
        {
            $elementos_a_eliminar = [];
            //voy a recorrer el array entero con todos los expedientes. aca voy a ver si hay expediente que yo no deberia ver.
            //si es asi, entonces voy a anaotarlos en una lista, y luego los saco del array original
            //se tiene q hacer en dos for, no se puede hacer en uno solo, xq a medida q vaya borrando elemmentos del array se modifican los limites del for
            for ($i=0 , $indice_a_eliminar=0; $i < count($dataTypeContent) ; $i++) { 
                //aca debo obtener mi persona id . supongamos q es la 2
                if($dataTypeContent[$i]["id_persona"] != Auth::user()->id) // mi supuesto id_persona
                {
                    //echo "---    voy a comprar".$dataTypeContent[$i]["id_persona"]."|2   el id es:".$dataTypeContent[$i]["id"]."en la vuelta:".$i."   ---";
                    $elementos_a_eliminar [$indice_a_eliminar] = $i; // agrego los id de los exp q no son mios , luego los voy as sacar
                    $indice_a_eliminar++;// sumo la cantidad de registros que no son mios
                }
            }
            for ($y=0; $y < count($elementos_a_eliminar); $y++) { 
                //voy a empezar a eliminar los registros que no sean mios
                //array_splice($dataTypeContent, $elementos_a_eliminar[$y], 1); // empiezo a recorrer el arreglo de eliminar para ir sacandolos del arreay q voy a pasar
                unset($dataTypeContent[$elementos_a_eliminar[$y]]);
                // array_splice  (array_a_eliminar_elementos, el indice del elemento a eliminar, cantidad de elementos a eliminar a partir del numero anterior)
            }
            //var_dump(count($dataTypeContent));
            //var_dump($dataTypeContent);
            // die();
        }
        return Voyager::view($view, compact(
            'actions',
            'dataType',
            'dataTypeContent',
            'isModelTranslatable',
            'search',
            'orderBy',
            'orderColumn',
            'sortOrder',
            'searchNames',
            'isServerSide',
            'defaultSearchKey',
            'usesSoftDeletes',
            'showSoftDeleted',
            'showCheckboxColumn'
        ));
    }
    public function object_sorter($clave,$orden=null) {
        return function ($a, $b) use ($clave,$orden) {
              $result=  ($orden=="DESC") ? strnatcmp($b->$clave, $a->$clave) :  strnatcmp($a->$clave, $b->$clave);
              return $result;
        };
    }
    //***************************************
    //                _____
    //               |  __ \
    //               | |__) |
    //               |  _  /
    //               | | \ \
    //               |_|  \_\
    //
    //  Read an item of our Data Type B(R)EAD
    //
    //****************************************

    public function show(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $isSoftDeleted = false;

        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
                $model = $model->withTrashed();
            }
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $model = $model->{$dataType->scope}();
            }
            $dataTypeContent = call_user_func([$model, 'findOrFail'], $id);
            if ($dataTypeContent->deleted_at) {
                $isSoftDeleted = true;
            }
        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }

        // Replace relationships' keys for labels and create READ links if a slug is provided.
        $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType, true);

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'read');

        // Check permission
        $this->authorize('read', $dataTypeContent);

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'read', $isModelTranslatable);

        $view = 'voyager::bread.read';

        if (view()->exists("voyager::$slug.read")) {
            $view = "voyager::$slug.read";
        }

        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable', 'isSoftDeleted'));
    }

    //***************************************
    //                ______
    //               |  ____|
    //               | |__
    //               |  __|
    //               | |____
    //               |______|
    //
    //  Edit an item of our Data Type BR(E)AD
    //
    //****************************************

    public function edit(Request $request, $id)
    {
        $slug = $this->getSlug($request);
        
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
                $model = $model->withTrashed();
            }
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $model = $model->{$dataType->scope}();
            }
            $dataTypeContent = call_user_func([$model, 'findOrFail'], $id);
        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }

        foreach ($dataType->editRows as $key => $row) {
            $dataType->editRows[$key]['col_width'] = isset($row->details->width) ? $row->details->width : 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'edit');

        // Check permission
        $this->authorize('edit', $dataTypeContent);

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'edit', $isModelTranslatable);

        $view = 'voyager::bread.edit-add';

        if (view()->exists("voyager::$slug.edit-add")) {
            $view = "voyager::$slug.edit-add";
        }

        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable'));
    }

    // POST BR(E)AD
    public function update(Request $request, $id)
    {
        /*
        LIsta de pasos para hacer cuando se esta actualizando los datos un usuario
        1- editar el form correctamente y usar jquery al llenar el form
        2- validacion de datos del front
        3- validacion de datos del back
        4- Crear el registro que pertenece a de quien lleno el formulario
        5- mandar email de verificacion
        6- crear notificacion
        7- crear log
        8-
        */
        $slug = $this->getSlug($request);
        //var_dump($slug);die();
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();
        // Compatibility with Model binding.
        $id = $id instanceof \Illuminate\Database\Eloquent\Model ? $id->{$id->getKeyName()} : $id;

        $model = app($dataType->model_name);
        if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
            $model = $model->{$dataType->scope}();
        }
        if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
            $data = $model->withTrashed()->findOrFail($id);
        } else {
            $data = $model->findOrFail($id);
        }

        // Check permission
        $this->authorize('edit', $data);

        // Validate fields with ajax
        $val = $this->validateBread($request->all(), $dataType->editRows, $dataType->name, $id)->validate();
        //var_dump($dataType->editRows, $data);die();
        $this->insertUpdateData($request, $slug, $dataType->editRows, $data);

        event(new BreadDataUpdated($dataType, $data));

        if (auth()->user()->can('browse', app($dataType->model_name))) {
            $redirect = redirect()->route("voyager.{$dataType->slug}.index");
        } else {
            $redirect = redirect()->back();
        }

        return $redirect->with([
            'message'    => __('voyager::generic.successfully_updated')." {$dataType->getTranslatedAttribute('display_name_singular')}",
            'alert-type' => 'success',
        ]);
    }

    //***************************************
    //
    //                   /\
    //                  /  \
    //                 / /\ \
    //                / ____ \
    //               /_/    \_\
    //
    //
    // Add a new item of our Data Type BRE(A)D
    //
    //****************************************

    public function create(Request $request)
    {
        

        $slug = $this->getSlug($request);
        //var_dump("estoy en el create");die();

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));

        $dataTypeContent = (strlen($dataType->model_name) != 0)
                            ? new $dataType->model_name()
                            : false;

        foreach ($dataType->addRows as $key => $row) {
            $dataType->addRows[$key]['col_width'] = $row->details->width ?? 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'add');

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'add', $isModelTranslatable);

        $view = 'voyager::bread.edit-add';

        if (view()->exists("voyager::$slug.edit-add")) {
            $view = "voyager::$slug.edit-add";
        }
        //var_dump($dataType);die();

        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable'));
    }

    /**
     * POST BRE(A)D - Store data.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        //esta funcion se llama al crear el nuevo usuario
        
        $slug = $this->getSlug($request);
        //var_dump($slug);// --> salida ---> string(11) "expedientes"
        //die();

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));

        // Validate fields with ajax
        $val = $this->validateBread($request->all(), $dataType->addRows)->validate();
        // voy a preguntar si estoy guardando un expdiente
        //voy a crear una nueva carpeta en el server donde se almacenaran los archivos de ese expediente
        
        //var_dump($dataType->addRows);
        if($slug == "users"){
            $request [ "confirmed"  ] = false;
            $codigo = Str::random(25);
            $request [ "confirmation_code"  ] = $codigo;
            $request [ "created_by" ] =  Auth::user()->id ;
        }
        

        /*var_dump($request->get('name'));
        die();*/

        $data = $this->insertUpdateData($request, $slug, $dataType->addRows, new $dataType->model_name());
        //var_dump($data->id);die();
        if($slug == "expedientes")
        {
            /*
            CREANDO UN EXPEDIENTE
            Voy a ahcer el diagrama de flujo de iniciar expediente
            Paso 1 - Completar form de crear expediente (antes)
            Paso 2 - validar los datos en el back (arriba)
            Paso 3 - Crear registro en la base de datos (arriba)
            Paso 4 - Enviar por email aviso al agrimensor implicado
            Paso 5 - crear notificacion interna
            Paso 6 - generar log del expediente
            Paso 10 - generar log del nuevo movimiento
            Paso 7 -  crear carpeta en el servidor
            Paso 8 - crear e imprimir caratula
            Paso 9 - crear movimiento
            */
            //significa que estoy creando un nuevo expediente.
            //Inicia Paso 7
            //creacion de la carpeta del expediente en el servidor
            $path = "files_expedientes/exp".(string)$data->id;
            //$result = File::makeDirectory(storage_path($path));
            $result = File::makeDirectory(public_path().'/'.$path,0777,true);
            //una vez creada la carpeta ahora se la voy a asociar al expediente recien creado
            $exp = Expediente::find($data->id);
            $exp->path_papeles = $path;
            $exp->save();
            //Fin Paso 7
            //Inicio Paso 4 - Enviar por email aviso al agrimensor implicado
            //aviso de nuevo expdietne creado a su email.
            //busco el nombre del area
            //$area = Area::find(3); // va siempre a mensa de entrada cuando comienza el exp
            //busco el nombre de la persona y su email
            //$agrimensor = Persona::find($exp->id_persona);
            $agrimensor = User::find($exp->id_persona);
            //var_dump($agrimensor);die();
            $to_email = 'diegochecarelli@hotmail.com';
            //buscar email de la persona
            //var_dump($area, Auth::user()->id_area);
            Mail::to($to_email)->send(new ExpedienteNuevoEmail(Auth::user()->name ,$exp->created_at ,"mesa de entrada", $data->id, $exp->numero_expediente, "tramite en proceso"));
            //Fin Paso 4
            //Inicia Paso 9 - crear movimiento
            //crear el nuevo movimiento
            $movimento_nuevo = new Movimiento;
            $movimento_nuevo->orden = 1;
            $movimento_nuevo->fecha_entrada = $exp->created_at;
            $movimento_nuevo->fecha_salida = null;
            $movimento_nuevo->comentario = 'primer movimiento | generado automaticamente';
            $movimento_nuevo->bandera_observacion = false;
            $movimento_nuevo->observacion = null;
            $movimento_nuevo->subsanacion = null;
            $movimento_nuevo->id_area = 3;// antes era asi: $area->id | ahora: 3 (3 es el id del area mesa de entrada)
            $movimento_nuevo->id_expediente = $data->id;
            $movimento_nuevo->tramite_finalizado = false;
            $movimento_nuevo->confirmado = 1;
            $movimento_nuevo->fecha_confirmacion = date("Y-m-d H:i:s");
            $movimento_nuevo->quien_confirmacion = Auth::user()->id;
            $movimento_nuevo->comentario_confirmacion = "confirmacion automatica";
            $movimento_nuevo->created_by = Auth::user()->id;
            $resultado_paso_8 = $movimento_nuevo->save();
            //Fin Paso 9
            //Suspendida Paso 5 - crear notificacion interna 
            //Inicia Paso 6 - generar log
            $valor_nuevos ="
            {
                'id': '".(string)$exp->id."',
                'numero_exp': '".(string)$exp->numero_expediente."',
                'path_papeles': ".(string)$exp->path_papeles.",
                'id_tramite': ".(string)$exp->id_tramite.",
                'id_persona': '".(string)$exp->id_persona."',
                'file1': ".(string)$exp->file1.",
                'file2': ".(string)$exp->file2.",
                'file3': ".(string)$exp->file3.",
                'file4': ".(string)$exp->file4.",
                'file5': ".(string)$exp->file5.",
                'file6': ".(string)$exp->file6.",
                'file7': ".(string)$exp->file7.",
                'file8': ".(string)$exp->file8.",
                'file9': ".(string)$exp->file9.",
                'file10': ".(string)$exp->file10.",
                'file11': ".(string)$exp->file11.",
                'file12': ".(string)$exp->file12.",
                'file13': ".(string)$exp->file13.",
                'file14': ".(string)$exp->file14.",
                'file15': ".(string)$exp->file15.",
                'file16': ".(string)$exp->file16.",
                'file17': ".(string)$exp->file17.",
                'finalizo': '0',
                'created_by': ".(string)Auth::user()->id.",
                'comentario_log': 'se creo un nuevo expediente desde mesa de entrada'
            }";
            $log = new Log;
            $log->nombretabla = 'Expedientes';
            $log->accion = 'add';
            $log->valores_nuevos = $valor_nuevos;
            $log->valores_viejos = null;
            $log->id_modificado = $exp->id ;
            $log->estado = 'sin ver'; // "sin ver" - "sin aprobar" - "apronado" - "devuelto" - "archivado"
            $log->created_by = Auth::user()->id;
            $resultado6 = $log->save();
            //Fin paso 6
            //Inicio paso 10 - crear log de movimiento
            $valor_nuevos ="
            {
                'orden': ".(string)$movimento_nuevo->orden.",
                'fecha_entrada': '".(string)$movimento_nuevo->fecha_entrada."',
                'fecha_salida': '".(string)$movimento_nuevo->fecha_salida."',
                'comentario': '".(string)$movimento_nuevo->comentario."',
                'bandera_observacion': ".(string)$movimento_nuevo->bandera_observacion.",
                'observacion': '".(string)$movimento_nuevo->observacion."',
                'subsanacion': '".(string)$movimento_nuevo->subsanacion."',
                'id_area': ".(string)$movimento_nuevo->id_area.",
                'id_expediente': ".(string)$movimento_nuevo->id_expediente.",
                'tramite_finalizado': ".(string)$movimento_nuevo->tramite_finalizado.",
                'confirmado': ".(string)$movimento_nuevo->confirmado.",
                'fecha_confirmacion': '".(string)$movimento_nuevo->fecha_confirmacion."',
                'quien_confirmacion': ".(string)$movimento_nuevo->quien_confirmacion.",
                'comentario_confirmacion': '".(string)$movimento_nuevo->comentario_confirmacion."',
                'created_by': ".(string)$movimento_nuevo->created_by.",
                'comentario_de_log': 'valores del primer movimiento creado automaticamente cuando se crea un expediente en mesa de entrada.'
            }";

            $log2 = new Log;
            $log2->nombretabla = 'Movimientos';
            $log2->accion = 'edit';
            $log2->valores_nuevos = $valor_nuevos;
            $log2->valores_viejos = null;
            $log2->id_modificado = $movimento_nuevo->id ;
            $log2->estado = 'sin ver'; // "sin ver" - "sin aprobar" - "apronado" - "devuelto" - "archivado"
            $log2->created_by = Auth::user()->id;
            $resultado10 = $log2->save();
            //Fin paso 5
            //Fin paso 10
            //Inicia Paso 8
            /*$data_para_pdf = [
                'title' => 'Comprobante de Creacion de Un nuevo Expdiente',
                'fecha' => $movimento_nuevo->fecha_entrada,
                'nombre_area' => $area->nombre, 
                'id_exp' => $data->id, 
                'num_exp' => $exp->numero_expediente,
                'nombre_profesional' => $agrimensor->nombre

            ];
            $pdf = PDF::loadView('pdfs.comprobante_creacion_expediente', $data_para_pdf);*/
            //return $pdf->download('Comprobante de Creacion de expdiente numero:'.$data->numero_expediente.'.pdf');
            //Fin Paso 8


        }
        if($slug == "users"){
            // voy a crear un nuevo usuario del sistema desde el add de voyager
            /*Pasos a seguri para crear el usuario nuevo
            Paso 1- editar el form correctamente y usar jquery al llenar el form
            Paso 2- validacion de datos del front
            Paso 3- validacion de datos del back
            Paso 4- Crear el registro que pertenece a de quien lleno el formulario
            Paso 5- mandar email de verificacion
            Paso 6- crear notificacion
            Paso 7- crear log
            Paso 8- Comprobar si estoy creando una persona de mesa de entrada. si esasi ,entonces
            debo asignarle el id_area = 3 y role_id=6
            */

            //Inicia Paso 5 - Mandar email de verificacion 
            //creacion de la carpeta personal en el servidor
            //$path = "app\public\usuarios_files\user".$usuario_recien_creado["id"];
            //$result = File::makeDirectory(storage_path($path));

            // Send confirmation code
            /*var_dump($request->get('email'), $codigo, $request->get('name') ,$request->get('cuil'));
            die();*/
            //Paso 4 , ya esta hecho más arriba
            //Paso 5 - mandar email de verificacion
            $usuario = User::select('*')->where('email','=',$request->get('email'))->first();
            $usuario->confirmation_code = $codigo;
            $usuario->confirmed = false;
            $usuario->email_verified_at = null;
            /*Paso 8- Comprobar si estoy creando una persona de mesa de entrada. si esasi ,entonces
            debo asignarle el id_area = 3 y role_id=6*/
            if($usuario->role_id==6)
                $usuario->id_area = 3;
            //Fin paso 
            $usuario->save();
            Mail::to($request->get('email'))->send(new VerificationEmail($codigo, $request->get('name') ,$request->get('cuil')));//nueva
            //Fin paso 5
            //Paso 7 - crear log
            $valor_nuevos ="
            {
                'id': '".(string)$usuario->id."',
                'role_id': '".(string)$usuario->role_id."',
                'name': ".(string)$usuario->name.",
                'email': ".(string)$usuario->email.",
                'avatar': '".(string)$usuario->avatar."',
                'confirmed': ".(string)$usuario->confirmed.",
                'confirmation_code': ".(string)$usuario->confirmation_code.",
                'email_verified_at': ".(string)$usuario->email_verified_at.",
                'settings': ".(string)$usuario->settings.",
                'created_at': ".(string)$usuario->created_at.",
                'updated_at': ".(string)$usuario->updated_at.",
                'domicilio': ".(string)$usuario->domicilio.",
                'cuil': ".(string)$usuario->cuil.",
                'empleado_dgr': ".(string)$usuario->empleado_dgr.",
                'created_by': ".(string)$usuario->created_by.",
                'id_area': ".(string)$usuario->id_area.",
                'oficina': ".(string)$usuario->oficina.",
                'comentario_log': 'se creo un nuevo expediente desde mesa de entrada'
            }";
            $log = new Log;
            $log->nombretabla = 'Users';
            $log->accion = 'add';
            $log->valores_nuevos = $valor_nuevos;
            $log->valores_viejos = null;
            $log->id_modificado = $usuario->id ;
            $log->estado = 'sin ver'; // "sin ver" - "sin aprobar" - "apronado" - "devuelto" - "archivado"
            $log->created_by = Auth::user()->id;
            $resultado6 = $log->save();
            //Fin Paso 7
        }
        event(new BreadDataAdded($dataType, $data));
        if (!$request->has('_tagging')) {
            if (auth()->user()->can('browse', $data)) {
                $redirect = redirect()->route("voyager.{$dataType->slug}.index");
            } else {
                $redirect = redirect()->back();
            }

            

            return $redirect->with([
                'message'    => __('voyager::generic.successfully_added_new')." {$dataType->getTranslatedAttribute('display_name_singular')}",
                'alert-type' => 'success',
            ]);
        } else {
            return response()->json(['success' => true, 'data' => $data]);
        }
    }
    public function prueba_verificacion(){
        //var_dump("estoy donde quiero");die();
        $codigo = 'YJpJ3l6gEaRXjxYM1F2luLPxU';
        $name  = "Quiroga, Alejandro";
        $cuil ="21121478529";
        $resultado = Mail::to("quirogaalsina@hotmail.com")->send(new VerificationEmail($codigo, $name ,$cuil));//nueva
        var_dump($resultado);
    }
    

    //***************************************
    //                _____
    //               |  __ \
    //               | |  | |
    //               | |  | |
    //               | |__| |
    //               |_____/
    //
    //         Delete an item BREA(D)
    //
    //****************************************

    public function destroy(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Init array of IDs
        $ids = [];
        if (empty($id)) {
            // Bulk delete, get IDs from POST
            $ids = explode(',', $request->ids);
        } else {
            // Single item delete, get ID from URL
            $ids[] = $id;
        }
        foreach ($ids as $id) {
            $data = call_user_func([$dataType->model_name, 'findOrFail'], $id);

            // Check permission
            $this->authorize('delete', $data);

            $model = app($dataType->model_name);
            if (!($model && in_array(SoftDeletes::class, class_uses_recursive($model)))) {
                $this->cleanup($dataType, $data);
            }
        }

        $displayName = count($ids) > 1 ? $dataType->getTranslatedAttribute('display_name_plural') : $dataType->getTranslatedAttribute('display_name_singular');

        $res = $data->destroy($ids);
        $data = $res
            ? [
                'message'    => __('voyager::generic.successfully_deleted')." {$displayName}",
                'alert-type' => 'success',
            ]
            : [
                'message'    => __('voyager::generic.error_deleting')." {$displayName}",
                'alert-type' => 'error',
            ];

        if ($res) {
            event(new BreadDataDeleted($dataType, $data));
        }

        return redirect()->route("voyager.{$dataType->slug}.index")->with($data);
    }

    public function restore(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('delete', app($dataType->model_name));

        // Get record
        $model = call_user_func([$dataType->model_name, 'withTrashed']);
        if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
            $model = $model->{$dataType->scope}();
        }
        $data = $model->findOrFail($id);

        $displayName = $dataType->getTranslatedAttribute('display_name_singular');

        $res = $data->restore($id);
        $data = $res
            ? [
                'message'    => __('voyager::generic.successfully_restored')." {$displayName}",
                'alert-type' => 'success',
            ]
            : [
                'message'    => __('voyager::generic.error_restoring')." {$displayName}",
                'alert-type' => 'error',
            ];

        if ($res) {
            event(new BreadDataRestored($dataType, $data));
        }

        return redirect()->route("voyager.{$dataType->slug}.index")->with($data);
    }

    //***************************************
    //
    //  Delete uploaded file
    //
    //****************************************

    public function remove_media(Request $request)
    {
        try {
            // GET THE SLUG, ex. 'posts', 'pages', etc.
            $slug = $request->get('slug');

            // GET file name
            $filename = $request->get('filename');

            // GET record id
            $id = $request->get('id');

            // GET field name
            $field = $request->get('field');

            // GET multi value
            $multi = $request->get('multi');

            $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

            // Load model and find record
            $model = app($dataType->model_name);
            $data = $model::find([$id])->first();

            // Check if field exists
            if (!isset($data->{$field})) {
                throw new Exception(__('voyager::generic.field_does_not_exist'), 400);
            }

            // Check permission
            $this->authorize('edit', $data);

            if (@json_decode($multi)) {
                // Check if valid json
                if (is_null(@json_decode($data->{$field}))) {
                    throw new Exception(__('voyager::json.invalid'), 500);
                }

                // Decode field value
                $fieldData = @json_decode($data->{$field}, true);
                $key = null;

                // Check if we're dealing with a nested array for the case of multiple files
                if (is_array($fieldData[0])) {
                    foreach ($fieldData as $index=>$file) {
                        // file type has a different structure than images
                        if (!empty($file['original_name'])) {
                            if ($file['original_name'] == $filename) {
                                $key = $index;
                                break;
                            }
                        } else {
                            $file = array_flip($file);
                            if (array_key_exists($filename, $file)) {
                                $key = $index;
                                break;
                            }
                        }
                    }
                } else {
                    $key = array_search($filename, $fieldData);
                }

                // Check if file was found in array
                if (is_null($key) || $key === false) {
                    throw new Exception(__('voyager::media.file_does_not_exist'), 400);
                }

                $fileToRemove = $fieldData[$key]['download_link'] ?? $fieldData[$key];

                // Remove file from array
                unset($fieldData[$key]);

                // Generate json and update field
                $data->{$field} = empty($fieldData) ? null : json_encode(array_values($fieldData));
            } else {
                if ($filename == $data->{$field}) {
                    $fileToRemove = $data->{$field};

                    $data->{$field} = null;
                } else {
                    throw new Exception(__('voyager::media.file_does_not_exist'), 400);
                }
            }

            $row = $dataType->rows->where('field', $field)->first();

            // Remove file from filesystem
            if (in_array($row->type, ['image', 'multiple_images'])) {
                $this->deleteBreadImages($data, [$row], $fileToRemove);
            } else {
                $this->deleteFileIfExists($fileToRemove);
            }

            $data->save();

            return response()->json([
                'data' => [
                    'status'  => 200,
                    'message' => __('voyager::media.file_removed'),
                ],
            ]);
        } catch (Exception $e) {
            $code = 500;
            $message = __('voyager::generic.internal_error');

            if ($e->getCode()) {
                $code = $e->getCode();
            }

            if ($e->getMessage()) {
                $message = $e->getMessage();
            }

            return response()->json([
                'data' => [
                    'status'  => $code,
                    'message' => $message,
                ],
            ], $code);
        }
    }

    /**
     * Remove translations, images and files related to a BREAD item.
     *
     * @param \Illuminate\Database\Eloquent\Model $dataType
     * @param \Illuminate\Database\Eloquent\Model $data
     *
     * @return void
     */
    protected function cleanup($dataType, $data)
    {
        // Delete Translations, if present
        if (is_bread_translatable($data)) {
            $data->deleteAttributeTranslations($data->getTranslatableAttributes());
        }

        // Delete Images
        $this->deleteBreadImages($data, $dataType->deleteRows->whereIn('type', ['image', 'multiple_images']));

        // Delete Files
        foreach ($dataType->deleteRows->where('type', 'file') as $row) {
            if (isset($data->{$row->field})) {
                foreach (json_decode($data->{$row->field}) as $file) {
                    $this->deleteFileIfExists($file->download_link);
                }
            }
        }

        // Delete media-picker files
        $dataType->rows->where('type', 'media_picker')->where('details.delete_files', true)->each(function ($row) use ($data) {
            $content = $data->{$row->field};
            if (isset($content)) {
                if (!is_array($content)) {
                    $content = json_decode($content);
                }
                if (is_array($content)) {
                    foreach ($content as $file) {
                        $this->deleteFileIfExists($file);
                    }
                } else {
                    $this->deleteFileIfExists($content);
                }
            }
        });
    }

    /**
     * Delete all images related to a BREAD item.
     *
     * @param \Illuminate\Database\Eloquent\Model $data
     * @param \Illuminate\Database\Eloquent\Model $rows
     *
     * @return void
     */
    public function deleteBreadImages($data, $rows, $single_image = null)
    {
        $imagesDeleted = false;

        foreach ($rows as $row) {
            if ($row->type == 'multiple_images') {
                $images_to_remove = json_decode($data->getOriginal($row->field), true) ?? [];
            } else {
                $images_to_remove = [$data->getOriginal($row->field)];
            }

            foreach ($images_to_remove as $image) {
                // Remove only $single_image if we are removing from bread edit
                if ($image != config('voyager.user.default_avatar') && (is_null($single_image) || $single_image == $image)) {
                    $this->deleteFileIfExists($image);
                    $imagesDeleted = true;

                    if (isset($row->details->thumbnails)) {
                        foreach ($row->details->thumbnails as $thumbnail) {
                            $ext = explode('.', $image);
                            $extension = '.'.$ext[count($ext) - 1];

                            $path = str_replace($extension, '', $image);

                            $thumb_name = $thumbnail->name;

                            $this->deleteFileIfExists($path.'-'.$thumb_name.$extension);
                        }
                    }
                }
            }
        }

        if ($imagesDeleted) {
            event(new BreadImagesDeleted($data, $rows));
        }
    }

    /**
     * Order BREAD items.
     *
     * @param string $table
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function order(Request $request)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('edit', app($dataType->model_name));

        if (!isset($dataType->order_column) || !isset($dataType->order_display_column)) {
            return redirect()
            ->route("voyager.{$dataType->slug}.index")
            ->with([
                'message'    => __('voyager::bread.ordering_not_set'),
                'alert-type' => 'error',
            ]);
        }

        $model = app($dataType->model_name);
        if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
            $model = $model->withTrashed();
        }
        $results = $model->orderBy($dataType->order_column, $dataType->order_direction)->get();

        $display_column = $dataType->order_display_column;

        $dataRow = Voyager::model('DataRow')->whereDataTypeId($dataType->id)->whereField($display_column)->first();

        $view = 'voyager::bread.order';

        if (view()->exists("voyager::$slug.order")) {
            $view = "voyager::$slug.order";
        }

        return Voyager::view($view, compact(
            'dataType',
            'display_column',
            'dataRow',
            'results'
        ));
    }

    public function update_order(Request $request)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('edit', app($dataType->model_name));

        $model = app($dataType->model_name);

        $order = json_decode($request->input('order'));
        $column = $dataType->order_column;
        foreach ($order as $key => $item) {
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
                $i = $model->withTrashed()->findOrFail($item->id);
            } else {
                $i = $model->findOrFail($item->id);
            }
            $i->$column = ($key + 1);
            $i->save();
        }
    }

    public function action(Request $request)
    {
        $slug = $this->getSlug($request);
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $action = new $request->action($dataType, null);

        return $action->massAction(explode(',', $request->ids), $request->headers->get('referer'));
    }

    /**
     * Get BREAD relations data.
     *
     * @param Request $request
     *
     * @return mixed
     */
    public function relation(Request $request)
    {
        
        $slug = $this->getSlug($request);
        //var_dump($slug);die();
        $page = $request->input('page');
        $on_page = 50;
        $search = $request->input('search', false);
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();


        $method = $request->input('method', 'add');

        $model = app($dataType->model_name);
        if ($method != 'add') {
            $model = $model->find($request->input('id'));
        }
        //var_dump($request->type);die();



        $this->authorize($method, $model);

        $rows = $dataType->{$method.'Rows'};
        foreach ($rows as $key => $row) {
            if ($row->field === $request->input('type')) {
                $options = $row->details;
                $model = app($options->model);
                $skip = $on_page * ($page - 1);

                $additional_attributes = $model->additional_attributes ?? [];

                // Apply local scope if it is defined in the relationship-options
                if (isset($options->scope) && $options->scope != '' && method_exists($model, 'scope'.ucfirst($options->scope))) {
                    $model = $model->{$options->scope}();
                }

                // If search query, use LIKE to filter results depending on field label
                if ($search) {
                    // If we are using additional_attribute as label
                    if (in_array($options->label, $additional_attributes)) {
                        $relationshipOptions = $model->all();
                        $relationshipOptions = $relationshipOptions->filter(function ($model) use ($search, $options) {
                            return stripos($model->{$options->label}, $search) !== false;
                        });
                        $total_count = $relationshipOptions->count();
                        $relationshipOptions = $relationshipOptions->forPage($page, $on_page);
                    } else {
                        $total_count = $model->where($options->label, 'LIKE', '%'.$search.'%')->count();
                        $relationshipOptions = $model->take($on_page)->skip($skip)
                            ->where($options->label, 'LIKE', '%'.$search.'%')
                            ->get();
                    }
                } else {
                    $total_count = $model->count();
                    $relationshipOptions = $model->take($on_page)->skip($skip)->get();
                }
                //CU: BUSCAR USERS AGRIMENSORES P/ SELECT DE CREAR EXPEDIENTES
                /*
                Paso 1 - comprobar que estoy en la consulta deseada
                Paso 2 - creo objeto con elementos a eliminar  (solo dejo los que tienen role_id == 3)
                Paso 3 - saco los elementos del objeto que obtuvo voyager con su jquery
                */
                //Paso 1 - comprobar que estoy en la consulta deseada
                if(($slug == "expedientes") && ($request->type == "expediente_belongsto_persona_relationship"))
                {// se que estoy en la relacion de expedientes y users
                    //voy a eliminar aquellos resultados que no son agentes de la dgr. es decir, voy a sacar los admin, y los agrimensores
                    //Paso 2 - creo objeto con elementos a eliminar  (solo dejo los que tienen role_id == 3)
                    $elementos_a_eliminar = []; // en este array pongo los indices de los elementos del array original para luego sacarlos
                    for ($i=0 , $indice_a_eliminar=0, $indice_elem_ordenados = 0; $i < count($relationshipOptions) ; $i++) { 
                        //var_dump($results[$i]["text"]);die();
                        if($relationshipOptions[$i]["role_id"] != 3 ) // significa que no es agrimensor
                        {
                            $elementos_a_eliminar [$indice_a_eliminar] = $i; // agrego los id de los exp q no son mios , luego los voy as sacar
                            $indice_a_eliminar++;// sumo la cantidad de registros que no son mios
                        }
                    }
                    //Paso 3 - saco los elementos del objeto que obtuvo voyager con su jquery
                    for ($y=0; $y < count($elementos_a_eliminar); $y++) { 
                        //voy a empezar a eliminar los registros que no son agrimensores
                        unset($relationshipOptions[$elementos_a_eliminar[$y]]);
                    }
                }
                //var_dump($relationshipOptions);die();
                $results = [];
                if (!$row->required && !$search && $page == 1) {
                    $results[] = [
                        'id'   => '',
                        'text' => __('voyager::generic.none'),
                    ];
                }
                // Sort results
                if (!empty($options->sort->field)) {
                    if (!empty($options->sort->direction) && strtolower($options->sort->direction) == 'desc') {
                        $relationshipOptions = $relationshipOptions->sortByDesc($options->sort->field);
                    } else {
                        $relationshipOptions = $relationshipOptions->sortBy($options->sort->field);
                    }
                }

                foreach ($relationshipOptions as $relationshipOption) {
                    $results[] = [
                        'id'   => $relationshipOption->{$options->key},
                        'text' => $relationshipOption->{$options->label},
                    ];
                }
                //var_dump($total_count);die();
                return response()->json([
                    'results'    => $results,
                    'pagination' => [
                        'more' => ($total_count > ($skip + $on_page)),
                    ],
                ]);
            }
        }

        /*
         
        

        */


        // No result found, return empty array
        return response()->json([], 404);
    }
}

