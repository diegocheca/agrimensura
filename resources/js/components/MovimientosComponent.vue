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
                                    <h4 class="modal-title">Estos son los movimientos del expdiente numero: {{ num_expediente }}</h4>
                                </div>
                                <div class="modal-body">
                                <div v-if="mostrar_timeline">
                                    <div v-if="mostrar_timeline_sin_datos">
                                        <div class="alert alert-warning" role="alert">
                                            <h4>No se encontraron movimientos para este expdiente</h4>
                                        </div>
                                    </div>
                                    <div id="timeline" v-else>
                                        <div v-for="movimiento in movimientos_del_expediente" :key="movimiento.id" class="timeline-item">
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
                                                <h2>El id: {{ movimiento.id}} - fecha: {{movimiento.created_at}}</h2>
                                                <p>
                                                    con fecha de entrada: {{ movimiento.fecha_entrada }} y una observacion: {{ movimiento.observacion }}
                                                </p>
                                                <a href="#" class="btn">mas datos</a>
                                            </div>
                                        </div>
                                        <div class="timeline-item">
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
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
                                                    Atque, facilis quo maiores magnam modi ab libero praesentium blanditiis.
                                                </p>
                                                <a href="#" class="btn">button</a>
                                            </div>
                                        </div>
                                        <div class="timeline-item">
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
                                        </div>
                                        <div class="timeline-item">
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
                                        </div>
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
                                                    <select class="form-control" id="oficina_destino" v-model="nuevo_movimiento.id_area">
                                                        <option v-for="option in oficinas" :key="option.id" >{{ option.nombre }}</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-11">
                                                    <label for="exampleFormControlTextarea1">Comentario de moviemiento:</label>
                                                    <textarea class="form-control" id="exampleFormControlTextarea1" v-model="nuevo_movimiento.comentario" rows="3"></textarea>
                                                    <span class="limiter">{{charactersLeftcomentario}}</span>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="tiene_obs">Tiene Observacion?</label>
                                                    <label for="false">No</label>
                                                    <input type="radio" id="tiene_obs" value="false" v-model="nuevo_movimiento.bandera_observacion">
                                                    <label for="true">Si</label>
                                                    <input type="radio" id="tiene_obs" value="true" v-model="nuevo_movimiento.bandera_observacion">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="observacion">Observacion:</label>
                                                    <textarea class="form-control" id="observacion" rows="3" v-model="nuevo_movimiento.observacion"></textarea>
                                                    <span class="limiter">{{charactersLeftobservacion}}</span>
                                                </div>
                                                
                                                <div class="form-group col-md-6">
                                                    <label for="subsanacion">Subsanacion de la observacion:</label>
                                                    <textarea class="form-control" id="subsanacion" rows="3" v-model="nuevo_movimiento.subsanacion"></textarea>
                                                </div>

                                                <div class="form-group col-md-6">
                                                    <label for="final">Finaliza?</label>
                                                    <label for="false">No</label>
                                                    <input type="radio" id="final" value="false" v-model="nuevo_movimiento.tramite_finalizado">
                                                    <label for="true">Si</label>
                                                    <input type="radio" id="final" value="true" v-model="nuevo_movimiento.tramite_finalizado">
                                                </div>
                                            </div>
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
                                        <strong>Salida:</strong>
                                        <pre>
                                        {{output}}
                                        </pre>
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
        <!-- <button type="button" @click="Mostrar_modal_function"  id="show-modal" >MovimientosVUE</button> -->
    </div>
</template>
<script>
export default {
    props: ['num_expediente'],
    data() {
        return {
        mostrar_modal: false,
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
            created_by: null
        },
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
      Mostrar_modal_function() {
        if(this.mostrar_modal == false) 
            this.mostrar_modal =true;
        else this.mostrar_modal =false;
        alert(this.num_expediente);
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
                currentObj.output = response.data;
            })
            .catch(function (error) {
                currentObj.output = error;
            });
        }
  },
    
}
</script>
<style scoped>
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
    background: #ee4d4d;
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
    background: #ee4d4d;
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
    background: #fff;
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
    #timeline .timeline-item .timeline-content h2 {
    padding: 15px;
    background: #ee4d4d;
    color: #fff;
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
    border-left: 7px solid #ee4d4d;
    }
    #timeline .timeline-item .timeline-content.right {
    float: right;
    }
    #timeline .timeline-item .timeline-content.right:before {
    content: "";
    right: 45%;
    left: inherit;
    border-left: 0;
    border-right: 7px solid #ee4d4d;
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
        border-right: 7px solid #ee4d4d;
    }
    #timeline .timeline-item .timeline-icon {
        left: 0;
    }
    }
</style>