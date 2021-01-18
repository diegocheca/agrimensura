<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Contact extends Model
{
    use SoftDeletes;
    
    public $table = 'contacts';
    protected $dates = ['deleted_at'];
    
    public $fillable = ['name','email','message','estado'];
}