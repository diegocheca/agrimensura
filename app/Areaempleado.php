<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Areaempleado extends Model
{
    use SoftDeletes;
    protected $table = 'areaempleados';

    protected $dates = ['deleted_at'];
    protected $fillable = [
        'oficina',
        'id_area',
        'id_persona',
        'rol_usuario',
        'created_by'
  ];
}
