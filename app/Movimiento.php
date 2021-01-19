<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Movimiento extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = ['movimientos'];
    
    protected $fillable = [
        'fecha_entrada',
        'fecha_salida',
        'comentario',
        'bandera_observacion',
        'observacion',
        'subsanacion',
        'id_area',
        'id_expediente',
        'tramite_finalizado',
        'created_by'

    ];
    
}
