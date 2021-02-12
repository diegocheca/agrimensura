<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Log extends Model
{
    use SoftDeletes;
    protected $table = 'logs';

    protected $dates = ['deleted_at', 'created_at', 'updated_at'];
    
    
    protected $fillable = [
        'nombretabla',
        'accion',
        'valores_nuevos',
        'valores_viejos',
        'id_modificado',
        'estado',
        'created_by',
    ];
}
