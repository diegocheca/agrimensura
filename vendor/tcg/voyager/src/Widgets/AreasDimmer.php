<?php

namespace TCG\Voyager\Widgets;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use App\Area;

class AreasDimmer extends BaseDimmer
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
        $count = Area::select("*")->count();
        $string = "En el sistema se encuentran ".$count." areas activas"; 

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-company',
            //'title'  => "{$count} {$string}",
            'title'  => "{$string}",
            'text'   => __('Hasta el momento, usted creo '.$count.' areas en el CPASJ'),
            'button' => [
                'text' => __('Administrar Areas'),
                'link' => route('voyager.areas.index'),
            ],
            'image' => voyager_asset('images/widget-backgrounds/areas.jpg'),
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
