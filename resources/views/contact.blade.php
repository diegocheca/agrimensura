<!DOCTYPE html>
<html>
<head>
<title>DevDojo - Bobby Iliev - Contact Form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>

<div class="container">
<h1>Contact Me</h1>

@if(Session::has('success'))
   <div class="alert alert-success">
     {{ Session::get('success') }}
   </div>
@endif

{!! Form::open(['route'=>'contact.store']) !!}

<div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
    {!! Form::label('Name:') !!}
    {!! Form::text('name', old('name'), ['class'=>'form-control', 'placeholder'=>'Name']) !!}
<span class="text-danger">{{ $errors->first('name') }}</span>
</div>

<div class="form-group {{ $errors->has('email') ? 'has-error' : '' }}">
    {!! Form::label('Email:') !!}
    {!! Form::text('email', old('email'), ['class'=>'form-control', 'placeholder'=>'Email']) !!}
<span class="text-danger">{{ $errors->first('email') }}</span>
</div>

<div class="form-group {{ $errors->has('message') ? 'has-error' : '' }}">
    {!! Form::label('Message:') !!}
    {!! Form::textarea('message', old('message'), ['class'=>'form-control', 'placeholder'=>'Message']) !!}
<span class="text-danger">{{ $errors->first('message') }}</span>
</div>

<div class="form-group">
<button class="btn btn-success">Send mail</button>
</div>

{!! Form::close() !!}

</div>

</body>
</html>