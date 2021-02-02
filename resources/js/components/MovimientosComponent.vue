<template>
    <div>
        <div v-if="mostrar_modal">
            <transition name="modal">
                <div class="modal-mask">
                    <div class="modal-wrapper">
                        <div class="modal-dialog" style="width:67%; ">
                            <div class="modal-content" style="height: 80vh; overflow-y: auto;">
                                <div class="modal-header">
                                    <button type="button" class="close" @click="mostrar_modal=false">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h4 class="modal-title">Estos son los movimientos del expediente numero: <a :href="url_para_ver_expediente(num_expediente)" target="_blank">{{ num_expediente }}</a>  </h4>
                                </div>
                                <div class="modal-body">
                                
                                <div v-if="mostrar_timeline">
                                    <!--botones de accion-->
                                    <button type="button" class="btn btn-warning" @click="mostrar_modal=false">Cancelar</button>
                                    <a :href="url_para_archivos_expediente(num_expediente)" target="_blank"><button type="button" class="btn btn-secondary">Archivos del Exp</button></a>
                                    <a :href="url_para_ver_expediente(num_expediente)" target="_blank"><button type="button" class="btn btn-secondary">Ver Expediente</button></a>
                                    <div v-if="mostrar_timeline_sin_datos">
                                        <div class="alert alert-warning" role="alert">
                                            <h3>No se encontraron movimientos para este expediente</h3>
                                        </div>
                                    </div>
                                    <div id="timeline" v-else>
                                        <div v-for="movimiento in movimientos_del_expediente" :key="movimiento.id" class="timeline-item"  >
                                            <div class="timeline-icon">
                                                <a :href="url_para_ver_movimiento(movimiento.id)">
                                                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="21px" height="20px" viewBox="0 0 21 20" enable-background="new 0 0 21 20" xml:space="preserve">
                                                    <path d="M12.319,5.792L8.836,2.328C8.589,2.08,8.269,2.295,8.269,2.573v1.534C8.115,4.091,7.937,4.084,7.783,4.084c-2.592,0-4.7,2.097-4.7,4.676c0,1.749,0.968,3.337,2.528,4.146c0.352,0.194,0.651-0.257,0.424-0.529c-0.415-0.492-0.643-1.118-0.643-1.762c0-1.514,1.261-2.747,2.787-2.747c0.029,0,0.06,0,0.09,0.002v1.632c0,0.335,0.378,0.435,0.568,0.245l3.483-3.464C12.455,6.147,12.455,5.928,12.319,5.792 M8.938,8.67V7.554c0-0.411-0.528-0.377-0.781-0.377c-1.906,0-3.457,1.542-3.457,3.438c0,0.271,0.033,0.542,0.097,0.805C4.149,10.7,3.775,9.762,3.775,8.76c0-2.197,1.798-3.985,4.008-3.985c0.251,0,0.501,0.023,0.744,0.069c0.212,0.039,0.412-0.124,0.412-0.34v-1.1l2.646,2.633L8.938,8.67z M14.389,7.107c-0.34-0.18-0.662,0.244-0.424,0.529c0.416,0.493,0.644,1.118,0.644,1.762c0,1.515-1.272,2.747-2.798,2.747c-0.029,0-0.061,0-0.089-0.002v-1.631c0-0.354-0.382-0.419-0.558-0.246l-3.482,3.465c-0.136,0.136-0.136,0.355,0,0.49l3.482,3.465c0.189,0.186,0.568,0.096,0.568-0.245v-1.533c0.153,0.016,0.331,0.022,0.484,0.022c2.592,0,4.7-2.098,4.7-4.677C16.917,9.506,15.948,7.917,14.389,7.107 M12.217,15.238c-0.251,0-0.501-0.022-0.743-0.069c-0.212-0.039-0.411,0.125-0.411,0.341v1.101l-2.646-2.634l2.646-2.633v1.116c0,0.174,0.126,0.318,0.295,0.343c0.158,0.024,0.318,0.034,0.486,0.034c1.905,0,3.456-1.542,3.456-3.438c0-0.271-0.032-0.541-0.097-0.804c0.648,0.719,1.022,1.659,1.022,2.66C16.226,13.451,14.428,15.238,12.217,15.238"></path>
                                                </svg>
                                                </a>
                                            </div>
                                            <div v-bind:class="test(movimiento.orden)" >
                                                <h4>Mov.: {{ movimiento.orden}} <a :href="url_para_ver_movimiento(movimiento.id)">(ver)</a>  * {{ since(movimiento.created_at) }}</h4>
                                                <p>
                                                    El Movimiento tiene el registro <strong>{{ movimiento.id}}</strong> tiene fecha de entrada: <strong> {{ formatear_fecha(movimiento.fecha_entrada)  }} </strong> y fecha de salida <strong> {{ formatear_fecha(movimiento.fecha_salida) }}</strong>, contabilizando un total de: <strong> {{calcular_direfencia_de_dias(movimiento.fecha_entrada, movimiento.fecha_salida )}}</strong></p> 
                                                <p v-if="movimiento.bandera_observacion"> Este movmiento <strong>Si</strong> posee una observacion: {{ movimiento.observacion }} </p>
                                                <p v-else> Este movmiento <strong>No</strong> posee una observacion</p>
                                                <p>Estado: Recibido</p>
                                                <recibirexpediente v-if="se_puede_recibir(movimiento.confirmado, movimiento.fecha_salida)" :num_expediente=num_expediente  link_sis="localhost:8000//admin/"></recibirexpediente>
                                            </div>
                                            <!-- <div v-else class="timeline-content right">
                                                <h2>Mov.: {{ movimiento.id}} <a :href="url_para_ver_movimiento(movimiento.id)">(ver)</a>  * {{ since(movimiento.created_at) }}</h2>
                                                <p>
                                                    El Movimiento {{ movimiento.id}} tiene fecha de entrada: <strong> {{ formatear_fecha(movimiento.fecha_entrada)  }} </strong> y fecha de salida <strong> {{ formatear_fecha(movimiento.fecha_salida) }}</strong>, contabilizando un total de: <strong> {{calcular_direfencia_de_dias(movimiento.fecha_entrada, movimiento.fecha_salida )}}</strong></p> 
                                                <p v-if="movimiento.bandera_observacion"> Este movmiento <strong>Si</strong> posee una observacion: {{ movimiento.observacion }} </p>
                                                <p v-else> Este movmiento <strong>No</strong> posee una observacion</p>
                                            </div> -->
                                        </div>
                                        <!-- <div class="timeline-item">
                                            <div class="timeline-icon">
                                                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="21px" height="20px" viewBox="0 0 21 20" enable-background="new 0 0 21 20" xml:space="preserve">
                                                <path fill="#FFFFFF" d="M19.998,6.766l-5.759-0.544c-0.362-0.032-0.676-0.264-0.822-0.61l-2.064-4.999
                                                    c-0.329-0.825-1.5-0.825-1.83,0L7.476,5.611c-0.132,0.346-0.462,0.578-0.824,0.61L0.894,6.766C0.035,6.848-0.312,7.921,0.333,8.499
                                                    l4.338,3.811c0.279,0.246,0.395,0.609,0.314,0.975l-1.304,5.345c-0.199,0.842,0.708,1.534,1.468,1.089l4.801-2.822
                                                    c0.313-0.181,0.695-0.181,1.006,0l4.803,2.822c0.759,0.445,1.666-0.23,1.468-1.089l-1.288-5.345
                                                    c-0.081-0.365,0.035-0.729,0.313-0.975l4.34-3.811C21.219,7.921,20.855,6.848,19.998,6.766z"/>
                                                </svg>
                                            </div>
                                            <div class="timeline-content">
                                                <h2>LOREM IPSUM DOLOR {{ since("2021-01-18 13:10:45") }}</h2>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
                                                    Atque, facilis quo maiores magnam modi ab libero praesentium blanditiis.
                                                </p>
                                                <a href="#" class="btn">button</a>
                                            </div>
                                        </div> -->
                                        <!-- <div class="timeline-item">
                                            <div class="timeline-icon">
                                                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="21px" height="20px" viewBox="0 0 21 20" enable-background="new 0 0 21 20" xml:space="preserve">
                                                <g>
                                                    <path fill="#FFFFFF" d="M17.92,3.065l-1.669-2.302c-0.336-0.464-0.87-0.75-1.479-0.755C14.732,0.008,7.653,0,7.653,0v5.6
                                                        c0,0.096-0.047,0.185-0.127,0.237c-0.081,0.052-0.181,0.06-0.268,0.02l-1.413-0.64C5.773,5.183,5.69,5.183,5.617,5.215l-1.489,0.65
                                                        c-0.087,0.038-0.19,0.029-0.271-0.023c-0.079-0.052-0.13-0.141-0.13-0.235V0H2.191C1.655,0,1.233,0.434,1.233,0.97
                                                        c0,0,0.025,15.952,0.031,15.993c0.084,0.509,0.379,0.962,0.811,1.242l2.334,1.528C4.671,19.905,4.974,20,5.286,20h10.307
                                                        c1.452,0,2.634-1.189,2.634-2.64V4.007C18.227,3.666,18.12,3.339,17.92,3.065z M16.42,17.36c0,0.464-0.361,0.833-0.827,0.833H5.341
                                                        l-1.675-1.089h10.341c0.537,0,0.953-0.44,0.953-0.979V2.039l1.459,2.027V17.36L16.42,17.36z"/>
                                                </g>
                                                </svg>
                                            </div>
                                            <div class="timeline-content right">
                                                <h2>LOREM IPSUM DOLOR</h2>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque, facilis quo. Maiores magnam modi ab libero praesentium blanditiis consequatur aspernatur accusantium maxime molestiae sunt ipsa.
                                                </p>
                                                <a href="#" class="btn">button</a>
                                            </div>
                                        </div> -->
                                        <!-- <div class="timeline-item">
                                            <div class="timeline-icon">
                                                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="21px" height="20px" viewBox="0 0 21 20" enable-background="new 0 0 21 20" xml:space="preserve">
                                                    <path fill="#FFFFFF" d="M19.998,6.766l-5.759-0.544c-0.362-0.032-0.676-0.264-0.822-0.61l-2.064-4.999
                                                        c-0.329-0.825-1.5-0.825-1.83,0L7.476,5.611c-0.132,0.346-0.462,0.578-0.824,0.61L0.894,6.766C0.035,6.848-0.312,7.921,0.333,8.499
                                                        l4.338,3.811c0.279,0.246,0.395,0.609,0.314,0.975l-1.304,5.345c-0.199,0.842,0.708,1.534,1.468,1.089l4.801-2.822
                                                        c0.313-0.181,0.695-0.181,1.006,0l4.803,2.822c0.759,0.445,1.666-0.23,1.468-1.089l-1.288-5.345
                                                        c-0.081-0.365,0.035-0.729,0.313-0.975l4.34-3.811C21.219,7.921,20.855,6.848,19.998,6.766z"/>
                                                </svg>
                                            </div>
                                            <div class="timeline-content">
                                                <h2>LOREM IPSUM DOLOR</h2>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque, facilis quo. Maiores magnam modi ab libero praesentium blanditiis consequatur aspernatur accusantium maxime molestiae sunt ipsa.
                                                </p>
                                                <a href="#" class="btn">button</a>
                                            </div>
                                        </div> -->
                                        </div>
                                    </div>
                                </div>
                                <div v-if="mostrar_formulario_movimiento">
                                    <div class="form-group row">
                                        <form @submit="formSubmit">
                                            <div class="form-group col-md-12">
                                                
                                                <div class="form-group col-md-6">
                                                    <label for="exampleFormControlSelect1">Oficina Actual:</label>
                                                    <input type="text" value="contable" disabled v-model="ultimo_movimiento.nombre" />
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="oficina_destino">Oficina destino:</label>
                                                    <select class="form-control" id="oficina_destino" v-model="nuevo_movimiento.id_area" :disabled="nuevo_movimiento.tramite_finalizado">
                                                        <option v-for="option in oficinas" :key="option.id" v-bind:value="option.id">{{ option.nombre }}</option>
                                                    </select>
                                                </div>
                                                <hr>
                                            </div>
                                            <hr>
                                            <div class="form-group col-md-12">
                                                <div class="form-group col-md-12">
                                                    <label for="exampleFormControlTextarea1">Comentario de moviemiento:</label>
                                                    <textarea class="form-control" id="exampleFormControlTextarea1" v-model="nuevo_movimiento.comentario" rows="3"></textarea>
                                                    <span class="limiter">{{charactersLeftcomentario}}</span>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="form-group col-md-12">
                                                <div class="form-group col-md-4">
                                                    <!-- <p>Tiene Obsercacion?</p>
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <label for="false" class="custom-control-label" >No, sin observacion</label>
                                                        <input type="radio" id="tiene_obs" value="false" class="custom-control-input" v-model="nuevo_movimiento.bandera_observacion">
                                                    </div>
                                                    <div class="custom-control custom-radio custom-control-inline">
                                                        <label for="true" class="custom-control-label">Si, tiene observacion</label>
                                                        <input type="radio" id="tiene_obs" value="true" class="custom-control-input" v-model="nuevo_movimiento.bandera_observacion">
                                                    </div> -->
                                                    <label class="control-label" for="name">Tiene Observacion?</label>
                                                    <div class='checkbox-ios'>
                                                        <input class='checkbox-ios__toggle' id='checkboxQuestion' name='checkboxQuestion' type='checkbox' v-model="nuevo_movimiento.bandera_observacion">
                                                            <label class='checkbox-ios__label' for='checkboxQuestion'>
                                                            <span class='checkbox-ios__value left'>No tiene</span>
                                                            <span class='checkbox-ios__value right'>Si tiene</span>
                                                            </label>
                                                        </input>
                                                    </div>
                                                </div>
                                                <transition name="slide-fade">
                                                    <div class="form-group col-md-8" v-if="nuevo_movimiento.bandera_observacion">
                                                        <label for="observacion">Observacion:</label>
                                                        <textarea class="form-control" id="observacion" rows="3" v-model="nuevo_movimiento.observacion"></textarea>
                                                        <span class="limiter">{{charactersLeftobservacion}}</span>
                                                    </div>
                                                </transition>
                                            </div>
                                            <hr>
                                                <!-- <div class="form-group col-md-6">
                                                    <label for="subsanacion">Subsanacion de la observacion:</label>
                                                    <textarea class="form-control" id="subsanacion" rows="3" v-model="nuevo_movimiento.subsanacion"></textarea>
                                                </div> -->
                                            <div class="form-group col-md-12">
                                                <div class="form-group col-md-4">
                                                    <label for="checkboxQuestionAlert">Finaliza?</label>
                                                    <div class='checkbox-ios checkbox-ios--alert'>
                                                        <input class='checkbox-ios__toggle' id='checkboxQuestionAlert' name='checkboxQuestionAlert' type='checkbox' v-model="nuevo_movimiento.tramite_finalizado" v-on:change="cambio_finalizo">
                                                            <label class='checkbox-ios__label' for='checkboxQuestionAlert'>
                                                            <span class='checkbox-ios__value left'>No</span>
                                                            <span class='checkbox-ios__value right'>Si</span>
                                                            </label>
                                                        </input>
                                                    </div>
                                                </div>
                                                <transition name="slide-fade">
                                                    <div class="form-group col-md-8" v-if="nuevo_movimiento.tramite_finalizado">
                                                        <div class="alert alert-warning">
                                                        <strong>Cuidado!</strong> Esta terminando este expediente con este ultimo movimiento. La oficina donde se mandará será Archivo.
                                                        </div>
                                                    </div>
                                                </transition>
                                                    <!-- <label for="final">Finaliza?</label>
                                                    <label for="false">No</label>
                                                    <input type="radio" id="final" value="false" v-model="nuevo_movimiento.tramite_finalizado">
                                                    <label for="true">Si</label>
                                                    <input type="radio" id="final" value="true" v-model="nuevo_movimiento.tramite_finalizado"> -->
                                            </div>
                                           
                                            <hr>
                                            <div class="form-group col-md-12">
                                                <hr>
                                                <div class="form-group col-md-10">
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <button type="button" class="btn btn-warning" @click="mostrar_modal=false">Cancelar</button>
                                                    <button type="submit" class="btn btn-primary">Mover</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </transition>
        </div>
        <button id="ver-movimientos" @click="mostrar_ver_movimientos" class="btn btn-primary"> ver Mov</button>
        <button id="mover" @click="mostrar_mover_expediente" class="btn btn-success"> Mover</button>
    </div>
