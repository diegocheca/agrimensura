<?php

namespace TCG\Voyager\Models;

use Carbon\Carbon;
use Illuminate\Foundation\Auth\User as Authenticatable;
use TCG\Voyager\Contracts\User as UserContract;
use TCG\Voyager\Traits\VoyagerUser;
//use TCG\Voyager\Traits\Translatable;
//use TCG\Voyager\Translatable;
use Illuminate\Database\Eloquent\SoftDeletes;

class User extends Authenticatable implements UserContract
{
    use VoyagerUser;
    //use Translatable;

    use SoftDeletes;
    protected $dates = ['created_at', 'updated_at','deleted_at'];



    
    //protected $translatable  = ['name', 'created_at'];
    protected $fillable = [
        'role_id',
        'name',
        'email',
        'avatar',
        'confirmed',
        'confirmation_code',
        'password',
        'domicilio',
        'cuil',
        'empleado_dgr',
        'created_by',
        'id_area',
        'oficina',
    ];
    protected $guarded = [];

    public $additional_attributes = ['locale'];

    public function getAvatarAttribute($value)
    {
        return $value ?? config('voyager.user.default_avatar', 'users/default.png');
    }

    public function setCreatedAtAttribute($value)
    {
        $this->attributes['created_at'] = Carbon::parse($value)->format('Y-m-d H:i:s');
    }

    public function setSettingsAttribute($value)
    {
        $this->attributes['settings'] = $value ? $value->toJson() : json_encode([]);
    }

    public function getSettingsAttribute($value)
    {
        return collect(json_decode($value));
    }

    public function setLocaleAttribute($value)
    {
        $this->settings = $this->settings->merge(['locale' => $value]);
    }

    public function getLocaleAttribute()
    {
        return $this->settings->get('locale');
    }
}
