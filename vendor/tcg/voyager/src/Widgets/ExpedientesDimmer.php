<?php

namespace TCG\Voyager\Widgets;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use App\Expediente;

class ExpedientesDimmer extends BaseDimmer
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $count = Expediente::select("*")->count();
        $string = "En el sistema se encuentran ".$count." expedientes creados"; 

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-company',
            'title'  => "{$string}",
            'text'   => __('Hasta el momento, usted creo '.$count.' expedeintes en el CPASJ'),
            'button' => [
                'text' => __('Administrar Expedientes'),
                'link' => route('voyager.expedientes.index'),
            ],
            'image' => voyager_asset('images/widget-backgrounds/expedientes.svg'),
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user()->can('browse', Voyager::model('Post'));
    }
}
