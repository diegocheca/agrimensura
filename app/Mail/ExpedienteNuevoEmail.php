<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ExpedienteNuevoEmail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($nombre, $fecha_creado, $nombre_area, $id_expediente, $num_expe, $tramite)
    {
        //
        $this->name = $nombre;
        $this->fecha_creado = $fecha_creado;
        $this->nombre_area = $nombre_area;
        $this->id_expediente = $id_expediente;
        $this->num_expe = $num_expe;
        $this->tramite = $tramite;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        //return $this->view('view.name');
        return $this->from("gismineronacional@gmail.com")->view('emails.expediente-nuevo-email')->with([
            'nombre' => $this->name,
            'fecha_creado' => $this->fecha_creado,
            'nombre_area' => $this->nombre_area,
            'tramite' => $this->tramite,
            'id_expediente' => $this->id_expediente,
            'num_expe' => $this->num_expe,
        ]);
    }
}
