<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class AvisoFinalizoExpedienteEmail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($nombre_profesional, $fecha, $num_exp, $id_exp)
    {
        //
        $this->nombre_profesional = $nombre_profesional;
        $this->fecha = $fecha;
        $this->num_exp = $num_exp;
        $this->id_exp = $id_exp;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from("no-reply@ingagrimensor.com")->view('emails.expediente-finalizado-email')->with([
            'nombre_profesional' => $this->nombre_profesional,
            'fecha' => $this->fecha,
            'num_exp' => $this->num_exp,
            'id_expediente' => $this->id_exp
        ]);
    }
}
