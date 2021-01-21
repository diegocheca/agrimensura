<template>
    <div>
        <div v-if="showModal_recibir">
            <transition name="modal">
                <div class="modal-mask">
                    <div class="modal-wrapper">
                        <div class="modal-dialog" style="width:67%; ">
                            <div class="modal-content" style="height: 80vh; overflow-y: auto;">
                                <div class="modal-header">
                                    <button type="button" class="close" @click="showModal_recibir=false">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h3 class="modal-title">Recibiendo Expediente <strong> {{num_expediente}} </strong></h3>
                                </div>
                                <div class="modal-body">
                                    <div class="alert alert-info" role="alert">
                                        <h4>Esta accion implica que usted esta recibiendo el expediente <strong> {{num_expediente}} </strong> en la mano, para recibirlo en su oficina</h4>
                                    </div>
                                    <div class="form-group row">
                                        <form @submit="formRecibirSubmit">
                                            <h3>Datos del expediente que se esta recibiendo</h3>
                                            <br>
                                            <div class="form-group col-md-12">
                                                <div class="form-group col-md-6">
                                                        <div class="form-group col-md-4">
                                                            <label for="numero_expediente">Numero de Expediente:</label>
                                                        </div>
                                                        <div class="form-group col-md-8">
                                                            <input style="width:100%" type="text" id="numero_expediente" disabled v-model="num_expediente" />
                                                        </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <div class="form-group col-md-4">
                                                        <label for="fecha_inicio_expediente">Creado el dia:</label>
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <input style="width:100%" type="text" id="fecha_inicio_expediente" disabled v-model="fecha_creacion" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <div class="form-group col-md-6">
                                                    <div class="form-group col-md-4">
                                                        <label for="creado_por">Creado Por:</label>
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <input style="width:100%" type="text" id="creado_por" disabled v-model="nombre_completo" />
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <div class="form-group col-md-4">
                                                        <label for="email_creador">Email del creador:</label>
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <input style="width:100%" type="text" id="email_creador" disabled v-model="iniciador.email" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <div class="form-group col-md-6">
                                                    <div class="form-group col-md-4">
                                                        <label for="numero_tramite">Numero de tramite:</label>
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <input style="width:100%" type="text" id="numero_tramite" disabled v-model="expediente.id_tramite" />
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <div class="form-group col-md-4">
                                                        <label for="archivos_adjuntos">Archivos Adjuntos:</label>
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <input style="width:100%" type="text" id="archivos_adjuntos" disabled v-model="expediente.path_papeles" />
                                                    </div>
                                                </div>
                                            </div>
                                            <h3>Datos del ultimo movimiento</h3>
                                            <br>
                                            <div class="form-group col-md-12">
                                                <div class="form-group col-md-6">
                                                    <div class="form-group col-md-4">
                                                        <label for="oficina_de_donde_viene">Oficina de donde viene:</label>
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <input style="width:100%" type="text" class="form-control" id="oficina_de_donde_viene" disabled v-model="ultimo_movimiento.nombre" />
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <div class="form-group col-md-4">
                                                        <label for="oficina_que_lo_recibe">Oficina que lo recibe:</label>
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <input style="width:100%" class="form-control" type="text" id="oficina_que_lo_recibe" disabled v-model="ultimo_movimiento.nombre" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <div class="form-group col-md-6">
                                                    <div class="form-group col-md-4">
                                                        <label for="ultimo_comentario">Ultimo Comentario:</label>
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <textarea style="width:100%" class="form-control" id="ultimo_comentario" disabled v-model="ultimo_movimiento.comentario" rows="3"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <div class="form-group col-md-6">
                                                    <div class="form-group col-md-4">
                                                        <label for="posee_observacion">Posee observacion?:</label>
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <input v-if="ultimo_movimiento.bandera_observacion == 1" style="width:100%" class="form-control" type="text" id="posee_observacion" disabled value="Si, si posee"/>
                                                        <input v-else style="width:100%" class="form-control" type="text" id="posee_observacion" disabled value="No, no posee"/>
                                                    </div>
                                                </div>
                                                <div v-if="ultimo_movimiento.bandera_observacion != null" class="form-group col-md-6">
                                                    <div class="form-group col-md-4">
                                                        <label for="ultima_observacion">Observacion:</label>
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <textarea style="width:100%" class="form-control" id="ultima_observacion" disabled v-model="ultimo_movimiento.observacion" rows="3"></textarea>
                                                    </div>
                                                </div>
                                                <div v-else class="form-group col-md-6">
                                                    <div class="alert alert-warning">
                                                        Sin Observacion en su ultimo movimiento
                                                    </div>
                                                </div>
                                            </div>
                                            <div v-if="ultimo_movimiento.subsanacion != null" class="form-group col-md-12">
                                                <div class="form-group col-md-6">
                                                    <div class="form-group col-md-4">
                                                        <label for="posee_subsanacion">Posee subsanacion?:</label>
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <textarea style="width:100%" class="form-control" id="posee_subsanacion" disabled v-model="ultimo_movimiento.subsanacion" rows="3"></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <div class="form-group col-md-4">
                                                        <label for="ultima_subsanacion">Subsanacion:</label>
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <textarea style="width:100%" id="ultima_subsanacion" disabled v-model="ultimo_movimiento.subsanacion" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div v-else class="form-group col-md-12">
                                                <div class="form-group col-md-4">
                                                    <div class="alert alert-warning">
                                                        Sin Subsanacion en su ultimo movimiento
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <hr>
                                                <div class="form-group col-md-10">
                                                </div>
                                                <div class="form-group col-md-2">
                                                    <button type="button" class="btn btn-warning" @click="showModal_recibir=false">Cancelar</button>
                                                    <button type="submit" class="btn btn-primary">Recibir</button>
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
        <button id="show-modal" @click="buscar_datos_de_expediente_y_ult_mov" class="btn btn-warning"> Recibir</button>
    </div>
