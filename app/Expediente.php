<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Expediente extends Model
{
    use SoftDeletes;

    protected $table = 'expedientes';

    protected $dates = ['deleted_at'];

    protected $fillable = [
        'numero_expediente',
        'path_papeles',
        'id_tramite',
        'id_persona',
        'created_by',
    ];
}
