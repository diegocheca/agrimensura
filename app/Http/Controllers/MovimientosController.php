<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Movimiento;
use App\Expediente;
use App\Area;
use App\Persona;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use App\Mail\MovimientoNuevoEmail;

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
       $mov = Movimiento::select('*')->where('id_expediente', '=', $id->id)->get();
       //var_dump($mov);die();
       return response()->json($mov);

    }
    public function traer_oficinas_para_select(){
        $oficinas = Area::select('id','nombre','descripcion')->get();
        return response()->json($oficinas);
    }
    
    public function traer_expediente_para_component($num_exp){
        $expediente = Expediente::select('*')->where('numero_expediente', '=', $num_exp)->first();
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
    
    public function crear_movimiento_desde_component(Request $request)
    {
        //Proceso a realizar
        /*
        Paso 1 - validar datos en el front
        Paso 2 - validar datos en el back
        Paso 3 - cerrar el movimiento anterior
        Paso 4 - crear nuevo movimiento
        Paso 5 - envio email a agrimensor asociado
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
        $movimento_nuevo->fecha_entrada = date("Y-m-d H:i:s");
        $movimento_nuevo->fecha_salida = null;
        $movimento_nuevo->comentario = $request->comentario;
        $movimento_nuevo->bandera_observacion = $bandera_observacion;
        $movimento_nuevo->subsanacion = $request->subsanacion;
        $movimento_nuevo->id_area = $request->id_area;
        $movimento_nuevo->id_expediente = $request->id_expdiente;
        $movimento_nuevo->tramite_finalizado = $bandera_fin;
        $movimento_nuevo->created_by = 1;
        $resultado_paso_4 = $movimento_nuevo->save();
        //Paso 5 - envio email a agrimensor asociado
        //obtener el email del agrimensor
        $exp = Expediente::select('*')->where('id','=',$request->id_expdiente)->first();
        
        $agrimensor = Persona::select('*')->where('id','=',$exp->id_persona)->first();
        
        $to_email = "diegochecarelli@gmail.com";
        //$to_email = $agrimensor->email;
        $area = Area::select('*')->where('id','=',$request->id_area)->first();
        //var_dump($agrimensor->nombre ,date("Y-m-d H:i:s") ,$request->comentario,
        //$bandera_observacion , $area->nombre, $bandera_fin, $request->id_expdiente, $exp->numero_expediente);die();
        Mail::to($to_email)->send(new MovimientoNuevoEmail($agrimensor->nombre ,date("Y-m-d H:i:s") ,$request->comentario,
        $bandera_observacion , $area->nombre, $bandera_fin, $request->id_expdiente, $exp->numero_expediente));
        //  Paso 6 - crear notificacion para empleados de la nueva area a la que va el expediente.
        //ni idea de esto

        // Paso 7 - hacer algo de confirmacion de pase o algo asi
        //ni idea de esto

        //if($resultado == "true")
        return response()->json("ok");

       // return response()->json([$request->all()]);
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