</template>
<script>
import moment from 'moment'
import toastr from 'toastr'
moment.locale('es');
export default {
    props: ['num_expediente', 'link_sis'],
    data() {
        return {
        showModal_recibir: false,
        expediente: [],
        ultimo_movimiento: [],
        iniciador: []
        }
    },
    computed: {
        nombre_completo(){
            return this.iniciador.apellido + ', ' + this.iniciador.nombre; 
        },
        fecha_creacion(){
            var fecha1 = moment(this.expediente.created_at).format('MM/DD/YYYY');
            var fecha1 = moment(fecha1.toString());
            var fecha2 = moment().format('MM/DD/YYYY');
            var fecha2 = moment(fecha2.toString());
            //var from = moment(d_inicio, 'DD/MM/YYY');
            //var to = moment(d_fin, 'DD/MM/YYY');
            console.log(fecha2.diff(fecha1, 'days') + ' dias de diferencia');
            return moment(this.expediente.created_at).format('DD/MM/YYYY') + "( hace " + (fecha2.diff(fecha1, 'days') + ' dias )');
        }

    },
    methods: {
        buscar_datos_de_expediente_y_ult_mov() {
            this.showModal_recibir = true;
            //busco los datos del expediente
            axios.get('/datos_expediente/'+this.num_expediente).then(res=>{
                this.expediente = res.data;
                console.log('mi expedeinte es:\n');
                console.log(this.expediente);
            });
            //busco los datos del ultimo movimiento
             axios.get('/datos_ultimo_movimiento_para_exp/'+this.num_expediente).then(res=>{
                this.ultimo_movimiento = res.data;
                console.log('mi ultimo movimiento es:\n');
                console.log(this.ultimo_movimiento);
            });
            //busco datos de persona que lo creo
             axios.get('/datos_de_quien_creo_expdiente/'+this.num_expediente).then(res=>{
                this.iniciador = res.data;
                console.log('datos de quien lo inicio:\n');
                console.log(this.iniciador);
            });
        },
        formRecibirSubmit(e) {
            e.preventDefault();
            let currentObj = this.nuevo_movimiento;
            axios.post('/recibir_expediente_por_movimiento', {
                movimiento_id: this.ultimo_movimiento.id
            })
            .then(function (response) {
                console.log(response);
                if(response.data == 'ok')
                {
                    console.log("se guardo correctamente");
                    toastr.success('El Expdiente'+ this.num_expediente+' se recibio correctamente');
                }
            })
            .catch(function (error) {
                toastr.success('El Expdiente'+ this.num_expediente+' se recibio correctamente');
            });
            this.showModal_recibir = false;
        },
    },
    
}
</script>
<style scoped>

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
   
</style>