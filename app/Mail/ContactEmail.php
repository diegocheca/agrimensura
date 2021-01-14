<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ContactEmail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($nombre, $email_remitente, $cuerpo)
    {
        //
        $this->name=$nombre;
        $this->email=$email_remitente;
        $this->bodyMessage=$cuerpo;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        //return $this->view('view.name');
        return $this->from("gismineronacional@gmail.com")->view('emails.email-contact')->with([
            'name' => $this->name,
            'email' => $this->email,
            'bodyMessage' => $this->bodyMessage,

        ]);
    }
}