</template>
<script>
import moment from 'moment'
import toastr from 'toastr'
import recibirexpediente from './RecibirExpedienteComponent.vue'

moment.locale('es');
export default {
    props: ['num_expediente', 'link_sis'],
    name : "movimientos",
    components: {recibirexpediente},
    
    data() {
        return {
        mostrar_modal: false,
        url: '',
        derecha: true,
        mostrar_timeline: false,
        mostrar_timeline_sin_datos: false,
        mostrar_formulario_movimiento: false,
        movimientos_del_expediente: [],
        nuevo_movimiento: {
            fecha_entrada: null,
            fecha_salida: null,
            comentario: '',
            bandera_observacion: false,
            observacion: '',
            subsanacion: null,
            id_area: null,
            id_expdiente: null,
            tramite_finalizado: false,
            created_by: null,
            bandera_comentario_recibo: false,
            comentario_confirmacion:''
        },
        prueba: false,
        expdiente: [],
        ultimo_movimiento: [],
        oficinas: [],
        output: ''
        }
    },
  /*created(){
    axios.get('/movimientos/'+this.num_expediente).then(res=>{
      this.notas = res.data;
      console.log('mis datos son:\n');
      console.log(this.notas);
    })
  },*/
  computed: {
        charactersLeftcomentario() {
            var char = this.nuevo_movimiento.comentario.length,
                limit = 150;

            return (limit - char) + " / " + limit + " caracteres restantes";
        },
        charactersLeftobservacion() {
            var char = this.nuevo_movimiento.observacion.length,
                limit = 150;

            return (limit - char) + " / " + limit + " caracteres restantes";
        }

    },
  methods: {
      since(d){
          return moment(d).fromNow();
      },
      mostrar_ver_movimientos() {
        if(this.mostrar_modal == false)
        {
            this.mostrar_modal =true;
            axios.get('/movimientos_para_exp/'+this.num_expediente).then(res=>{
                this.movimientos_del_expediente = res.data;
                console.log('mis datos son:\n');
                console.log(this.movimientos_del_expediente.length);
                this.mostrar_timeline = true;
                this.mostrar_formulario_movimiento=false;
                if(this.movimientos_del_expediente.length != 0)
                {
                    this.mostrar_timeline_sin_datos = false;
                }
                else this.mostrar_timeline_sin_datos = true;
            })

        } 
            
        else this.mostrar_modal =false;
        //alert(this.num_expediente);
      },
      mostrar_mover_expediente() {
          this.mostrar_modal =true;
          this.mostrar_formulario_movimiento = true;
          this.mostrar_timeline = false;
          axios.get('/datos_expediente/'+this.num_expediente).then(res=>{
                this.expdiente = res.data;
                console.log('mi expedeinte es:\n');
                console.log(this.expdiente);
                //busco el nombre de la oficina actual del expdiente
                /*for (let i in this.oficinas) {
                        if(this.oficina[i].id == "")
                }*/
            });
            axios.get('/datos_ultimo_movimiento_para_exp/'+this.num_expediente).then(res=>{
                this.ultimo_movimiento = res.data;
                console.log('mi ultimo movimiento es:\n');
                console.log(this.ultimo_movimiento);
                //busco el nombre de la oficina actual del expdiente
                /*for (let i in this.oficinas) {
                        if(this.oficina[i].id == "")
                }*/
            });
            //busco todos los nombres e id de las oficinas para el select
            axios.get('/oficinas_para_add_mov').then(res=>{
                this.oficinas = res.data;
                console.log('mis oficinas son:\n');
                console.log(this.oficinas);
            }) 

            

      },
        formSubmit(e) {
            e.preventDefault();
            let currentObj = this.nuevo_movimiento;
            axios.post('/crear_movimiento', {
                comentario: this.nuevo_movimiento.comentario,
                bandera_observacion: this.nuevo_movimiento.bandera_observacion,
                observacion: this.nuevo_movimiento.observacion,
                subsanacion: this.nuevo_movimiento.subsanacion,
                id_area: this.nuevo_movimiento.id_area,
                id_expdiente: this.expdiente.id,
                tramite_finalizado: this.nuevo_movimiento.tramite_finalizado
            })
            .then(function (response) {
                console.log(response.data);
                if(response.data == 'ok')
                {
                    console.log("se guardo correctamente");
                    //limpiar todo el
                    /*this.nuevo_movimiento.comentario='';
                    this.nuevo_movimiento.bandera_observacion=false;
                    this.nuevo_movimiento.observacion='';
                    this.nuevo_movimiento.subsanacion='';
                    this.nuevo_movimiento.id_area=1;
                    this.expdiente.id=1;
                    this.nuevo_movimiento.tramite_finalizado=false;
                    this.mostrar_modal =false;*/
                    
                    
                    toastr.success('Se creo el nuevo movimiento correctamente');
                    
                }
                

            })
            .catch(function (error) {
                currentObj.output = error;
                toastr.error('hubo un error');
            });
            this.nuevo_movimiento.comentario='';
            this.nuevo_movimiento.bandera_observacion=false;
            this.nuevo_movimiento.observacion='';
            this.nuevo_movimiento.subsanacion='';
            this.nuevo_movimiento.id_area=1;
            this.expdiente.id=1;
            this.nuevo_movimiento.tramite_finalizado=false;
            this.mostrar_modal = false;
        },
        url_para_ver_movimiento(numero) {
            return this.link_sis + '/movimientos/'+ numero;
        },
        url_para_ver_expediente(numero) {
            return this.link_sis + '/expedientes_por_num/'+ numero;
        },
        url_para_archivos_expediente(numero) {
            return this.link_sis + '/media/files_expedientes_por_num/'+ numero;
        },
        
        calcular_direfencia_de_dias(d_inicio, d_fin){
            var fecha1 = moment(d_inicio).format('MM/DD/YYYY');
            var fecha1 = moment(fecha1.toString());
            var fecha2 = moment(new Date(d_fin)).format('MM/DD/YYYY');
            var fecha2 = moment(fecha2.toString());
            //var from = moment(d_inicio, 'DD/MM/YYY');
            //var to = moment(d_fin, 'DD/MM/YYY');
            console.log(fecha2.diff(fecha1, 'days') + ' dias de diferencia');
            return (fecha2.diff(fecha1, 'days') + ' dias de diferencia');
            //return ( '  4 dias de diferencia');
            
        },
        formatear_fecha (fecha_a_formatear){
            return moment(fecha_a_formatear).format('DD/MM/YYYY');
        },
        test(result) {
            if (result%2==0)
                return 'timeline-content';
            else
                return 'timeline-content right';
        },
        se_puede_recibir(conf,fecha_salida){
            if((conf != 1) && (fecha_salida != null) )
                return true;
            return false;
            
        },
        cambio_finalizo() {
            console.log('el valor es');
            console.log(this.nuevo_movimiento.tramite_finalizado);
            if( this.nuevo_movimiento.tramite_finalizado == true )
                this.nuevo_movimiento.id_area = 9;

        }
  },
    
}
</script>
<style scoped>
.fade-enter-active, .fade-leave-active {
        transition: opacity .5s;
        }
        .fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
        opacity: 0.5;
    }
