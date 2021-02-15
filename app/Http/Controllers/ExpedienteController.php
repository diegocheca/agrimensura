<?php

namespace App\Http\Controllers;

use App\Expediente;
use Illuminate\Http\Request;
use App\Tramite;
use App\Persona;
use Auth;
use App\Movimiento;
use App\Log;
use Illuminate\Support\Facades\Mail;
use App\Mail\AvisoFinalizoExpedienteEmail;
use TCG\Voyager\Models\User;

class ExpedienteController extends Controller
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
    public function traer_nombres_archivos_tramites($id_tramite_a_buscar)
    {
        //
        $tramite = Tramite::select('file1','file2','file3','file4','file5','file6','file7','file8','file9','file10','file11','file12','file13','file14','file15','file16','file17')->where('id', '=', $id_tramite_a_buscar)->get();
        return response()->json($tramite);

    }
    /*
    se llama desde una funcion de jquery, cuando se esta creando un nuevo expediente
    sirve para llenar el select de personas , con personas que sean profesionales solamente */
    public function traer_personas_profesionales()
    {
        
        $profecionales =  Persona::select('id', 'nombre', 'apellido')->where('empleado_agrimensor', '=', 0)->get();
        return response()->json(['data' => $profecionales]);

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
    public function buscador(Request $request)
    {
        $numero = $request->query;
        $expedientes = Expediente::where('numero_expediente','like','%'.$numero.'%')->get();
        return response()->json($expedientes);

    }
    public function traer_exp_buscador()
    {
        $expedientes = Expediente::select('id', 'numero_expediente','id_tramite', 'id_persona')->get();
        return response()->json($expedientes);

    }
    public function archivar_expediente_desde_componente($num_exp)
    {
        /*Pasos a seguir para archivar un expediente
        Paso 1: comprobar permisos del usuario
        Paso 2 - buscar expdiente a archivar
        Paso 3 - crear log de modificacion de expediente
        Paso 4 - buscar el ultimo movimiento del expediente
        Paso 5 - crear log de modificacion del ultimo movimiento
        Paso 6 - editar el expediente con la bandarea finalizo en 1
        Paso 7 - editar el ultimo movimiento del expediente con la bandarea tramite_finalizado en 1
        Paso 8 - crear notificacion interna
        Paso 9 - notificar al profesional

        */
        //Paso 1: comprobar permisos del usuario
        // Paso 2: crear log

        if(
            (Auth::user()->role_id == 1) // es admin
            ||
            (Auth::user()->role_id == 5) // es directivo
            ||
            (
                (Auth::user()->role_id == 4) // es empleado dgr
                &&
                (Auth::user()->id_area == 9) // es del dpto archivo
            )
        )
        {
            //Paso 2 - buscar expdiente a archivar
            $expediente = Expediente::select('id', 'numero_expediente','id_tramite', 'id_persona')->where('numero_expediente', '=', $num_exp)->first();
            //Fin paso 2
            //Paso 3 - crear log
            $valor_nuevos ="
            {
                'id': '".(string)$expediente->id."',
                'numero_expediente': '".(string)$expediente->numero_expediente."',
                'path_papeles': ".(string)$expediente->path_papeles.",
                'id_tramite': ".(string)$expediente->id_tramite.",
                'id_persona': '".(string)$expediente->id_persona."',
                'file1': ".(string)$expediente->file1.",
                'file2': ".(string)$expediente->file2.",
                'file3': ".(string)$expediente->file3.",
                'file4': ".(string)$expediente->file4.",
                'file5': ".(string)$expediente->file5.",
                'file6': ".(string)$expediente->file6.",
                'file7': ".(string)$expediente->file7.",
                'file8': ".(string)$expediente->file8.",
                'file9': ".(string)$expediente->file9.",
                'file10': ".(string)$expediente->file10.",
                'file11': ".(string)$expediente->file11.",
                'file12': ".(string)$expediente->file12.",
                'file13': ".(string)$expediente->file13.",
                'file14': ".(string)$expediente->file14.",
                'file15': ".(string)$expediente->file15.",
                'file16': ".(string)$expediente->file16.",
                'file17': ".(string)$expediente->file17.",
                'finalizo': ".(string)$expediente->finalizo.",
                'created_by': ".(string)$expediente->created_by.",
                'comentario_de_log': 'valores del expediente antes de ser marcado como finalizado'
            }";

            $log = new Log;
            $log->nombretabla = 'Expedientes';
            $log->accion = 'edit';
            $log->valores_nuevos = $valor_nuevos;
            $log->valores_viejos = null;
            $log->id_modificado = $expediente->id ;
            $log->estado = 'sin ver'; // "sin ver" - "sin aprobar" - "apronado" - "devuelto" - "archivado"
            $log->created_by = Auth::user()->id;
            $resultado3 = $log->save();
            //fin paso 3
            //paso 4 buscar datos del ultimo movimiento
            $ultimo_movimiento = Movimiento::join('areas', 'areas.id', '=', 'movimientos.id_area')->select('movimientos.*', 'areas.nombre')->where('movimientos.id_expediente','=', $expediente->id)->latest('created_at')->first();
            //Fin paso 4    
            // paso 5 - crear log de movimiento
            $valor_nuevos ="
            {
                'orden': ".(string)$ultimo_movimiento->orden.",
                'fecha_entrada': '".(string)$ultimo_movimiento->fecha_entrada."',
                'fecha_salida': '".(string)$ultimo_movimiento->fecha_salida."',
                'comentario': '".(string)$ultimo_movimiento->comentario."',
                'bandera_observacion': ".(string)$ultimo_movimiento->bandera_observacion.",
                'observacion': '".(string)$ultimo_movimiento->observacion."',
                'subsanacion': '".(string)$ultimo_movimiento->subsanacion."',
                'id_area': ".(string)$ultimo_movimiento->id_area.",
                'id_expediente': ".(string)$ultimo_movimiento->id_expediente.",
                'tramite_finalizado': ".(string)$ultimo_movimiento->tramite_finalizado.",
                'confirmado': ".(string)$ultimo_movimiento->confirmado.",
                'fecha_confirmacion': '".(string)$ultimo_movimiento->fecha_confirmacion."',
                'quien_confirmacion': ".(string)$ultimo_movimiento->quien_confirmacion.",
                'comentario_confirmacion': '".(string)$ultimo_movimiento->comentario_confirmacion."',
                'created_by': ".(string)$ultimo_movimiento->created_by.",
                'comentario_de_log': 'valores del ultimo movimiento del expediente antes de ser marcado como tramite_finalizado'
            }";

            $log2 = new Log;
            $log2->nombretabla = 'Movimientos';
            $log2->accion = 'edit';
            $log2->valores_nuevos = $valor_nuevos;
            $log2->valores_viejos = null;
            $log2->id_modificado = $ultimo_movimiento->id ;
            $log2->estado = 'sin ver'; // "sin ver" - "sin aprobar" - "apronado" - "devuelto" - "archivado"
            $log2->created_by = Auth::user()->id;
            $resultado5 = $log2->save();
            //Fin paso 5
            //Paso 6 - editar el expediente con la bandarea finalizo en 1
            $expediente->finalizo = true;
            $resultado6 = $expediente->save();
            //Fin paso 6
            //Paso 7 - editar el ultimo movimiento del expediente con la bandarea tramite_finalizado en 1
            $ultimo_movimiento->tramite_finalizado = true;
            $ultimo_movimiento->fecha_salida = date("Y-m-d H:i:s");
            $resultado7 = $ultimo_movimiento->save();
            //Fin paso 7
            //Paso 8 - crear notificacion interna
            //SUSPENDIDO
            //Fin paso 8
            //Paso 9 - notificar al profesional
            $agrimensor = User::find($expediente->id_persona);
            $to_email = "diegochecarelli@hotmail.com"; // esto en desarrollo
            //$to_email = $agrimensor->email; esto es en produccion
                Mail::to($to_email)->send(new AvisoFinalizoExpedienteEmail(
                    $agrimensor->name,
                    date("Y-m-d H:i:s"),
                    $expediente->numero_expediente,
                    $expediente->id));
            //Fin paso 9
            return response()->json($expediente);
        }
        else{ // no tenien permisos
            return response("usted no tiene permisos");
        }
        

    }
    public function expediente_finalizado($num_exp){
        $expediente = Expediente::select( 'finalizo')->where('numero_expediente', '=', $num_exp)->first();
        return response()->json($expediente->finalizo);
    }
    public function revisar_si_soy_agrimensor(){
        if(Auth::user()->role_id == 3)
            return response()->json(1);
        else return response()->json(0);
    }
    
    
    
}
