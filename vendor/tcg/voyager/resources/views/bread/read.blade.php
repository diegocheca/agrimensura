@extends('voyager::master')

@section('page_title', __('voyager::generic.view').' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i> {{ __('voyager::generic.viewing') }} {{ ucfirst($dataType->getTranslatedAttribute('display_name_singular')) }} &nbsp;

        @can('edit', $dataTypeContent)
            <a href="{{ route('voyager.'.$dataType->slug.'.edit', $dataTypeContent->getKey()) }}" class="btn btn-info">
                <span class="glyphicon glyphicon-pencil"></span>&nbsp;
                {{ __('voyager::generic.edit') }}
            </a>
        @endcan
        @can('delete', $dataTypeContent)
            @if($isSoftDeleted)
                <a href="{{ route('voyager.'.$dataType->slug.'.restore', $dataTypeContent->getKey()) }}" title="{{ __('voyager::generic.restore') }}" class="btn btn-default restore" data-id="{{ $dataTypeContent->getKey() }}" id="restore-{{ $dataTypeContent->getKey() }}">
                    <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.restore') }}</span>
                </a>
            @else
                <a href="javascript:;" title="{{ __('voyager::generic.delete') }}" class="btn btn-danger delete" data-id="{{ $dataTypeContent->getKey() }}" id="delete-{{ $dataTypeContent->getKey() }}">
                    <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.delete') }}</span>
                </a>
            @endif
        @endcan
        @can('browse', $dataTypeContent)
        <a href="{{ route('voyager.'.$dataType->slug.'.index') }}" class="btn btn-warning">
            <span class="glyphicon glyphicon-list"></span>&nbsp;
            {{ __('voyager::generic.return_to_list') }}
        </a>
        @endcan
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content read container-fluid">
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered" style="padding-bottom:5px;">
                    <!-- form start -->
                    @php 
                        //var_dump($dataType->name);die();
                        //var_dump($dataType->readRows[0]->field);
                        //var_dump($dataTypeContent->id_tramite);
                    @endphp
                    @foreach($dataType->readRows as $row)
                        @php
                        if ($dataTypeContent->{$row->field.'_read'}) {
                            $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_read'};
                        }
                        
                        
                        @endphp
                        <div class="panel-heading" style="border-bottom:0;"
                        @if ($dataType->name == 'expedientes') 
                            @if ( 
                                ($row->field == 'file1') || ($row->field == 'file2') || ($row->field == 'file3')
                                || ($row->field == 'file4') || ($row->field == 'file5') || ($row->field == 'file6')
                                || ($row->field == 'file7') || ($row->field == 'file8') || ($row->field == 'file9')
                                || ($row->field == 'file10') || ($row->field == 'file11') || ($row->field == 'file12')
                                || ($row->field == 'file13') || ($row->field == 'file14') || ($row->field == 'file15')
                                || ($row->field == 'file16') || ($row->field == 'file17')
                                )
                                {{ "id=div".$row->field }}
                                @endif
                        @endif
                        >
                            @if($dataType->name == 'expedientes') 
                            {{-- significa q estoy en expedientes --}}
                                    <label class="panel-title"
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
                                    >{{ $row->getTranslatedAttribute('display_name') }}</label>
                            @else
                                <h3 class="panel-title">{{ $row->getTranslatedAttribute('display_name') }}</h3>
                            @endif 
                            
                        </div>
                        <div class="panel-body" style="padding-top:0;" 
                        @if ($dataType->name == 'expedientes') 
                            @if ( 
                                ($row->field == 'file1') || ($row->field == 'file2') || ($row->field == 'file3')
                                || ($row->field == 'file4') || ($row->field == 'file5') || ($row->field == 'file6')
                                || ($row->field == 'file7') || ($row->field == 'file8') || ($row->field == 'file9')
                                || ($row->field == 'file10') || ($row->field == 'file11') || ($row->field == 'file12')
                                || ($row->field == 'file13') || ($row->field == 'file14') || ($row->field == 'file15')
                                || ($row->field == 'file16') || ($row->field == 'file17')
                                )
                                {{ "id=div".$row->field }}
                                @endif
                        @endif
                        >
                            @if (isset($row->details->view))
                                @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => 'read', 'view' => 'read', 'options' => $row->details])
                            @elseif($row->type == "image")
                                <img class="img-responsive"
                                     src="{{ filter_var($dataTypeContent->{$row->field}, FILTER_VALIDATE_URL) ? $dataTypeContent->{$row->field} : Voyager::image($dataTypeContent->{$row->field}) }}">
                            @elseif($row->type == 'multiple_images')
                                @if(json_decode($dataTypeContent->{$row->field}))
                                    @foreach(json_decode($dataTypeContent->{$row->field}) as $file)
                                        <img class="img-responsive"
                                             src="{{ filter_var($file, FILTER_VALIDATE_URL) ? $file : Voyager::image($file) }}">
                                    @endforeach
                                @else
                                    <img class="img-responsive"
                                         src="{{ filter_var($dataTypeContent->{$row->field}, FILTER_VALIDATE_URL) ? $dataTypeContent->{$row->field} : Voyager::image($dataTypeContent->{$row->field}) }}">
                                @endif
                            @elseif($row->type == 'relationship')
                                 @include('voyager::formfields.relationship', ['view' => 'read', 'options' => $row->details])
                            @elseif($row->type == 'select_dropdown' && property_exists($row->details, 'options') &&
                                    !empty($row->details->options->{$dataTypeContent->{$row->field}})
                            )
                                <?php echo $row->details->options->{$dataTypeContent->{$row->field}};?>
                            @elseif($row->type == 'select_multiple')
                                @if(property_exists($row->details, 'relationship'))

                                    @foreach(json_decode($dataTypeContent->{$row->field}) as $item)
                                        {{ $item->{$row->field}  }}
                                    @endforeach

                                @elseif(property_exists($row->details, 'options'))
                                    @if (!empty(json_decode($dataTypeContent->{$row->field})))
                                        @foreach(json_decode($dataTypeContent->{$row->field}) as $item)
                                            @if (@$row->details->options->{$item})
                                                {{ $row->details->options->{$item} . (!$loop->last ? ', ' : '') }}
                                            @endif
                                        @endforeach
                                    @else
                                        {{ __('voyager::generic.none') }}
                                    @endif
                                @endif
                            @elseif($row->type == 'date' || $row->type == 'timestamp')
                                @if ( property_exists($row->details, 'format') && !is_null($dataTypeContent->{$row->field}) )
                                    {{ \Carbon\Carbon::parse($dataTypeContent->{$row->field})->formatLocalized($row->details->format) }}
                                @else
                                    {{ $dataTypeContent->{$row->field} }}
                                @endif
                            @elseif($row->type == 'checkbox')
                                @if(property_exists($row->details, 'on') && property_exists($row->details, 'off'))
                                    @if($dataTypeContent->{$row->field})
                                    <span class="label label-info">{{ $row->details->on }}</span>
                                    @else
                                    <span class="label label-primary">{{ $row->details->off }}</span>
                                    @endif
                                @else
                                {{ $dataTypeContent->{$row->field} }}
                                @endif
                            @elseif($row->type == 'color')
                                <span class="badge badge-lg" style="background-color: {{ $dataTypeContent->{$row->field} }}">{{ $dataTypeContent->{$row->field} }}</span>
                            @elseif($row->type == 'coordinates')
                                @include('voyager::partials.coordinates')
                            @elseif($row->type == 'rich_text_box')
                                @include('voyager::multilingual.input-hidden-bread-read')
                                {!! $dataTypeContent->{$row->field} !!}
                            @elseif($row->type == 'file')
                                @if(json_decode($dataTypeContent->{$row->field}))
                                    @foreach(json_decode($dataTypeContent->{$row->field}) as $file)
                                        <a href="{{ Storage::disk(config('voyager.storage.disk'))->url($file->download_link) ?: '' }}">
                                            {{ $file->original_name ?: '' }}
                                        </a>
                                        <br/>
                                    @endforeach
                                @else
                                    @if ($dataType->name == "expedientes")
                                        <span>Sin archivo</span>
                                    @else 
                                        <a href="{{ Storage::disk(config('voyager.storage.disk'))->url($row->field) ?: '' }}">
                                            {{ __('voyager::generic.download') }}
                                        </a>
                                    @endif
                                    
                                    
                                @endif
                            @else
                                @include('voyager::multilingual.input-hidden-bread-read')
                                <p>{{ $dataTypeContent->{$row->field} }}</p>
                            @endif
                        </div><!-- panel-body -->
                        @if(!$loop->last)
                            <hr style="margin:0;">
                        @endif
                    @endforeach

                </div>
            </div>
        </div>
    </div>

    {{-- Single delete modal --}}
    <div class="modal modal-danger fade" tabindex="-1" id="delete_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{{ __('voyager::generic.close') }}"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="voyager-trash"></i> {{ __('voyager::generic.delete_question') }} {{ strtolower($dataType->getTranslatedAttribute('display_name_singular')) }}?</h4>
                </div>
                <div class="modal-footer">
                    <form action="{{ route('voyager.'.$dataType->slug.'.index') }}" id="delete_form" method="POST">
                        {{ method_field('DELETE') }}
                        {{ csrf_field() }}
                        <input type="submit" class="btn btn-danger pull-right delete-confirm"
                               value="{{ __('voyager::generic.delete_confirm') }} {{ strtolower($dataType->getTranslatedAttribute('display_name_singular')) }}">
                    </form>
                    <button type="button" class="btn btn-default pull-right" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
