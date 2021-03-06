<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EmailController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MovimientosController;
use App\Http\Controllers\PDFController;
use App\Http\Controllers\ExcelCSVController;
use App\Http\Controllers\ExpedienteController;
use App\Expediente;
use App\Http\Controllers\BuscadorController;
use App\Http\Controllers\NotificationController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', function () {
    return view('welcome');
});

Route::get('/home', [HomeController::class, "index"]);
Route::get('contact', [ContactController::class, "contact"]);
Route::post('contact', [ContactController::class, "contactPost"])->name('contact.store');

Route::get('/movimientos_para_exp/{numero}', [MovimientosController::class, "traer_movimientos_para_expediente"])->name('movimientos');

/* Ver datos del expdiente , vengo con mi url y se la paso a voyager*/
Route::get('admin/expedientes_por_num/{num_exp}', function ($num_exp){
    $exp = Expediente::select('*')->where('numero_expediente','=',$num_exp)->first();
    //var_dump($exp);die();
    return redirect('/admin/expedientes/'.$exp->id);
});

Route::get('/oficinas_para_add_mov', [MovimientosController::class, "traer_oficinas_para_select"])->name('oficinas-para-select');
Route::get('/datos_expediente/{num_exp}', [MovimientosController::class, "traer_expediente_para_component"])->name('datos_expediente');
Route::get('/datos_ultimo_movimiento_para_exp/{num_exp}', [MovimientosController::class, "traer_ultimo_mov_exp"])->name('datos_ultimo_mov');
Route::get('/datos_penultimo_movimiento_para_exp/{num_exp}', [MovimientosController::class, "traer_penultimo_mov_exp"])->name('datos_ultimo_mov');
Route::get('/datos_ultimo_movimiento_para_exp_ajax/{num_exp}', [MovimientosController::class, "traer_ultimo_mov_exp_ajax"])->name('datos_ultimo_mov_ajax');
Route::post('/crear_movimiento', [MovimientosController::class, "crear_movimiento_desde_component"])->name('crear-movimiento');
Route::post('/devolver_movimiento/{id}', [MovimientosController::class, "devolver_movimiento_desde_component"])->name('devolver-movimiento');
Route::get('/devolver_movimiento/{id}', [MovimientosController::class, "devolver_movimiento_desde_component"])->name('devolver-movimiento');


Route::get('/datos_de_quien_creo_expdiente/{num_exp}', [MovimientosController::class, "traer_datos_creado_exp"])->name('datos_creador_exp');
Route::post('/recibir_expediente_por_movimiento', [MovimientosController::class, "recibir_exp_por_movimiento"])->name('recibir-exp-por-movimiento');

Route::post('/subsanar_movimiento/{id}', [MovimientosController::class, "subsanar_movimiento_desde_componente"])->name('subsanar-movimiento');
//areas


//Pusher
Route::get('/ver_pusher', [NotificationController::class, "index"])->name('ver-notificaciones');
Route::get('/enviar_notificacion', [NotificationController::class, "enviar_una_notificacion"])->name('enviar-notificacion');
Route::get('test', function () {
    event(new App\Events\StatusLiked('Someone'));
    //event(new App\Events\MyEvent('hello world'));
    return "Event htttas been sent!";
});

//register and login
Route::get('/register/verify/{code}', 'App\Http\Controllers\Auth\VerificationController@verify');





//expedientes
Route::post('/archivar_expediente/{id}', [ExpedienteController::class, "archivar_expediente_desde_componente"])->name('archivar-expediente');
//Route::get('/archivar_expediente/{id}', [ExpedienteController::class, "archivar_expediente_desde_componente"])->name('archivar-expediente');
Route::get('/nombres_archivos_tramites/{num_tra}', [ExpedienteController::class, "traer_nombres_archivos_tramites"])->name('nombres_tramites');
Route::get('/cargar_profesionales', [ExpedienteController::class, "traer_personas_profesionales"])->name('cargar_profesionales');
Route::get('/expediente_finalizado/{num_tra}', [ExpedienteController::class, "expediente_finalizado"])->name('expediente-finalizado');
Route::get('/soy_agrimensor', [ExpedienteController::class, "revisar_si_soy_agrimensor"])->name('soy-agrimensor');

Route::get('/pruebafecha', [MovimientosController::class, "probando_la_fecha"])->name('prueba-fecha');

Route::get('generate-pdf', [PDFController::class, 'generatePDF']);
//http://localhost:8000/comprobante_exp/Contable/11/12312/Diego-Checarelli
Route::get('/comprobante_exp/{area}/{id}/{numero_expediente}/{nombre}', [PDFController::class, "generar_comprobante_exp"])->name('generar_comprobante_exp');


Route::get('/datos_expedientes_para_buscador', [ExpedienteController::class, "traer_exp_buscador"])->name('traer_exp_buscador');

//buscador
Route::post('buscador_web', [BuscadorController::class, "consulta_web"])->name('buscador.consulta');
// excel

Route::get('excel-csv-file', [ExcelCSVController::class, 'index']);
Route::post('import-excel-csv-file', [ExcelCSVController::class, 'importExcelCSV']);
Route::get('export-excel-csv-file/{slug}', [ExcelCSVController::class, 'exportExcelCSV']);

Route::get('mensajes_sin_leer', [ContactController::class, "mensajes_sin_leer"]);
Route::get("send-email", [EmailController::class, "sendEmail"]);

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
