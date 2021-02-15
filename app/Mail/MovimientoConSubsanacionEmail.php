<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class MovimientoConSubsanacionEmail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($nombre, $fecha_entrada, $comentario, $bandera_observacion, $nombre_area, $tramite_finalizado, $id_expediente, $num_expe, $subsanacion )
    {
        //
        $this->name = $nombre;
        $this->fecha_entrada = $fecha_entrada;
        $this->comentario = $comentario;
        $this->bandera_observacion = $bandera_observacion;
        $this->nombre_area = $nombre_area;
        $this->tramite_finalizado = $tramite_finalizado;
        $this->id_expediente = $id_expediente;
        $this->num_expe = $num_expe;
        $this->subsanacion = $subsanacion;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from("no-reply@ingagrimensor.com")->view('emails.moviento-con-subsanacion-email')->with([
            'nombre' => $this->name,
            'fecha_entrada' => $this->fecha_entrada,
            'comentario' => $this->comentario,
            'bandera_observacion' => $this->bandera_observacion,
            'nombre_area' => $this->nombre_area,
            'tramite_finalizado' => $this->tramite_finalizado,
            'id_expediente' => $this->id_expediente,
            'num_expe' => $this->num_expe,
            'subsanacion' => $this->subsanacion,
        ]);
    }
}
