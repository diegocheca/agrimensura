<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Expediente;
use TCG\Voyager\Models\User;
use App\Movimiento;


class BuscadorController extends Controller
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

    public function consulta_web(Request $request)
    {
        //Pasos para buscar
        //Paso 1 : validar en el front
        //Paso 2 : validar en el back
        //Paso 3 : realizar consulta
        $expediente = Expediente::select('*')
        ->orWhere('numero_expediente', 'like', '%' . $request->numero . '%')
        //->orWhere('name', 'like', '%' . $request->profesional . '%')
        //->orWhere('numero_expediente', 'like', '%' . $request->numero . '%')
        //->where('numero_expediente', '=' , $request->numero)
        ->get();
        //var_dump(count($expediente));
        //$expediente = Expediente::find($request->numero);
        return response()->json($expediente);
        
       /* var_dump($request->numero);
        var_dump($request->profesional);
        var_dump($request->movimientos);*/
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
