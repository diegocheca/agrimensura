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
            <h3 align="center">{{ $fecha_entrada }}</h3>
        </div>
        <div class="ojo"><b>Su expdiente posee problemas que requieren ser subsanados.</b></div>

        <p>Saludos Profesional de la Agrimensura <strong>{{$nombre}}</strong>, esperamos tenga un excelente día.</p>
        <p> Nos comunicamos desde el Colegio de Profesionales Agrimensores de San Juan. 
            Para comunicarle que el expediente, con número: {{$num_expe}}, ha sido calificado como un expediente que requiere ser subsanado por ustred, a pedido del área: <strong> {{$nombre_area}}</strong></p>
        <p>Este aviso requiere de su intervención.</p>
        <hr>
        <br>
        <h4>La subsanación es:</h4>
        <p>{{ $subsanacion }}</p>
        <br>
        <hr>
        <p>Para remediar esta situación debe asistir en persona a la mesa de entrada de la DGR, con domicilio .... y teléfono interno: ....</p>
        <p>Puede ver el camino ya recorrido por el expediente, haciendo click en el siguiente enlace</p>
        <div class="form-group">
            <a {{url('admin/ver_movimientos') }} ><button class="button">Ver historial de  {{$num_expe}}</button></a>
        </div>
        <p>Se le seguiran enviando novedades, gracias por utilizar este servicio</p>
        <h4>Esperamos siga teniendo un gran día</h4>
        <h4>Saludos atentamente</h4>
</body>
</html>