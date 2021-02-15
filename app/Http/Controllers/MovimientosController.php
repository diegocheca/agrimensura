<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Movimiento;
use App\Expediente;
use App\Area;
use App\Persona;
use App\Log;
use Carbon\Carbon;
use Auth;
use Illuminate\Support\Facades\Mail;
use App\Mail\MovimientoNuevoEmail;
use App\Mail\MovimientoConSubsanacionEmail;

use TCG\Voyager\Models\User;

class MovimientosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }
    
    public function probando_la_fecha()
    {
        //
        // $mov = Movimiento::select('*')->where('id', '=', 2)->get();
        // $mov = $mov->toJson();
        $mov = Movimiento::first()->created_at;
        //var_dump($mov->diffForHumans());
        Carbon::setLocale('es');
        setlocale(LC_TIME, 'es_AR.UTF-8');
        $date = Carbon::now()->locale('es_AR.UTF-8');
        //echo $date->locale();
        echo "\n";
        //echo $date->monthName;
        echo "\n";
        echo $date->isoFormat('LLLL');
        echo "\n";
        $date = Carbon::now('America/Argentina/Salta');
        //echo Carbon::parse($date)->formatLocalized('%d %B %Y');
        //var_dump(Carbon::parse($mov)->formatLocalized('%d %B %Y'));
    }
    public function traer_movimientos_para_expediente($numero)
    {
       //var_dump($numero);die();
       $id = Expediente::select('id')->where('numero_expediente', '=', $numero)->first();
       //var_dump($id->id);die();
       $mov = Movimiento::select('movimientos.id','movimientos.orden','movimientos.fecha_entrada','movimientos.fecha_salida','movimientos.comentario','movimientos.bandera_observacion','movimientos.observacion','movimientos.subsanacion','movimientos.id_area','movimientos.id_expediente','movimientos.tramite_finalizado','movimientos.confirmado','movimientos.fecha_confirmacion','movimientos.quien_confirmacion','movimientos.comentario_confirmacion','movimientos.created_by','areas.nombre')
       ->join('areas','areas.id','=', 'movimientos.id_area')
       ->where('id_expediente', '=', $id->id)
       ->orderBy('movimientos.created_at', 'desc')->get();
       //var_dump($mov);die();
       return response()->json($mov);

    }
    public function traer_oficinas_para_select(){
        $oficinas = Area::select('id','nombre','descripcion')->get();
        return response()->json($oficinas);
    }
    
    public function traer_expediente_para_component($num_exp){
        $expediente = Expediente::select('expedientes.*', 'tramites.nombre as nomtramite')
        ->join('tramites', 'tramites.id', '=', 'expedientes.id_tramite')
        ->where('numero_expediente', '=', $num_exp)->first();
        //$ultimo_movimiento = Movimiento::select('*')->where('id_expediente','=', $expediente->id)->get();
        //$expediente = Expediente::join('movimientos', 'movimientos.id_area', '=', 'expedientes.')select('*')->where('numero_expediente', '=', $num_exp)->first();
        //var_dump($ultimo_movimiento);die();

        return response()->json($expediente);
    }
    public function traer_ultimo_mov_exp($num_exp){
        $expediente = Expediente::select('*')->where('numero_expediente', '=', $num_exp)->first();
        $ultimo_movimiento = Movimiento::join('areas', 'areas.id', '=', 'movimientos.id_area')->select('movimientos.*', 'areas.nombre')->where('movimientos.id_expediente','=', $expediente->id)->latest('created_at')->first();
        //$expediente = Expediente::join('movimientos', 'movimientos.id_area', '=', 'expedientes.')select('*')->where('numero_expediente', '=', $num_exp)->first();
        //var_dump($ultimo_movimiento);die();

        return response()->json($ultimo_movimiento);

        
        
    }
    public function traer_penultimo_mov_exp($num_exp){
        $expediente = Expediente::select('*')->where('numero_expediente', '=', $num_exp)->first();
        $ultimo_movimiento = Movimiento::select('*')->where('movimientos.id_expediente','=', $expediente->id)->latest('created_at')->first();
        //$ordennuevo = intval($ultimo_movimiento->orden)-1;
        //var_dump($ordennuevo);die();
        $penultimo_movimiento = Movimiento::
        join('areas', 'areas.id', '=', 'movimientos.id_area')
        ->select('movimientos.*', 'areas.nombre')
        ->where('movimientos.orden','=', intval($ultimo_movimiento->orden)-1)
        ->where('movimientos.id_expediente','=', $expediente->id)
        ->first();
        return response()->json($penultimo_movimiento);
    }

    public function traer_ultimo_mov_exp_ajax($num_exp){
        $expediente = Expediente::select('*')->where('numero_expediente', '=', $num_exp)->first();
        $ultimo_movimiento = Movimiento::join('areas', 'areas.id', '=', 'movimientos.id_area')
        ->join('expedientes', 'expedientes.id', '=', 'movimientos.id_expediente')
        ->join('users', 'users.id', '=', 'expedientes.id_persona')
        ->select('movimientos.*', 'areas.nombre', 'users.name as profesional', 'users.email as profesionalemail')
        ->where('movimientos.id_expediente','=', $expediente->id)
        ->latest('created_at')
        ->first();
        //$expediente = Expediente::join('movimientos', 'movimientos.id_area', '=', 'expedientes.')select('*')->where('numero_expediente', '=', $num_exp)->first();
        //var_dump($ultimo_movimiento);die();

        return response()->json($ultimo_movimiento);
        
    }
    
    public function traer_datos_creado_exp($num_exp){
        $expediente = Expediente::select('*')->where('numero_expediente', '=', $num_exp)->first();
        
        $persona = User::select('*')->where('id','=', $expediente->id_persona)->first();
        //$expediente = Expediente::join('movimientos', 'movimientos.id_area', '=', 'expedientes.')select('*')->where('numero_expediente', '=', $num_exp)->first();
        //var_dump($persona);die();

        return response()->json($persona);
        
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }
    
    public function devolver_movimiento_desde_component($id_mov){
        /* PASOS A SEGUIR PARA HACER ESTA FUNCION:
        Paso 1 - Buscar el movimiento actual
        Paso 2 - guardar el log
        Paso 3 - eliminar el ultimo movimiento
        Paso 4 - buscar el movimiento anterior
        Paso 5 - modificar el ultimo movimiento
        Paso 6 - actualizar el registro
        Paso 7 responder en base a los resultados
        */
        $movimiento_a_borrar = Movimiento::find($id_mov);
        $orden_anterior = $movimiento_a_borrar["orden"];
        //var_dump($movimiento_a_borrar);
        //var_dump("-----------------------");
        //Paso 2 - guardar el log
        $valor_anteriores ="
        {
            'orden': ".(string)$movimiento_a_borrar->orden.",
            'fecha_entrada': '".(string)$movimiento_a_borrar->fecha_entrada."',
            'fecha_salida': '".(string)$movimiento_a_borrar->fecha_salida."',
            'comentario': '".(string)$movimiento_a_borrar->comentario."',
            'bandera_observacion': ".(string)$movimiento_a_borrar->bandera_observacion.",
            'observacion': '".(string)$movimiento_a_borrar->observacion."',
            'subsanacion': '".(string)$movimiento_a_borrar->subsanacion."',
            'id_area': ".(string)$movimiento_a_borrar->id_area.",
            'id_expediente': ".(string)$movimiento_a_borrar->id_expediente.",
            'tramite_finalizado': ".(string)$movimiento_a_borrar->tramite_finalizado.",
            'confirmado': ".(string)$movimiento_a_borrar->confirmado.",
            'fecha_confirmacion': '".(string)$movimiento_a_borrar->fecha_confirmacion."',
            'quien_confirmacion': ".(string)$movimiento_a_borrar->quien_confirmacion.",
            'comentario_confirmacion': '".(string)$movimiento_a_borrar->comentario_confirmacion."',
            'created_by': ".(string)$movimiento_a_borrar->created_by.",
        }";
        $log = new Log;
        $log->nombretabla = 'Movimiento';
        $log->accion = 'delete';
        $log->valores_nuevos = null;
        $log->valores_viejos = $valor_anteriores;
        $log->id_modificado = $id_mov ;
        $log->estado = 'sin ver'; // "sin ver" - "sin aprobar" - "apronado" - "devuelto" - "archivado"
        $log->created_by = Auth::user()->id;
        $resultado2 = $log->save();
        //Paso 3 - eliminar el ultimo movimiento
        $resultado3 = $movimiento_a_borrar->delete();
        //var_dump($resultado2);
        //var_dump("-----------------------");
        //Paso 4 - buscar el movimiento anterior
        $movimiento_anterior = Movimiento::select('*')->where('id', '=', intval($id_mov)-1)->first();
        //var_dump($movimiento_anterior);
        //var_dump("-----------------------");
        //Paso 5 - modificar el ultimo movimiento
        $movimiento_anterior->fecha_salida = null;
        $movimiento_anterior->confirmado = 0;
        $movimiento_anterior->fecha_confirmacion = null;
        $movimiento_anterior->quien_confirmacion = null;
        $movimiento_anterior->comentario_confirmacion = null;
        //Paso 6 - actualizar el registro
        $resultado5= $movimiento_anterior->save();
        //var_dump($resultado5);
        //var_dump("-----------------------");
        //Paso 7 responder en base a los resultados
        if($resultado2 && $resultado5 && $resultado3)
            return response('ok', 200);
        else return response('mal', 200);
    }
    
    public function crear_movimiento_desde_component(Request $request)
    {
        //Proceso a realizar
        /*
        CU: CREAR MOVIMIENTO
        Paso 1 - validar datos en el front
        Paso 2 - validar datos en el back
        Paso 3 - obtener el orden relativo del ultimo movimiento
        Paso 3 - cerrar el movimiento anterior / le pongo fecha salida y obtengo el ultimo orden de mov
        Paso 4 - crear nuevo movimiento

        // El PASO 5 se suspende xq pasa a estar al momento de recibir el expediente
        Paso 5 - veo si tiene subsanacion o no
        Paso 5.1 - Caso: No tiene subsanacion -->envio email a agrimensor asociado
        Paso 5.2 - Caso: Si tiene subsanacion -->envio email de subsanacion

        Paso 6 - crear notificacion para empleados de la nueva area a la que va el expediente.
        Paso 7 - hacer algo de confirmacion de pase o algo asi
        Paso 8 - Fin
        */
        //  Paso 2:validar los datos
        // Paso 3: cerrar el movimiento anterior
        $ultimo_movimiento = Movimiento::select('*')->where('movimientos.id_expediente','=', $request->id_expdiente)->latest('created_at')->first();
        $ultimo_movimiento->fecha_salida = date("Y-m-d H:i:s");
        $resultado_paso_3 = $ultimo_movimiento->save();
        //Paso 4 - crear nuevo movimiento
        $bandera_observacion = $request->bandera_observacion === 'true'? true: false;
        $bandera_fin = $request->tramite_finalizado === 'true'? true: false;
        $movimento_nuevo = new Movimiento;
        if($bandera_fin == true) // entonces se termina el expediente
        {
            $movimento_nuevo->id_area = 9; // id fijo del departamento archivo
        }
        else // entonces es un movimiento intermedio
        {
            $movimento_nuevo->id_area = $request->id_area;
        }
        $movimento_nuevo->orden = intval($ultimo_movimiento->orden)+1;
        $movimento_nuevo->fecha_entrada = date("Y-m-d H:i:s");
        $movimento_nuevo->fecha_salida = null;
        $movimento_nuevo->comentario = $request->comentario;
        $movimento_nuevo->bandera_observacion = $bandera_observacion;
        $movimento_nuevo->observacion = $request->observacion;
        $movimento_nuevo->subsanacion = $request->subsanacion;
        //$movimento_nuevo->id_area = $request->id_area;
        $movimento_nuevo->id_expediente = $request->id_expdiente;
        $movimento_nuevo->tramite_finalizado = $bandera_fin;
        $movimento_nuevo->confirmado = 0;
        $movimento_nuevo->fecha_confirmacion = null ;
        $movimento_nuevo->quien_confirmacion= null ;
        $movimento_nuevo->comentario_confirmacion = null;
        $movimento_nuevo->created_by = Auth::user()->id;
        $resultado_paso_4 = $movimento_nuevo->save();
        //PASO 5 suspendido , pasa a formar porte de la recepcion del expediente
        /*
        //Paso 5 - envio email a agrimensor asociado
        //obtener el email del agrimensor
        $exp = Expediente::select('*')->where('id','=',$request->id_expdiente)->first();
        $agrimensor = User::select('email')->where('id','=',$exp->id_persona)->first();
        $to_email = "diegochecarelli@gmail.com";
        //$to_email = $agrimensor->email;
        $area = Area::select('*')->where('id','=',$request->id_area)->first();
        //var_dump($agrimensor->nombre ,date("Y-m-d H:i:s") ,$request->comentario,
        //$bandera_observacion , $area->nombre, $bandera_fin, $request->id_expdiente, $exp->numero_expediente);die();
        if($movimento_nuevo->subsanacion == null )
        {// este es el caso de un movimiento normal sin subsanacion
            Mail::to($to_email)->send(new MovimientoNuevoEmail($agrimensor->nombre ,date("Y-m-d H:i:s") ,$request->comentario,
            $bandera_observacion , $area->nombre, $bandera_fin, $request->id_expdiente, $exp->numero_expediente));
        }
        else{
            //movimiento con subsanacion
            Mail::to($to_email)->send(new MovimientoConSubsanacionEmail($agrimensor->nombre ,date("Y-m-d H:i:s") ,$request->comentario,
            $bandera_observacion , $area->nombre, $bandera_fin, $request->id_expdiente, $exp->numero_expediente));

        }


        //Mail::to($to_email)->send(new MovimientoNuevoEmail($agrimensor->nombre ,date("Y-m-d H:i:s") ,$request->comentario,
        //$bandera_observacion , $area->nombre, $bandera_fin, $request->id_expdiente, $exp->numero_expediente));
        */
        //Fin Paso 5
        
        //  Paso 6 - crear notificacion para empleados de la nueva area a la que va el expediente.
        //ni idea de esto

        // Paso 7 - hacer algo de confirmacion de pase o algo asi
        //ni idea de esto

        //Paso 8 - guardar el log

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
        }";

        $log = new Log;
        $log->nombretabla = 'Movimiento';
        $log->accion = 'add';
        $log->valores_nuevos = $valor_nuevos;
        $log->valores_viejos = null;
        $log->id_modificado = $movimento_nuevo->id ;
        $log->estado = 'sin ver'; // "sin ver" - "sin aprobar" - "apronado" - "devuelto" - "archivado"
        $log->created_by = Auth::user()->id;
        $resultado8 = $log->save();

        //if($resultado == "true")
        return response()->json("ok");

       // return response()->json([$request->all()]);
    }
    //es llamada desde un modal de vuejs
    public function recibir_exp_por_movimiento(Request $request)
    {
        //
        /*Paso a segir:
        Paso 1: buscar el registro del mov
        Paso 2: crear objeeto actualizado
        Paso 3: actualizar
        Paso 4 - veo si tiene subsanacion o no
        Paso 4.1 - Caso: No tiene subsanacion -->envio email a agrimensor asociado
        Paso 4.2 - Caso: Si tiene subsanacion -->envio email de subsanacion
        */
        //Paso 1
        $moviento_a_actualizar = Movimiento::find($request->movimiento_id);
        //Fin Paso 1
        //Paso 2
        $moviento_a_actualizar->confirmado = 1;
        $moviento_a_actualizar->fecha_confirmacion = date("Y-m-d H:i:s");
        $moviento_a_actualizar->quien_confirmacion = Auth::user()->id;
        $moviento_a_actualizar->comentario_confirmacion = $request->comentario_confirmacion;
        //Fin Paso 2
        //Paso 3
        $resultado_update = $moviento_a_actualizar->save();
        //Fin Paso 3
        //Paso 4 - envio email a agrimensor asociado
        //obtener el email del agrimensor
        $exp = Expediente::find($moviento_a_actualizar->id_expediente);
        $agrimensor = User::find($exp->id_persona);
        $to_email = "diegochecarelli@gmail.com"; // esto en desarrollo
        //$to_email = $agrimensor->email; esto es en produccion
        $area = Area::find($moviento_a_actualizar->id_area);
        //$bandera_observacion , $area->nombre, $bandera_fin, $request->id_expdiente, $exp->numero_expediente);die();
        $bandera_observacion = ($request->comentario!= null) ? true : false;
        $bandera_fin = false; // no puede ser final si estoy recibiendo

        if($moviento_a_actualizar->subsanacion == null )
        {// este es el caso de un movimiento normal sin subsanacion
            Mail::to($to_email)->send(new MovimientoNuevoEmail($agrimensor->name ,date("Y-m-d H:i:s") ,$request->comentario,
            $bandera_observacion , $area->nombre, $bandera_fin, $exp->id, $exp->numero_expediente));
        }
        else{
            //movimiento con subsanacion
            Mail::to($to_email)->send(new MovimientoConSubsanacionEmail($agrimensor->name ,date("Y-m-d H:i:s") ,$request->comentario,
            $bandera_observacion , $area->nombre, $bandera_fin, $exp->id, $exp->numero_expediente, $moviento_a_actualizar->subsanacion));
        }
        //Fin Paso 4
        if($resultado_update)
            return response()->json("ok");
        else
            return response()->json("mal");
        //Mail::to($to_email)->send(new MovimientoNuevoEmail($agrimensor->nombre ,date("Y-m-d H:i:s") ,$request->comentario,
        //$bandera_observacion , $area->nombre, $bandera_fin, $request->id_expdiente, $exp->numero_expediente));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }
    
    

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
