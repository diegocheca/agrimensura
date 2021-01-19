<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EmailController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MovimientosController;
use App\Http\Controllers\PDFController;
use App\Http\Controllers\ExcelCSVController;
 
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

Route::get('/movimientos_para_exp/{numero}', [MovimientosController::class, "traer_movimientos_para_expediente"])->name('movimientos');;

Route::get('generate-pdf', [PDFController::class, 'generatePDF']);
// excel

Route::get('excel-csv-file', [ExcelCSVController::class, 'index']);
Route::post('import-excel-csv-file', [ExcelCSVController::class, 'importExcelCSV']);
Route::get('export-excel-csv-file/{slug}', [ExcelCSVController::class, 'exportExcelCSV']);

Route::get('mensajes_sin_leer', [ContactController::class, "mensajes_sin_leer"]);
Route::get("send-email", [EmailController::class, "sendEmail"]);

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
