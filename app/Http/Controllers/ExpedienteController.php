<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Tramite;
use App\Persona;

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
}
