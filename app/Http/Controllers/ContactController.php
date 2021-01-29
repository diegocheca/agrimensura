<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Contact;
use Mail;
use App\Mail\ContactEmail;

class ContactController extends Controller
{
   public function contact()
    {
    return view('contact');
    } 
   /** * Show the application dashboard. * * @return \Illuminate\Http\Response */
   public function contactPost(Request $request) 
   {
    $this->validate($request, [ 'name' => 'required', 'email' => 'required|email', 'message' => 'required' ]);
    Contact::create($request->all());

    $to_email = "diegochecarelli@gmail.com";

    Mail::to($to_email)->send(new ContactEmail($request->get('name'),$request->get('email'),$request->get('message')));

    //return "<p> Success! Your E-mail has been sent.</p>";


//     Mail::send('email',
//        array(
//            'name' => $request->get('name'),
//            'email' => $request->get('email'),
//            'bodyMessage' => $request->get('message')
//        ), function($message)
//    {
//        //$message->from('gismineronacional@gmail.com');
//        //$message->to('diegochecarelli@gmail.com', 'DiegoC')->subject('Mensaje desde los agrimensores');
//    });
    return back()->with('success', 'Thank you for contacting me!'); 
   }

   public function mensajes_sin_leer()
   {
    $count = Contact::select("*")->where("estado", "=", "0")->count();
    var_dump($count);die();
   }
}