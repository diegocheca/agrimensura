<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class VerificationEmail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($confirmation, $nombre, $cuil )
    {
        //
        $this->confirmation_code = $confirmation;
        $this->name= $nombre;
        $this->cuil= $cuil;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        //return $this->view('view.name');
        return $this->from("no-reply@ingagrimensor.com")->view('emails.confirmation_code')->with([
            'confirmation_code' => $this->confirmation_code,
            'name' => $this->name,
            'cuil' => $this->cuil,
        ]);
    }
}