@stop

@section('javascript')
    
        <script>
            $(document).ready(function () {
                @if ($isModelTranslatable)

                    $('.side-body').multilingual();
                @endif
                //para expedientes
                @if ($dataType->name == "expedientes")
                    var mi_tramite = parseInt({{$dataTypeContent->id_tramite}});
                    console.log("voy a buscar los datos del tramite: s"+mi_tramite);
                    $.ajax({
                        type:'get',
                        url: 'http://localhost:8000/nombres_archivos_tramites/'+mi_tramite,
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
                                $('#divfile1').show();
                            }
                            else
                            {
                                $('#divfile1').hide();
                            }
                            if(nombres.file2 != null)
                            {
                                $('label[id=labelfile2]').text(nombres.file2);
                                $('#divfile2').show();
                            }
                            else
                            {
                                $('#divfile2').hide();
                            }
                            if(nombres.file3 != null)
                            {
                                $('label[id=labelfile3]').text(nombres.file3);
                                $('#divfile3').show();
                            }
                            else
                            {
                                $('#divfile3').hide();
                            }
                            if(nombres.file4 != null)
                            {
                                $('label[id=labelfile4]').text(nombres.file4);
                                $('#divfile4').show();
                            }
                            else
                            {
                                $('#divfile4').hide();
                            }
                            if(nombres.file5 != null)
                            {
                                $('label[id=labelfile5]').text(nombres.file5);
                                $('#divfile5').show();
                            }
                            else
                            {
                                $('#divfile5').hide();
                            }
                            if(nombres.file6 != null)
                            {
                                $('label[id=labelfile6]').text(nombres.file6);
                                $('#divfile6').show();
                            }
                            else
                            {
                                $('#divfile6').hide();
                            }
                            if(nombres.file7 != null)
                            {
                                $('label[id=labelfile7]').text(nombres.file7);
                                $('#divfile7').show();
                            }
                            else
                            {
                                $('#divfile7').hide();
                            }
                            if(nombres.file8 != null)
                            {
                                $('label[id=labelfile8]').text(nombres.file8);
                                $('#divfile8').show();
                            }
                            else
                            {
                                $('#divfile8').hide();
                            }
                            if(nombres.file9 != null)
                            {
                                $('label[id=labelfile9]').text(nombres.file9);
                                $('#divfile9').show();
                            }
                            else
                            {
                                $('#divfile9').hide();
                            }
                            if(nombres.file10 != null)
                            {
                                $('label[id=labelfile10]').text(nombres.file10);
                                $('#divfile10').show();
                            }
                            else
                            {
                                $('#divfile10').hide();
                            }
                            if(nombres.file11!= null)
                            {
                                $('label[id=labelfile11]').text(nombres.file11);
                                $('#divfile11').show();
                            }
                            else
                            {
                                $('#divfile11').hide();
                            }
                            if(nombres.file12 != null)
                            {
                                $('label[id=labelfile12]').text(nombres.file12);
                                $('#divfile12').show();
                            }
                            else
                            {
                                $('#divfile12').hide();
                            }
                            if(nombres.file13 != null)
                            {
                                $('label[id=labelfile13]').text(nombres.file13);
                                $('#divfile13').show();
                            }
                            else
                            {
                                $('#divfile13').hide();
                            }
                            if(nombres.file14 != null)
                            {
                                $('label[id=labelfile14]').text(nombres.file14);
                                $('#divfile14').show();
                            }
                            else
                            {
                                $('#divfile14').hide();
                            }
                            if(nombres.file15 != null)
                            {
                                $('label[id=labelfile15]').text(nombres.file15);
                                $('#divfile15').show();
                            }
                            else
                            {
                                $('#divfile15').hide();
                            }
                            if(nombres.file16 != null)
                            {
                                $('label[id=labelfile16]').text(nombres.file16);
                                $('#divfile16').show();
                            }
                            else
                            {
                                $('#divfile16').hide();
                            }
                            if(nombres.file17 != null)
                            {
                                $('label[id=labelfile17]').text(nombres.file17);
                                $('#divfile17').show();
                            }
                            else
                            {
                                $('#divfile17').hide();
                            }
                        },
                        error: function(d)
                        {
                            alert (d);
                            console.log("el error es:");
                            console.log(d);
                        }
                    });
    //

                @endif
                //fin expedientes
            });
        </script>
    
    <script>
        var deleteFormAction;
        $('.delete').on('click', function (e) {
            var form = $('#delete_form')[0];

            if (!deleteFormAction) {
                // Save form action initial value
                deleteFormAction = form.action;
            }

            form.action = deleteFormAction.match(/\/[0-9]+$/)
                ? deleteFormAction.replace(/([0-9]+$)/, $(this).data('id'))
                : deleteFormAction + '/' + $(this).data('id');

            $('#delete_modal').modal('show');
        });

    </script>
@stop
