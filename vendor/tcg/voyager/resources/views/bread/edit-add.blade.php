@php
    $edit = !is_null($dataTypeContent->getKey());
    $add  = is_null($dataTypeContent->getKey());
@endphp

@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_title', __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular') }}
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-12">
            
                <div class="panel panel-bordered">
                    <!-- form start -->
                    <form role="form"
                            class="form-edit-add"
                            action="{{ $edit ? route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) : route('voyager.'.$dataType->slug.'.store') }}"
                            method="POST" enctype="multipart/form-data">
                        <!-- PUT Method if we are editing -->
                        @if($edit)
                            {{ method_field("PUT") }}
                        @endif

                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}

                        <div class="panel-body">

                            @if (count($errors) > 0)
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            <!-- Adding / Editing -->
                            @php
                                $dataTypeRows = $dataType->{($edit ? 'editRows' : 'addRows' )};
                            @endphp

                            @foreach($dataTypeRows as $row)
                                <!-- GET THE DISPLAY OPTIONS -->
                                <!-- buscando elnombre file1 , file2, etc
                                @if($row->field == 'file3')
                                    {{$row->field}}
                                @endif
                                -->
                                @php
                                    $display_options = $row->details->display ?? NULL;
                                    if ($dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')}) {
                                        $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')};
                                    }
                                @endphp
                                @if (isset($row->details->legend) && isset($row->details->legend->text))
                                    <legend class="text-{{ $row->details->legend->align ?? 'center' }}" style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                                @endif

                                <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 12 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                                    {{ $row->slugify }}
                                    <label class="control-label" for="name"
                                    @if($row->field == 'file1')
                                        id="labelfile1"
                                    @elseif($row->field == 'file2')
                                        id="labelfile2"
                                    @elseif($row->field == 'file3')
                                        id="labelfile3"
                                    @elseif($row->field == 'file4')
                                        id="labelfile4"
                                    @elseif($row->field == 'file5')
                                        id="labelfile5"
                                    @elseif($row->field == 'file6')
                                        id="labelfile6"
                                    @elseif($row->field == 'file7')
                                        id="labelfile7"
                                    @elseif($row->field == 'file8')
                                        id="labelfile8"
                                    @elseif($row->field == 'file9')
                                        id="labelfile9"
                                    @elseif($row->field == 'file10')
                                        id="labelfile10"
                                    @elseif($row->field == 'file11')
                                        id="labelfile11"
                                    @elseif($row->field == 'file12')
                                        id="labelfile12"
                                    @elseif($row->field == 'file13')
                                        id="labelfile13"
                                    @elseif($row->field == 'file14')
                                        id="labelfile14"
                                    @elseif($row->field == 'file115')
                                        id="labelfile15"
                                    @elseif($row->field == 'file16')
                                        id="labelfile16"
                                    @elseif($row->field == 'file17')
                                        id="labelfile17"
                                    @endif
                                    >
                                    {{ $row->getTranslatedAttribute('display_name') }}</label>
                                    @include('voyager::multilingual.input-hidden-bread-edit-add')
                                    @if (isset($row->details->view))
                                        @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => ($edit ? 'edit' : 'add'), 'view' => ($edit ? 'edit' : 'add'), 'options' => $row->details])
                                    @elseif ($row->type == 'relationship')
                                        @include('voyager::formfields.relationship', ['options' => $row->details])
                                    @else
                                        {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                                    @endif

                                    @foreach (app('voyager')->afterFormFields($row, $dataType, $dataTypeContent) as $after)
                                        {!! $after->handle($row, $dataType, $dataTypeContent) !!}
                                    @endforeach
                                    @if ($errors->has($row->field))
                                        @foreach ($errors->get($row->field) as $error)
                                            <span class="help-block">{{ $error }}</span>
                                        @endforeach
                                    @endif
                                </div>
                            @endforeach

                        </div><!-- panel-body -->
                        <div class="panel-footer">
                            @section('submit-buttons')
                                <button type="submit" class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                            @stop
                            @yield('submit-buttons')
                        </div>
                    </form>

                    <iframe id="form_target" name="form_target" style="display:none"></iframe>
                    <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post"
                            enctype="multipart/form-data" style="width:0;height:0;overflow:hidden">
                        <input name="image" id="upload_file" type="file"
                                 onchange="$('#my_form').submit();this.value='';">
                        <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
                        {{ csrf_field() }}
                    </form>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade modal-danger" id="confirm_delete_modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }}</h4>
                </div>

                <div class="modal-body">
                    <h4>{{ __('voyager::generic.are_you_sure_delete') }} '<span class="confirm_delete_name"></span>'</h4>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                    <button type="button" class="btn btn-danger" id="confirm_delete">{{ __('voyager::generic.delete_confirm') }}</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Delete File Modal -->