.slide-fade-enter-active {
  transition: all .3s ease;
}
.slide-fade-leave-active {
  transition: all .8s cubic-bezier(1.0, 0.5, 0.8, 1.0);
}
.slide-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(10px);
  opacity: 0;
}




.clearfix:after, .checkbox-ios:after {
  content: "";
  display: table;
  clear: both;
  height: 0;
  visibility: hidden;
}

.checkbox-ios {
  width: 35%;
  margin: 0 auto;
  margin-bottom: 2px;
}
.checkbox-ios__toggle {
  display: none;
}
.checkbox-ios__toggle + .checkbox-ios__label {
  display: block;
  position: relative;
  transition: 0.3s;
  border-radius: 50px;
  background-color: #4e4e4e;
  height: 30px;
  margin-bottom: 0;
  cursor: pointer;
}
.checkbox-ios__toggle + .checkbox-ios__label:before {
  transition: 0.3s;
  content: "";
  display: block;
  position: absolute;
  border-radius: 50%;
  background-color: #fff;
  width: 20px;
  height: 20px;
  top: 5px;
  left: 5px;
}
.checkbox-ios__value {
  display: block;
  float: left;
  width: 50%;
  font-size: 11px;
  text-align: center;
  margin-top: 35px;
  letter-spacing: 1px;
  line-height: 1.5;
}
.checkbox-ios__value.left {
  text-align: left;
  font-weight: bold;
}
.checkbox-ios__value.right {
  text-align: right;
}
.checkbox-ios__toggle:checked + .checkbox-ios__label {
  background-color: #2cc524;
}
.checkbox-ios__toggle:checked + .checkbox-ios__label:before {
  left: calc(100% - 20px - 5px);
}
.checkbox-ios__toggle:checked + .checkbox-ios__label .right {
  font-weight: bold;
}
.checkbox-ios__toggle:checked + .checkbox-ios__label .left {
  font-weight: normal;
}
.checkbox-ios--blue .checkbox-ios__toggle:checked + .checkbox-ios__label {
  background-color: #2a9db3;
}
.checkbox-ios--alert .checkbox-ios__toggle:checked + .checkbox-ios__label {
  background-color: #cf201b;
}
#timeline .timeline-item:after, #timeline .timeline-item:before {
    content: "";
    display: block;
    width: 100%;
    clear: both;
    }

    *, *:before, *:after {
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    }

   

    img {
    max-width: 100%;
    }

    /*
    
     .project-name {
    text-align: center;
    padding: 10px 0;
    } */


