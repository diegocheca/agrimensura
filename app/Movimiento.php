<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Movimiento extends Model
{
    use SoftDeletes;
    protected $table = 'movimientos';

    protected $dates = ['deleted_at', 'fecha_entrada', 'fecha_salida','created_at'];
    
    
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
        'created_by',
        'created_at',

    ];
    
}
