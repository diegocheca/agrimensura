<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Persona extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $fillable = [
        'nombre',
        'apellido',
        'dni',
        'cuit',
        'email',
        'empleado_agrimensor',
        'domicilio'
    ];
}
