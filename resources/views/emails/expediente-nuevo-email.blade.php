<!DOCTYPE html>
<html>
<head>
<title>Moviento de expediente {{$num_expe}}</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
<style>
      html, body {
          background-color: #fff;
          color: #636b6f;
          font-family: 'Nunito', sans-serif;
          font-weight: 200;
          height: 100vh;
          margin: 0;
      }
      .content { text-align: center; }
      .title { font-size: 84px; }

      .info, .correcto, .ojo, .error, .validation {
    border: 1px solid;
    margin: 10px 0px;
    padding:15px 10px 15px 50px;
    background-repeat: no-repeat;
    background-position: 10px center;
    font-family:Arial, Helvetica, sans-serif;
    font-size:13px;
    text-align:left;
    width:auto;
}
.info {
    color: #00529B;
    background-color: #BDE5F8;
    background-image: url('imagenes/info.jpg');
}
.correcto {
    color: #4F8A10;
    background-color: #DFF2BF;
    background-image:url('imagenes/correcto.JPG');
}
.ojo {
    color: #9F6000;
    background-color: #FEEFB3;
    background-image: url('imagenes/ojo.JPG');
}
.error {
    color: #D8000C;
    background-color: #FFBABA;
    background-image: url('imagenes/error.jpg');
}

.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}

  </style>

</head>
<body>
        <div class="container box" style="width: 970px;">
            <h1 style="text-align:center;"> {{ $nombre }} </h1>
            <h3 align="center">{{ $fecha_creado }}</h3>
        </div>
        <div class="info"><b>Se acaba de crear un nuevo expediente a su nombre.</b></div>

        <p>Saludos Profesional de la Agrimensura, <strong>{{$nombre}}</strong>, esperamos tenga un excelente día.</p>
        <p> Nos comunicamos desde el Colegio de Profesionales de Agrimensores de San Juan. 
            Para darle aviso que en la fecha y hora {{$fecha_creado}}, se creó un nuevo expediente que lo involucra, con numero: {{$num_expe}}, a la vez esta siendo trasladado hacia el departamento: <strong> {{$nombre_area}}</strong></p>
        <strong><p>Es aviso no requiere de su intervensión.</p></strong>
        <p>Puede ver los datos del expediente, haciendo click en el siguiente boton</p>
        <div class="form-group">
            <a {{url('admin/expedientes/'. $id_expediente) }} ><button class="button">Ver Informacion de {{$num_expe}}</button></a>
        </div>
        <p>Se le seguiran enviando novedades, gracias por utilizar este servicio</p>
        <h4>Esperamos siga teniendo un gran día</h4>
        <h4>Saludos atentamente</h4>



</body>
</html>