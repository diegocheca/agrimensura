<?php
  
namespace App\Http\Controllers;
  
use Illuminate\Http\Request;
use PDF;
  
class PDFController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function generatePDF()
    {
        $data = [
            'title' => 'Welcome to ItSolutionStuff.com',
            'date' => date('m/d/Y')
        ];
          
        $pdf = PDF::loadView('myPDF', $data);
    
        return $pdf->download('itsolutionstuff.pdf');
    }
    public function generar_comprobante_exp ( $area, $id, $numero_expediente, $nombre)
    {
        $data_para_pdf = [
            'title' => 'Comprobante de Creacion de Un nuevo Expdiente en el sistema informático',
            'fecha' => date("d/m/Y H:i:s"),
            'nombre_area' => $area, 
            'id_exp' => $id, 
            'num_exp' => $numero_expediente,
            'nombre_profesional' => $nombre

        ];
        $pdf = PDF::loadView('pdfs.comprobante_creacion_expediente', $data_para_pdf);
        return $pdf->download('Comprobante de Creacion de expdiente numero:'.$numero_expediente.'.pdf');
    }
}