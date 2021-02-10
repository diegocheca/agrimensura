@extends('voyager::master')

@section('page_title', __('voyager::generic.'.(isset($dataTypeContent->id) ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.(isset($dataTypeContent->id) ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular') }}
    </h1>
@stop

@section('content')
    <div class="page-content container-fluid">
        <form class="form-edit-add" role="form"
              action="@if(!is_null($dataTypeContent->getKey())){{ route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) }}@else{{ route('voyager.'.$dataType->slug.'.store') }}@endif"
              method="POST" enctype="multipart/form-data" autocomplete="off">
            <!-- PUT Method if we are editing -->
            @if(isset($dataTypeContent->id))
                {{ method_field("PUT") }}
            @endif
            {{ csrf_field() }}

            @php 
                isset($dataTypeContent->id) ? $soyagrimensor= true : $soyagrimensor=false ;
            @endphp

            <div class="row">
                <div class="col-md-8">
                    <div class="panel panel-bordered">
                    {{-- <div class="panel"> --}}
                        @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        <div class="panel-body">
                            <div class="form-group">
                                <label for="name">{{ __('voyager::generic.name') }}</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="{{ __('voyager::generic.name') }}"
                                       value="{{ old('name', $dataTypeContent->name ?? '') }}" 
                                        @if($soyagrimensor) 
                                            disabled
                                        @endif
                                >
                            </div>

                            <div class="form-group">
                                <label for="email">{{ __('voyager::generic.email') }}</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="{{ __('voyager::generic.email') }}"
                                       value="{{ old('email', $dataTypeContent->email ?? '') }}">
                            </div>

                            <div class="form-group">
                                <label for="password">{{ __('voyager::generic.password') }}</label>
                                @if(isset($dataTypeContent->password))
                                    <br>
                                    <small>{{ __('voyager::profile.password_hint') }}</small>
                                @endif
                                <input type="password" class="form-control" id="password" name="password" value="" autocomplete="new-password">
                            </div>

                            @can('editRoles', $dataTypeContent)
                                <div class="form-group">
                                    <label for="default_role">{{ __('voyager::profile.role_default') }}</label>
                                    @php
                                        $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows' )};

                                        $row     = $dataTypeRows->where('field', 'user_belongsto_role_relationship')->first();
                                        $options = $row->details;
                                    @endphp
                                    @include('voyager::formfields.relationship')
                                </div>
                                <div class="form-group">
                                    <label for="additional_roles">{{ __('voyager::profile.roles_additional') }}</label>
                                    @php
                                        $row     = $dataTypeRows->where('field', 'user_belongstomany_role_relationship')->first();
                                        $options = $row->details;
                                    @endphp
                                    @include('voyager::formfields.relationship')
                                </div>
                            @endcan
                            @php
                                if (isset($dataTypeContent->locale)) {
                                    $selected_locale = $dataTypeContent->locale;
                                } else {
                                    $selected_locale = config('app.locale', 'en');
                                }

                            @endphp
                            <div class="form-group" 
                                @if($soyagrimensor) 
                                 style="display:none"
                                @endif
                            >
                                <label for="locale">{{ __('voyager::generic.locale') }}</label>
                                <select class="form-control select2" id="locale" name="locale">
                                    @foreach (Voyager::getLocales() as $locale)
                                    <option value="{{ $locale }}"
                                    {{ ($locale == $selected_locale ? 'selected' : '') }}>{{ $locale }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="domicilio">Domicilio</label>
                                <input type="text" class="form-control" id="domicilio" name="domicilio" placeholder="Ingrese el domicilio por favor"
                                       value="{{ old('domicilio', $dataTypeContent->domicilio ?? '') }}">
                            </div>
                            <div class="form-group">
                                <label for="cuil">CUIL</label>
                                <input type="text" class="form-control" id="cuil" name="cuil" placeholder="Ingrese el cuil por favor"
                                       value="{{ old('cuil', $dataTypeContent->cuil ?? '') }}">
                            </div>
                            
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="panel panel panel-bordered panel-warning">
                        <div class="panel-body">
                            <div class="form-group">
                                @if(isset($dataTypeContent->avatar))
                                    <img src="{{ filter_var($dataTypeContent->avatar, FILTER_VALIDATE_URL) ? $dataTypeContent->avatar : Voyager::image( $dataTypeContent->avatar ) }}" style="width:200px; height:auto; clear:both; display:block; padding:2px; border:1px solid #ddd; margin-bottom:10px;" />
                                @endif
                                <input type="file" data-name="avatar" name="avatar">
                            </div>
                            <hr>
                            @if($dataTypeContent->confirmed != 1 )
                            <div class="form-group">
                                <div class="alert alert-warning" role="alert">
                                    Esta cuenta no ha verificado su email
                                </div>
                            </div>
                            @else
                            <div class="form-group">
                                <div class="alert alert-success" role="alert">
                                    Esta cuenta de email verificada exitosamente
                                </div>
                            </div>
                            @endif
                            @if(!$soyagrimensor) 
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <label class="control-label" for="empleado_dgr">Es empleado de la DGR?</label>
                                            <span class="glyphicon glyphicon-question-sign" aria-hidden="true" data-toggle="tooltip"  data-placement="right" data-html="true" title="" data-original-title="Es empleado de la DGR? Si es así, entonces el esta opcion debe estar marcada." ></span>
                                    </div>
                                    <div class="col-md-6">
                                        @if ( $dataTypeContent->empleado_dgr == 1 )
                                            <input type="checkbox" style="width:95%" checked name="empleado_dgr" id="empleado_dgr" class="toggleswitch" data-on="Si, trabaja DGR" data-off="No, es agrimensor continuar">
                                        @else
                                            <input type="checkbox" style="width:95%" name="empleado_dgr" id="empleado_dgr" class="toggleswitch" data-on="Si, trabaja DGR" data-off="No, es agrimensor continuar">
                                        @endif    
                                    </div>
                                </div>
                                <hr>
                                <br>
                                <div class="form-group" id="div_id_area">
                                    <label for="id_area">Area a la que pertenece</label> <span>(Actual:{{ old('id_area', $dataTypeContent->id_area ?? '') }} )</span>
                                    <input type="hidden" id="id_area_anterior" name="id_area_anterior" value="{{ old('id_area', $dataTypeContent->id_area ?? '') }}"/>
                                
                                        <select class="form-control" id="id_area" name="id_area">
                                        <option>Cargando</option>
                                        </select>
                                </div>
                                <div class="form-group" id="div_oficina">
                                    <label for="oficina">Oficina dentro del area</label>
                                    <input type="text" class="form-control" id="oficina" name="oficina" placeholder="Ingrese la oficina a la que pertence por favor"
                                        value="{{ old('oficina', $dataTypeContent->oficina ?? '') }}">
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary pull-right save">
                {{ __('voyager::generic.save') }}
            </button>
        </form>
        <iframe id="form_target" name="form_target" style="display:none"></iframe>
        <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post" enctype="multipart/form-data" style="width:0px;height:0;overflow:hidden">
            {{ csrf_field() }}
            <input name="image" id="upload_file" type="file" onchange="$('#my_form').submit();this.value='';">
            <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
        </form>
    </div>
@stop

@section('javascript')
    <script>
    //mis funciones 
    function cargar_areas(){
            var mi_area = $('input[name="id_area_anterior"]').val(); 
            //alert("mi area es:"+mi_area);
            console.log(mi_area);
            //$("[name='id_area']").html('');
            $.ajax({
                type:'get',
                url: 'http://localhost:8000/oficinas_para_add_mov',
                dataType: 'json',   
                success: function(response){
                    var len = 0;
                    if (response != null) {
                        len = response.length;
                    }
                    //console.log(len);
                    if (len>0) {
                        var option = '<option value=0 selected>Ninguna</option>';
                        for (var i = 0; i<len; i++) {
                            var id = response[i].id;
                            var name = response[i].nombre;
                            if(mi_area == id) var option = option+"<option selected value='"+id+"'>"+name+"</option>"; 
                            else var option = option+"<option value='"+id+"'>"+name+"</option>"; 
                        }
                        $("[name='id_area']").html(option);
                    }
                },
                error: function(d)
                {
                    alert (d);
                    console.log("el error es:");
                    console.log(d);
                }
            });
            return false;
        }
    //fin mis funciones
        $('document').ready(function () {
            $('.toggleswitch').bootstrapToggle();
            //mis cosas
            cargar_areas();
            //fin mis cosas
            $("#div_id_area").hide();
            $("#div_oficina").hide();
            
            $('#empleado_dgr').change(function() {
                if(this.checked) {
                    var returnVal = confirm("Estas seguro que esta persona trabaja en la DGC?");
                    console.log(returnVal);
                    if(returnVal.toString() == "true")
                    {
                        //significa que si es un empleado de la dgc, por tanto habilito el campo de area y ofcina
                        $(this).prop("checked", returnVal);
                        $("[name='id_area']").val(0);
                        $("[name='oficina']").val('');
                        $("#div_id_area").show();
                        $("#div_oficina").show();
                    }
                    
                        
                }
                else{
                    //significa que esta en false , por eso limpio y oculto
                        $("#div_id_area").hide();
                        $("#div_oficina").hide();
                        $("[name='id_area']").val(0);
                        $("[name='oficina']").val('');
                        


                }
                //$('#empleado_dgr').val(this.checked);        
            });
        });
    </script>
@stop
