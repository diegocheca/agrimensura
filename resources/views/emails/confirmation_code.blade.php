<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
</head>
<body>
    <h2>Hola {{ $name }}, gracias por registrarte en el sistema de <strong>Registro de Productores Mineros (RPM)</strong> !</h2>
    <p>Por favor confirma tu correo electrónico.</p>
    <p>Su cuil es: {{$cuil}}</p>
    <p>Para ello simplemente debes hacer click en el siguiente enlace:</p>

    <a href="{{ url('/register/verify/' . $confirmation_code) }}">
        Clic para confirmar tu email
    </a>

    <p>Desde ya muchas gracias</p>
    <p>Saludos desde el equipo de RPM</p>
</body>
</html>