@stop

@section('javascript')
    <script>
        var params = {};
        var $file;

        function deleteHandler(tag, isMulti) {
          return function() {
            $file = $(this).siblings(tag);

            params = {
                slug:   '{{ $dataType->slug }}',
                filename:  $file.data('file-name'),
                id:     $file.data('id'),
                field:  $file.parent().data('field-name'),
                multi: isMulti,
                _token: '{{ csrf_token() }}'
            }

            $('.confirm_delete_name').text(params.filename);
            $('#confirm_delete_modal').modal('show');
          };
        }

        //mis funciones 
        function cargar_profesionales(){
            console.log("cargando los profesionales");
            $("[name='id_persona']").html('');
            $.ajax({
                type:'get',
                url: 'http://localhost:8000/cargar_profesionales',
                dataType: 'json',   
                success: function(response){
                    var len = 0;
                    if (response.data != null) {
                        len = response.data.length;
                    }
                    if (len>0) {
                        var option = '';
                        for (var i = 0; i<len; i++) {
                            var id = response.data[i].id;
                            var name = response.data[i].apellido +' ,  ' +response.data[i].nombre;
                            var option = option+"<option value='"+id+"'>"+name+"</option>"; 

                        }
                        $("[name='id_persona']").html(option);
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
        //fin de mis funciones

        $('document').ready(function () {
            
            //mis cosas
            //modifico el select para que solamente tenga personas profesionales
            cargar_profesionales();
            //para expedientes
            @if ($dataType->name == "expedientes")
                $('select[name="id_tramite"]').change(function() {
                    //alert("cambio el select de tramites");
                    console.log("voy a buscar los datos del tramite: s"+$(this).val());
                    $.ajax({
                            type:'get',
                            url: 'http://localhost:8000/nombres_archivos_tramites/'+$(this).val(),
                            dataType: 'json',   
                            success: function(response){
                                console.log("mis datos son:");
                                console.log(response[0]);
                                //console.log(response[0].file3);
                                var nombres = response[0];
                                if (response.data != null) {
                                    len = response.data.length;
                                }
                                //$("#file1").text(response.data.file1);
                                if(nombres.file1 != null)
                                {
                                    $('label[id=labelfile1]').text(nombres.file1);
                                    $('input[name="file1[]"]').val(null);
                                    $('#divfile1').show();
                                }
                                else
                                {
                                    $('#divfile1').hide();
                                    $('input[name="file1[]"]').val(null);
                                }
                                if(nombres.file2 != null)
                                {
                                    $('label[id=labelfile2]').text(nombres.file2);
                                    $('input[name="file2[]"]').val(null);
                                    $('#divfile2').show();
                                }
                                else
                                {
                                    $('#divfile2').hide();
                                    $('input[name="file2[]"]').val(null);
                                }
                                if(nombres.file3 != null)
                                {
                                    $('label[id=labelfile3]').text(nombres.file3);
                                    $('input[name="file3[]"]').val(null);
                                    $('#divfile3').show();
                                }
                                else
                                {
                                    $('#divfile3').hide();
                                    $('input[name="file3[]"]').val(null);
                                }
                                if(nombres.file4 != null)
                                {
                                    $('label[id=labelfile4]').text(nombres.file4);
                                    $('input[name="file4[]"]').val(null);
                                    $('#divfile4').show();
                                }
                                else
                                {
                                    $('#divfile4').hide();
                                    $('input[name="file4[]"]').val(null);
                                }
                                if(nombres.file5 != null)
                                {
                                    $('label[id=labelfile5]').text(nombres.file5);
                                    $('input[name="file5[]"]').val(null);
                                    $('#divfile5').show();
                                }
                                else
                                {
                                    $('#divfile5').hide();
                                    $('input[name="file5[]"]').val(null);
                                }
                                if(nombres.file6 != null)
                                {
                                    $('label[id=labelfile6]').text(nombres.file6);
                                    $('input[name="file6[]"]').val(null);
                                    $('#divfile6').show();
                                }
                                else
                                {
                                    $('#divfile6').hide();
                                    $('input[name="file6[]"]').val(null);
                                }
                                if(nombres.file7 != null)
                                {
                                    $('label[id=labelfile7]').text(nombres.file7);
                                    $('input[name="file7[]"]').val(null);
                                    $('#divfile7').show();
                                }
                                else
                                {
                                    $('#divfile7').hide();
                                    $('input[name="file7[]"]').val(null);
                                }
                                if(nombres.file8 != null)
                                {
                                    $('label[id=labelfile8]').text(nombres.file8);
                                    $('input[name="file8[]"]').val(null);
                                    $('#divfile8').show();
                                }
                                else
                                {
                                    $('#divfile8').hide();
                                    $('input[name="file8[]"]').val(null);
                                }
                                if(nombres.file9 != null)
                                {
                                    $('label[id=labelfile9]').text(nombres.file9);
                                    $('input[name="file9[]"]').val(null);
                                    $('#divfile9').show();
                                }
                                else
                                {
                                    $('#divfile9').hide();
                                    $('input[name="file9[]"]').val(null);
                                }
                                if(nombres.file10 != null)
                                {
                                    $('label[id=labelfile10]').text(nombres.file10);
                                    $('input[name="file10[]"]').val(null);
                                    $('#divfile10').show();
                                }
                                else
                                {
                                    $('#divfile10').hide();
                                    $('input[name="file10[]"]').val(null);
                                }
                                if(nombres.file11!= null)
                                {
                                    $('label[id=labelfile11]').text(nombres.file11);
                                    $('input[name="file11[]"]').val(null);
                                    $('#divfile11').show();
                                }
                                else
                                {
                                    $('#divfile11').hide();
                                    $('input[name="file11[]"]').val(null);
                                }
                                if(nombres.file12 != null)
                                {
                                    $('label[id=labelfile12]').text(nombres.file12);
                                    $('input[name="file12[]"]').val(null);
                                    $('#divfile12').show();
                                }
                                else
                                {
                                    $('#divfile12').hide();
                                    $('input[name="file12[]"]').val(null);
                                }
                                if(nombres.file13 != null)
                                {
                                    $('label[id=labelfile13]').text(nombres.file13);
                                    $('input[name="file13[]"]').val(null);
                                    $('#divfile13').show();
                                }
                                else
                                {
                                    $('#divfile13').hide();
                                    $('input[name="file13[]"]').val(null);
                                }
                                if(nombres.file14 != null)
                                {
                                    $('label[id=labelfile14]').text(nombres.file14);
                                    $('input[name="file14[]"]').val(null);
                                    $('#divfile14').show();
                                }
                                else
                                {
                                    $('#divfile14').hide();
                                    $('input[name="file14[]"]').val(null);
                                }
                                if(nombres.file15 != null)
                                {
                                    $('label[id=labelfile15]').text(nombres.file15);
                                    $('input[name="file15[]"]').val(null);
                                    $('#divfile15').show();
                                }
                                else
                                {
                                    $('#divfile15').hide();
                                    $('input[name="file15[]"]').val(null);
                                }
                                if(nombres.file16 != null)
                                {
                                    $('label[id=labelfile16]').text(nombres.file16);
                                    $('input[name="file16[]"]').val(null);
                                    $('#divfile16').show();
                                }
                                else
                                {
                                    $('#divfile16').hide();
                                    $('input[name="file16[]"]').val(null);
                                }
                                if(nombres.file17 != null)
                                {
                                    $('label[id=labelfile17]').text(nombres.file17);
                                    $('input[name="file17[]"]').val(null);
                                    $('#divfile17').show();
                                }
                                else
                                {
                                    $('#divfile17').hide();
                                    $('input[name="file17[]"]').val(null);
                                }
                            },
                            error: function(d)
                            {
                                alert (d);
                                console.log("el error es:");
                                console.log(d);
                            }
                        });
                });
            @endif
            //fin expedientes

            //Init datepicker for date fields if data-datepicker attribute defined
            //or if browser does not handle date inputs
            $('.form-group input[type=date]').each(function (idx, elt) {
                if (elt.hasAttribute('data-datepicker')) {
                    elt.type = 'text';
                    $(elt).datetimepicker($(elt).data('datepicker'));
                } else if (elt.type != 'date') {
                    elt.type = 'text';
                    $(elt).datetimepicker({
                        format: 'L',
                        extraFormats: [ 'YYYY-MM-DD' ]
                    }).datetimepicker($(elt).data('datepicker'));
                }
            });

            @if ($isModelTranslatable)
                $('.side-body').multilingual({"editing": true});
            @endif

            $('.side-body input[data-slug-origin]').each(function(i, el) {
                $(el).slugify();
            });

            $('.form-group').on('click', '.remove-multi-image', deleteHandler('img', true));
            $('.form-group').on('click', '.remove-single-image', deleteHandler('img', false));
            $('.form-group').on('click', '.remove-multi-file', deleteHandler('a', true));
            $('.form-group').on('click', '.remove-single-file', deleteHandler('a', false));

            $('#confirm_delete').on('click', function(){
                $.post('{{ route('voyager.'.$dataType->slug.'.media.remove') }}', params, function (response) {
                    if ( response
                        && response.data
                        && response.data.status
                        && response.data.status == 200 ) {

                        toastr.success(response.data.message);
                        $file.parent().fadeOut(300, function() { $(this).remove(); })
                    } else {
                        toastr.error("Error removing file.");
                    }
                });

                $('#confirm_delete_modal').modal('hide');
            });
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
@stop
