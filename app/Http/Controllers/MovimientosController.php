<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Movimiento;
use App\Expediente;
use App\Area;

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
        //
        //return "todo bien x aca";
        return response()->json([$request->all()]);
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
