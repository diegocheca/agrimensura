<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Contact extends Model
{
    use SoftDeletes;
    
    public $table = 'contacts';
    public $fillable = ['name','email','message','estado'];
}