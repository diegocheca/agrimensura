<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EmailController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MovimientosController;
use App\Http\Controllers\PDFController;
use App\Http\Controllers\ExcelCSVController;
use App\Expediente;
 
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
Route::post('/crear_movimiento', [MovimientosController::class, "crear_movimiento_desde_component"])->name('crear-movimiento');

Route::get('/datos_de_quien_creo_expdiente/{num_exp}', [MovimientosController::class, "traer_datos_creado_exp"])->name('datos_creador_exp');
Route::post('/recibir_expediente_por_movimiento', [MovimientosController::class, "recibir_exp_por_movimiento"])->name('recibir-exp-por-movimiento');


Route::get('/pruebafecha', [MovimientosController::class, "probando_la_fecha"])->name('prueba-fecha');

Route::get('generate-pdf', [PDFController::class, 'generatePDF']);
//http://localhost:8000/comprobante_exp/Contable/11/12312/Diego-Checarelli
Route::get('/comprobante_exp/{area}/{id}/{numero_expediente}/{nombre}', [PDFController::class, "generar_comprobante_exp"])->name('generar_comprobante_exp');

// excel

Route::get('excel-csv-file', [ExcelCSVController::class, 'index']);
Route::post('import-excel-csv-file', [ExcelCSVController::class, 'importExcelCSV']);
Route::get('export-excel-csv-file/{slug}', [ExcelCSVController::class, 'exportExcelCSV']);

Route::get('mensajes_sin_leer', [ContactController::class, "mensajes_sin_leer"]);
Route::get("send-email", [EmailController::class, "sendEmail"]);

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