.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, .5);
  display: table;
  transition: opacity .3s ease;
}

.modal-wrapper {
    display: table-cell;
    vertical-align: middle;
}
    
    
    #timeline {
    width: 100%;
    margin: 30px auto;
    position: relative;
    padding: 0 10px;
    -webkit-transition: all 0.4s ease;
    -moz-transition: all 0.4s ease;
    -ms-transition: all 0.4s ease;
    transition: all 0.4s ease;
    }
    #timeline:before {
    content: "";
    width: 3px;
    height: 100%;
    background: #2EF792;
    left: 50%;
    top: 0;
    position: absolute;
    }
    #timeline:after {
    content: "";
    clear: both;
    display: table;
    width: 100%;
    }
    #timeline .timeline-item {
    margin-bottom: 50px;
    position: relative;
    }
    #timeline .timeline-item .timeline-icon {
    background: #2EF792;
    width: 50px;
    height: 50px;
    position: absolute;
    top: 0;
    left: 50%;
    overflow: hidden;
    margin-left: -23px;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    -ms-border-radius: 50%;
    border-radius: 50%;
    }
    #timeline .timeline-item .timeline-icon svg {
    position: relative;
    top: 14px;
    left: 14px;
    }
    #timeline .timeline-item .timeline-content {
    width: 45%;
    background: #ECF5F0;
    padding: 20px;
    -webkit-box-shadow: 0 3px 0 rgba(0, 0, 0, 0.1);
    -moz-box-shadow: 0 3px 0 rgba(0, 0, 0, 0.1);
    -ms-box-shadow: 0 3px 0 rgba(0, 0, 0, 0.1);
    box-shadow: 0 3px 0 rgba(0, 0, 0, 0.1);
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -ms-border-radius: 5px;
    border-radius: 5px;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    transition: all 0.3s ease;
    }
    #timeline .timeline-item .timeline-content h4 {
    padding: 15px;
    background: #2EF792;
    color: #000;
    margin: -20px -20px 0 -20px;
    font-weight: 300;
    -webkit-border-radius: 3px 3px 0 0;
    -moz-border-radius: 3px 3px 0 0;
    -ms-border-radius: 3px 3px 0 0;
    border-radius: 3px 3px 0 0;
    }
    #timeline .timeline-item .timeline-content:before {
    content: "";
    position: absolute;
    left: 45%;
    top: 20px;
    width: 0;
    height: 0;
    border-top: 7px solid transparent;
    border-bottom: 7px solid transparent;
    border-left: 7px solid #3C9C67;
    }
    #timeline .timeline-item .timeline-content.right {
    float: right;
    }
    #timeline .timeline-item .timeline-content.right:before {
    content: "";
    right: 45%;
    left: inherit;
    border-left: 0;
    border-right: 7px solid #3C9C67;
    }

    @media screen and (max-width: 768px) {
    #timeline {
        margin: 30px;
        padding: 0px;
        width: 90%;
    }
    #timeline:before {
        left: 0;
    }
    #timeline .timeline-item .timeline-content {
        width: 90%;
        float: right;
    }
    #timeline .timeline-item .timeline-content:before, #timeline .timeline-item .timeline-content.right:before {
        left: 10%;
        margin-left: -6px;
        border-left: 0;
        border-right: 7px solid #3C9C67;
    }
    #timeline .timeline-item .timeline-icon {
        left: 0;
    }
        
    }
</style>