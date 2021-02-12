<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="Bootstrap, Landing page, Template, Business, Service">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="author" content="Grayrids">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>CPASJ - Colegio de Profesionales de la Agrimensura de SJ</title>
    <!--====== Favicon Icon ======-->
    <link rel="icon" href="{{ url('slick/img/cpasj.ico')}}"  type="image/icon type">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="{{ url('slick/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{ url('slick/css/animate.css')}}">
    <link rel="stylesheet" href="{{ url('slick/css/LineIcons.css')}}">
    <link rel="stylesheet" href="{{ url('slick/css/owl.carousel.css')}}">
    <link rel="stylesheet" href="{{ url('slick/css/owl.theme.css')}}">
    <link rel="stylesheet" href="{{ url('slick/css/magnific-popup.css')}}">
    <link rel="stylesheet" href="{{ url('slick/css/nivo-lightbox.css')}}">
    <link rel="stylesheet" href="{{ url('slick/css/main.css')}}">    
    <link rel="stylesheet" href="{{ url('slick/css/responsive.css')}}">

  </head>
  
  <body>

    <!-- Header Section Start -->
    <header id="home" class="hero-area">    
      <div class="overlay">
        <span></span>
        <span></span>
      </div>
      <nav class="navbar navbar-expand-md bg-inverse fixed-top scrolling-navbar">
        <div class="container">
          <a href="index.html" class="navbar-brand"><img src="img/logo.png" alt=""></a>       
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <i class="lni-menu"></i>
          </button>
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto w-100 justify-content-end">
              <li class="nav-item">
                <a class="nav-link page-scroll" href="#home">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link page-scroll" href="#services">Info</a>
              </li>  
              <li class="nav-item">
                <a class="nav-link page-scroll" href="#features">Servicios</a>
              </li>                            
              <li class="nav-item">
                <a class="nav-link page-scroll" href="#buscador">Buscador</a>
              </li>       
              <li class="nav-item">
                <a class="nav-link page-scroll" href="#team">Dptos</a>
              </li> 
              {{-- <li class="nav-item">
                <a class="nav-link page-scroll" href="#blog">Blog</a>
              </li>   --}}
              <li class="nav-item">
                <a class="nav-link page-scroll" href="#contact">Contact</a>
              </li> 
              <li class="nav-item">
                <a class="btn btn-singin" href="{{url('admin')}}">Ingresar</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>  
      <div class="container">      
        <div class="row space-100">
          <div class="col-lg-6 col-md-12 col-xs-12">
            <div class="contents">
              <h2 class="head-title">Sistema web para la gestion de Expedientes <br>Colegio de Professionales de la Agrimensura</h2>
              <p>Sistema web para el seguimientos de expedientes </p>
              <div class="header-button">
                <a href="{{url('/admin/')}}" class="btn btn-border-filled">Iniciar Sistema</a>
                <a href="#contact" class="btn btn-border page-scroll">Contacto</a>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-md-12 col-xs-12 p-0">
            <div class="intro-img">
              <img src="{{ url('slick/img/homepage.svg')}}" alt="">
            </div>            
          </div>
        </div> 
      </div>             
    </header>
    <!-- Header Section End --> 


    <!-- Services Section Start -->
    <section id="services" class="section">
      <div class="container">

        <div class="row">
          <!-- Start Col -->
          <div class="col-lg-4 col-md-6 col-xs-12">
            <div class="services-item text-center">
              <div class="icon">
                <i class="lni-cog"></i>
              </div>
              <h4>Proceso Eficiente</h4>
              <p>Se implementó un sólido y moderno proceso para la administración eficiente de los tramites a realizar por los Profesionales dela Agrimensura .</p>
            </div>
          </div>
          <!-- End Col -->
          <!-- Start Col -->
          <div class="col-lg-4 col-md-6 col-xs-12">
            <div class="services-item text-center">
              <div class="icon">
                <i class="lni-cloud-sync"></i>
              </div>
              <h4>Datos en la Nube</h4>
              <p>Tanto el sistema como los datos se encuentran en la nube, esto garantiza un servicio ininterrumpido y confiable, los datos nunca se perderán.</p>
            </div>
          </div>
          <!-- End Col -->
          <!-- Start Col -->
          <div class="col-lg-4 col-md-6 col-xs-12">
            <div class="services-item text-center">
              <div class="icon">
                <i class="lni-lock"></i>
              </div>
              <h4>Seguro y Confiable</h4>
              <p>El sistema fue diseñado teniendo en cuenta las mejores prácticas y estándares globales para brindar un servicio seguro.</p>
            </div>
          </div>
          <!-- End Col -->

        </div>
      </div>
    </section>
    <!-- Services Section End -->



    <!-- Business Plan Section Start -->
    <section id="business-plan">
      <div class="container">

        <div class="row">
          <!-- Start Col -->
          <div class="col-lg-6 col-md-12 pl-0 pt-70 pr-5">
            <div class="business-item-img">
              <img src="{{ url('slick/img/business/business-img.png')}}" class="img-fluid" alt="">
            </div>
          </div>
          <!-- End Col -->
          <!-- Start Col -->
          <div class="col-lg-6 col-md-12 pl-4">
            <div class="business-item-info">
              <h3>Siempre contectados</h3>
              <p>Se ha implementado una metodología que persigue la conectividad de las partes sobre todo. <br>El sistema dará aviso a los <strong>Profesionales de la Agrimensura de San Juan </strong> el estado de los expedientes en tiempo real. De esta manara, se reducen tiempos administrativos, ahorro de tiempos de los profesionales, suma transparencia y crea un fluido canal de comunicación.</p>

              
            </div>
          </div>
          <!-- End Col -->

        </div>
      </div>
    </section>
    <!-- Business Plan Section End -->



    <!-- Cool Fetatures Section Start -->
    <section id="features" class="section">
      <div class="container">
        <!-- Start Row -->
        <div class="row">
          <div class="col-lg-12">
            <div class="features-text section-header text-center">  
              <div>   
                <h2 class="section-title">Servicios Brindados</h2>
                <div class="desc-text">
                  <p>Algunos de los sericios y caracteristicas del sistema, que son puestos a disposición para los <br> <strong>Profesionales de la Agrimensura de San Juan </strong>.</p>
                </div>
              </div> 
            </div>
          </div>

        </div>
        <!-- End Row -->
        <!-- Start Row -->
        <div class="row featured-bg">
         <!-- Start Col -->
          <div class="col-lg-6 col-md-6 col-xs-12 p-0">
             <!-- Start Fetatures -->
            <div class="feature-item featured-border1">
               <div class="feature-icon float-left">
                 <i class="lni-key"></i>
               </div>
               <div class="feature-info float-left">
                 <h4>Acceso Seguro</h4>
                 <p>Cada usuario tiene acceso a información limitada<br> brindando seguridad y confidencialidad.</p>
               </div>
            </div>
            <!-- End Fetatures -->
          </div>
           <!-- End Col -->
          
         <!-- Start Col -->
          <div class="col-lg-6 col-md-6 col-xs-12 p-0">
             <!-- Start Fetatures -->
            <div class="feature-item featured-border2">
               <div class="feature-icon float-left">
                 <i class="lni-add-file"></i>
               </div>
               <div class="feature-info float-left">
                 <h4>Archivos Online</h4>
                 <p>Los archivos adjuntos en cada expediente <br> son alamcenados de una manera <br> segura y confible</p>
                 <!--  seguro <br>y confiable, estando disponibles para ser accedidos <br>en todo momento.-->
               </div>
            </div>
            <!-- End Fetatures -->
          </div>
           <!-- End Col -->
          
         <!-- Start Col -->
          <div class="col-lg-6 col-md-6 col-xs-12 p-0">
             <!-- Start Fetatures -->
            <div class="feature-item featured-border1">
               <div class="feature-icon float-left">
                 <a href="#buscador"><i class="lni-search"></i></a>
               </div>
               <div class="feature-info float-left">
                 <h4>Buscador</h4>
                 <p>Se ha desarrollado un buscador online <br> de expedientes para saber su estado actual<br> en cualquier momento.</p>
               </div>
            </div>
            <!-- End Fetatures -->
          </div>
           <!-- End Col -->
          
         <!-- Start Col -->
          <div class="col-lg-6 col-md-6 col-xs-12 p-0">
             <!-- Start Fetatures -->
            <div class="feature-item featured-border2">
               <div class="feature-icon float-left">
                <i class="lni-mobile"></i>
               </div>
               <div class="feature-info float-left">
                 <h4>Movil</h4>
                 <p>Puede ser accedido desde dispositivos <br> moviles sin importar su pantalla a marca.</p>
               </div>
            </div>
            <!-- End Fetatures -->
          </div>
           <!-- End Col -->
          
         <!-- Start Col -->
          <div class="col-lg-6 col-md-6 col-xs-12 p-0">
             <!-- Start Fetatures -->
            <div class="feature-item featured-border3">
               <div class="feature-icon float-left">
                 <i class="lni-reload"></i>
               </div>
               <div class="feature-info float-left">
                 <h4>Actualización</h4>
                 <p>El sistema será mejorado constantemente <br> para así,  brindar un aún mejor servicio</p>
               </div>
            </div>
            <!-- End Fetatures -->
          </div>
           <!-- End Col -->
          
         <!-- Start Col -->
          <div class="col-lg-6 col-md-6 col-xs-12 p-0">
             <!-- Start Fetatures -->
            <div class="feature-item">
               <div class="feature-icon float-left">
                 <i class="lni-support"></i>
               </div>
               <div class="feature-info float-left">
                 <h4>Sporte Técnico</h4>
                 <p>El sistema tiene soporte técnico 24/7 ante  <br> cualquier incoveniente o duda brindando una <br> rápida respuesta.</p>
               </div>
            </div>
            <!-- End Fetatures -->
          </div>
           <!-- End Col -->
          

        </div>
        <!-- End Row -->
      </div>
    </section>
    <!-- Cool Fetatures Section End --> 

   <!-- Search Section -->
   <section id="buscador" class="section">
    <!-- Container Starts -->
    <div class="container">
      <!-- Start Row -->
      <div class="row">
        <div class="col-lg-12">
          <div class="contact-text section-header text-center">  
            <div>   
              <h2 class="section-title">Buscador de Expedientes</h2>
              <div class="desc-text">
                <span>Por favor ingreso los datos del expediente que esta buscando</span>  
              </div>
            </div> 
          </div>
        </div>

      </div>
      <!-- End Row -->
      <!-- Start Row -->
      <div class="row">

       
        <!-- Start Col -->
        <div class="col-lg-6 col-md-12">
          <form id="buscar_form" action="{{url('buscador_web')}}">
            <div class="form-group">
              <label for="numero">Numero :</label>
              <input class="form-control" name="numero" id="numero" type="text" />
            </div>  
            <div class="form-group">
              <label for="profesional">Profesional :</label>
              <input class="form-control" name="profesional" id="profesional" type="text" />
            </div>  
            <div class="form-group">
              <label for="movimientos">Cantidad de Movimientos :</label>
              <input class="form-control" name="movimientos" id="movimientos" type="text" />
            </div>  
            <div class="submit-button">
              <button class="btn btn-common" style="width:100%" id="submit" type="submit">Buscar</button>
              <div id="msgSubmit" class="h3 hidden"></div> 
              <div class="clearfix"></div> 
            </div>
          </form>
          <input id="id_exp" name="id_exp" type="hidden" />
        </div>
        <!-- End Col -->
        <!-- Start Col -->
        <div class="col-lg-1">
          
        </div>
        <!-- End Col -->
        <!-- Start Col -->
        <div class="col-lg-4 col-md-12">
          <span>Resultado</span>
          <div id="container"></div>
        </div>
        <!-- End Col -->
        <!-- Start Col -->
        <div class="col-lg-1">
        </div>
        <!-- End Col -->

      </div>
      <!-- End Row -->
    </div>
  </section>
  <!-- Search Section End -->

  <div class="modal fade" id="modalRegister" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Datos del Expediente</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form>
            <div class="form-group">
              <label for="num_exp_buscado" class="col-form-label">Numero de expediente:</label>
              <input type="text" class="form-control" id="num_exp_buscado">
            </div>
            
            <div class="form-group">
              <label for="oficina_actual_buscado" class="col-form-label">Oficina Actual:</label>
              <input type="text" class="form-control" id="oficina_actual_buscado">
            </div>
            <div class="form-group">
              <label for="profesional_buscado" class="col-form-label">Profesional Solicitante:</label>
              <input type="text" class="form-control" id="profesional_buscado">
            </div>
            <div class="form-group">
              <label for="profesional_email_buscado" class="col-form-label">Email del Profesional:</label>
              <input type="text" class="form-control" id="profesional_email_buscado">
            </div>
            
            <div class="form-group">
              <label for="fecha_ult_mov_buscado" class="col-form-label">Fecha de ultimo Movimiento:</label>
              <input type="text" class="form-control" id="fecha_ult_mov_buscado">
            </div>
            <div class="form-group">
              <label for="cantidad_mov_buscado" class="col-form-label">Cantidad de Movimentos:</label>
              <input type="text" class="form-control" id="cantidad_mov_buscado">
            </div>
            <div class="form-group">
              <label for="comentario_ult_mov_buscado" class="col-form-label">Comentario de Movimiento:</label>
              <input type="text" class="form-control" id="comentario_ult_mov_buscado">
            </div>
            
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          {{-- <button type="button" class="btn btn-primary">Send message</button> --}}
        </div>
      </div>
    </div>
  </div>

    <!-- Recent Showcase Section Start ->
    <section id="showcase">
      <div class="container-fluid right-position">
        <!-- Start Row ->
        <div class="row gradient-bg">
          <div class="col-lg-12">
            <div class="showcase-text section-header text-center">  
              <div>   
                <h2 class="section-title">Recent Works</h2>
                <div class="desc-text">
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do</p>  
                  <p>eiusmod tempor incididunt ut labore et dolore.</p>
                </div>
              </div> 
            </div>
          </div>

        </div>
        <!-- End Row ->
        <!-- Start Row ->
        <div class="row justify-content-center showcase-area">
          <div class="col-lg-12 col-md-12 col-xs-12 pr-0">
            <div class="showcase-slider owl-carousel">
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="{{ url('slick/img/showcase/01.jpg')}}" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="{{ url('slick/img/showcase/01.jpg')}}"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="{{ url('slick/img/showcase/02.jpg')}}" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="{{ url('slick/img/showcase/02.jpg')}}"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="{{ url('slick/img/showcase/03.jpg')}}" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="{{ url('slick/img/showcase/03.jpg')}}"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="{{ url('slick/img/showcase/04.jpg')}}" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="{{ url('slick/img/showcase/04.jpg')}}"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/05.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/05.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/01.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/01.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/02.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/02.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/03.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/03.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/04.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/04.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/05.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/05.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/01.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/01.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/02.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/01.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/03.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/01.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/04.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/01.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/05.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/01.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/01.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/01.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/02.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/01.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/03.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/01.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/04.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/01.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="screenshot-thumb">
                  <img src="img/showcase/05.jpg" class="img-fluid" alt="" />
                  <div class="hover-content text-center">
                    <div class="fancy-table">
                      <div class="table-cell">
                        <div class="single-text">
                          <p>Icon , Web</p>
                          <h5>Redesign Slack</h5>
                        </div>
                        <div class="zoom-icon">
                          <a class="lightbox" href="img/showcase/01.jpg"><i class="lni-zoom-in"></i></a>
                          <a href="#"><i class="lni-link"></i></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
             

              
            </div>
          </div>
        </div>
        <!-- End Row ->
      </div>
    </section>
    <!-- Recent Showcase Section End --> 

    <!-- Our Pricing Plan Section Start ->
    <section id="pricing" class="section">
      <div class="container">
        <!-- Start Row ->
        <div class="row">
          <div class="col-lg-12">
            <div class="pricing-text section-header text-center">  
              <div>   
                <h2 class="section-title">Pricing Plans</h2>
                <div class="desc-text">
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do</p>  
                  <p>eiusmod tempor incididunt ut labore et dolore.</p>
                </div>
              </div> 
            </div>
          </div>

        </div>
        <!-- End Row ->
        <!-- Start Row ->
        <div class="row pricing-tables">
         <!--  Start Col ->
          <div class="col-lg-4 col-md-4 col-xs-12">
            <div class="pricing-table text-center">
              <div class="pricing-details">
                <h3>Free</h3>
                <h1><span>$</span>00</h1>
                <ul>
                  <li>Free Instalation</li>
                  <li>500MB Storage</li>
                  <li>Single User</li>
                  <li>5 GB Bandwith</li>
                  <li>Minimal Features</li>
                  <li>No Dashboard</li>
                </ul>
              </div>
              <div class="plan-button">
                <a href="#" class="btn btn-border">Purchase</a>
              </div>
            </div>
          </div>
           <!--  End Col ->
         <!--  Start Col ->
          <div class="col-lg-4 col-md-4 col-xs-12">
            <div class="pricing-table text-center">
              <div class="pricing-details">
                <h3>standard</h3>
                <h1><span>$</span>19.99</h1>
                <ul>
                  <li>Free Instalation</li>
                  <li>2 GB Storage</li>
                  <li>Upto 2 users</li>
                  <li>50 GB Bandwith</li>
                  <li>All Features</li>
                  <li>Sales Dashboard</li>                  
                </ul>
              </div>
              <div class="plan-button">
                <a href="#" class="btn btn-common">Purchase</a>
              </div>
            </div>
          </div>
           <!--  End Col ->
         <!--  Start Col ->
          <div class="col-lg-4 col-md-4 col-xs-12">
            <div class="pricing-table text-center">
              <div class="pricing-details">
                <h3>Business</h3>
                <h1><span>$</span>29.99</h1>
                <ul>
                  <li>Free Instalation</li>
                  <li>5 GB Storage</li>
                  <li>Upto 4 users</li>
                  <li>100 GB Bandwith</li>
                  <li>All Features</li>
                  <li>Sales Dashboard</li>
                </ul>
              </div>
              <div class="plan-button">
                <a href="#" class="btn btn-border">Purchase</a>
              </div>
            </div>
          </div>
           <!--  End Col ->

        </div>
        <!-- End Row ->
      </div>
    </section>
    <!-- Our Pricing Plan Section End --> 

    <!-- Client Testimoninals Section Start ->
    <section id="testimonial" class="section">
      <div class="container right-position">
        <!-- Start Row ->
        <div class="row">
          <div class="col-md-12 col-sm-12">
            <div class="video-promo-content text-center">

              <a id="play-video" class="video-play-button video-popup" href="https://www.youtube.com/watch?v=Y4fodpIwal8&list=RDXCElIIYx_8s&index=13">
                <span></span>
              </a>

            </div>
          </div>
        </div>
        <!-- End Row ->
        <!-- Start Row ->
        <div class="row justify-content-center testimonial-area">
          <div class="col-lg-10 col-md-12 col-sm-12 col-xs-12 pr-20 pl-20" style="overflow: hidden;padding-bottom: 60px">
            <div id="client-testimonial" class="text-center owl-carousel">
              <div class="item">
                <div class="testimonial-item">
                  <div class="content-inner">
                    <p class="description">Appropriately implement one-to-one catalysts for change <br> vis-a-vis wireless catalysts for change. Enthusiastically architect <br> adaptive e-tailers after sustainable total linkage. Appropriately <br> implement one-to-one catalysts for change.</p>
                    <div class="author-info">
                      <h5>Tahmina Anny ; <span> UIdeck Customer</span></h5>
                    </div>
                  </div>
                  <div class="client-thumb">
                    <img src="img/testimonial/01.png" alt="">
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-item">
                  <div class="content-inner">
                    <p class="description">Appropriately implement one-to-one catalysts for change <br> vis-a-vis wireless catalysts for change. Enthusiastically architect <br> adaptive e-tailers after sustainable total linkage. Appropriately <br> implement one-to-one catalysts for change.</p>
                    <div class="author-info">
                      <h5>Tahmina Anny ; <span> UIdeck Customer</span></h5>
                    </div>
                  </div>
                  <div class="client-thumb">
                    <img src="img/testimonial/01.png" alt="">
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-item">
                  <div class="content-inner">
                    <p class="description">Appropriately implement one-to-one catalysts for change <br> vis-a-vis wireless catalysts for change. Enthusiastically architect <br> adaptive e-tailers after sustainable total linkage. Appropriately <br> implement one-to-one catalysts for change.</p>
                    <div class="author-info">
                      <h5>Tahmina Anny ; <span> UIdeck Customer</span></h5>
                    </div>
                  </div>
                  <div class="client-thumb">
                    <img src="img/testimonial/01.png" alt="">
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-item">
                  <div class="content-inner">
                    <p class="description">Appropriately implement one-to-one catalysts for change <br> vis-a-vis wireless catalysts for change. Enthusiastically architect <br> adaptive e-tailers after sustainable total linkage. Appropriately <br> implement one-to-one catalysts for change.</p>
                    <div class="author-info">
                      <h5>Tahmina Anny ; <span> UIdeck Customer</span></h5>
                    </div>
                  </div>
                  <div class="client-thumb">
                    <img src="img/testimonial/01.png" alt="">
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-item">
                  <div class="content-inner">
                    <p class="description">Appropriately implement one-to-one catalysts for change <br> vis-a-vis wireless catalysts for change. Enthusiastically architect <br> adaptive e-tailers after sustainable total linkage. Appropriately <br> implement one-to-one catalysts for change.</p>
                    <div class="author-info">
                      <h5>Tahmina Anny ; <span> UIdeck Customer</span></h5>
                    </div>
                  </div>
                  <div class="client-thumb">
                    <img src="img/testimonial/01.png" alt="">
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-item">
                  <div class="content-inner">
                    <p class="description">Appropriately implement one-to-one catalysts for change <br> vis-a-vis wireless catalysts for change. Enthusiastically architect <br> adaptive e-tailers after sustainable total linkage. Appropriately <br> implement one-to-one catalysts for change.</p>
                    <div class="author-info">
                      <h5>Tahmina Anny ; <span> UIdeck Customer</span></h5>
                    </div>
                  </div>
                  <div class="client-thumb">
                    <img src="img/testimonial/01.png" alt="">
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
        <!-- End Row ->
      </div>
    </section>
    <!-- Client Testimoninals Section End --> 


    <!-- Team section Start -->
    <section id="team" class="section">
      <div class="container">
        <!-- Start Row -->
        <div class="row">
          <div class="col-lg-12">
            <div class="team-text section-header text-center">  
              <div>   
                <h2 class="section-title">Departamentos</h2>
                <div class="desc-text">
                  <p>Estos son los departamento que componen el CPASJ</p>  
                </div>
              </div> 
            </div>
          </div>

        </div>
        <!-- End Row -->
        <!-- Start Row -->
        <div class="row">
          <!-- Start Col -->
          <div class="col-lg-3 col-md-6 col-xs-12">
            <div class="single-team">
              <div class="team-thumb">
                <img src="{{url('slick/img/team/oficina1.svg')}}" class="img-fluid" alt="" width="263" height="310">
              </div>

              <div class="team-details">
              <div class="team-social-icons">
                  <ul class="social-list">
                    <li><a href="#"><i class="lni-facebook-filled"></i></a></li>
                    <li><a href="#"><i class="lni-twitter-filled"></i></a></li>
                    <li><a href="#"><i class="lni-google-plus"></i></a></li>
                  </ul>
                </div> 
                <div class="team-inner text-center">
                  <h5 class="team-title">Oficina de Mesa de Entrada</h5>
                  <p>Tel: 4302525</p>
                  <p>email: mesaentrada@sanjuan.gov.ar</p>
                </div>
              </div>
            </div>
          </div>
          <!-- Start Col -->
 
          <!-- Start Col -->
          <div class="col-lg-3 col-md-6 col-xs-12">
            <div class="single-team">
              <div class="team-thumb">
                <img src="{{url('slick/img/team/oficina2.svg')}}" class="img-fluid" alt="" width="263" height="310">
              </div>

              <div class="team-details">
              <div class="team-social-icons">
                  <ul class="social-list">
                    <li><a href="#"><i class="lni-facebook-filled"></i></a></li>
                    <li><a href="#"><i class="lni-twitter-filled"></i></a></li>
                    <li><a href="#"><i class="lni-google-plus"></i></a></li>
                  </ul>
                </div>
                <div class="team-inner text-center">
                  <h5 class="team-title">Oficina Contable</h5>
                  <p>Tel: 4302525</p>
                  <p>email: contable@sanjuan.gov.ar</p>
                </div>
              </div>
            </div>
          </div>
          <!-- Start Col -->
 
          <!-- Start Col -->
          <div class="col-lg-3 col-md-6 col-xs-12">
            <div class="single-team">
              <div class="team-thumb">
                <img src="{{url('slick/img/team/oficina3.svg')}}" class="img-fluid" alt="" width="263" height="310">
              </div>

              <div class="team-details">
              <div class="team-social-icons">
                  <ul class="social-list">
                    <li><a href="#"><i class="lni-facebook-filled"></i></a></li>
                    <li><a href="#"><i class="lni-twitter-filled"></i></a></li>
                    <li><a href="#"><i class="lni-google-plus"></i></a></li>
                  </ul>
                </div>
                <div class="team-inner text-center">
                  <h5 class="team-title">Oficina Director</h5>
                  <p>Tel: 4302525</p>
                  <p>email: directordgr@sanjuan.gov.ar</p>
                </div>
              </div>
            </div>
          </div>
          <!-- Start Col -->
 
          <!-- Start Col -->
          <div class="col-lg-3 col-md-6 col-xs-12">
            <div class="single-team">
              <div class="team-thumb">
                <img src="{{url('slick/img/team/oficina4.svg')}}" class="img-fluid" alt="" width="263" height="310">
              </div>

              <div class="team-details">
                <div class="team-social-icons">
                  <ul class="social-list">
                    <li><a href="#"><i class="lni-facebook-filled"></i></a></li>
                    <li><a href="#"><i class="lni-twitter-filled"></i></a></li>
                    <li><a href="#"><i class="lni-google-plus"></i></a></li>
                  </ul>
                </div>
                <div class="team-inner text-center">
                  <h5 class="team-title">Oficina Letrada</h5>
                  <p>Tel: 4302525</p>
                  <p>email: letrada@sanjuan.gov.ar</p>
                </div>
              </div>
            </div>
          </div>
          <!-- Start Col -->
 

        </div>
        <!-- End Row -->
      </div>
    </section>
    <!-- Team section End -->


    <!-- Blog Section ->
    <section id="blog" class="section">
      <!-- Container Starts ->
      <div class="container">
        <!-- Start Row ->
        <div class="row">
          <div class="col-lg-12">
            <div class="blog-text section-header text-center">  
              <div>   
                <h2 class="section-title">Latest Blog Posts</h2>
                <div class="desc-text">
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do</p>  
                  <p>eiusmod tempor incididunt ut labore et dolore.</p>
                </div>
              </div> 
            </div>
          </div>

        </div>
        <!-- End Row ->
        <!-- Start Row ->
        <div class="row">
          <!-- Start Col ->
          <div class="col-lg-4 col-md-6 col-xs-12 blog-item">
            <!-- Blog Item Starts ->
            <div class="blog-item-wrapper">
              <div class="blog-item-img">
                <a href="single-post.html">
                  <img src="img/blog/01.jpg" class="img-fluid" alt="">
                </a>             
              </div>
              <div class="blog-item-text"> 
                <h3><a href="single-post.html">How Slick Will Transform  <br>Your Business</a></h3>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry.</p>
                <a href="" class="read-more">5 Min read</a>
              </div>
              <div class="author">
                <span class="name"><i class="lni-user"></i><a href="#">Posted by Admin</a></span>
                <span class="date float-right"><i class="lni-calendar"></i><a href="#">10 April, 2020</a></span>
              </div>
            </div>
            <!-- Blog Item Wrapper Ends-->
          </div>
          <!-- End Col ->
          <!-- Start Col ->
          <div class="col-lg-4 col-md-6 col-xs-12 blog-item">
            <!-- Blog Item Starts ->
            <div class="blog-item-wrapper">
              <div class="blog-item-img">
                <a href="single-post.html">
                  <img src="img/blog/02.jpg" class="img-fluid" alt="">
                </a>             
              </div>
              <div class="blog-item-text"> 
                <h3><a href="single-post.html">Growth Techniques for  <br>New Startups</a></h3>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry.</p>
                <a href="" class="read-more">5 Min read</a>
              </div>
              <div class="author">
                <span class="name"><i class="lni-user"></i><a href="#">Posted by Admin</a></span>
                <span class="date float-right"><i class="lni-calendar"></i><a href="#">10 April, 2020</a></span>
              </div>
            </div>
            <!-- Blog Item Wrapper Ends->
          </div>
          <!-- End Col ->
          <!-- Start Col ->
          <div class="col-lg-4 col-md-6 col-xs-12 blog-item">
            <!-- Blog Item Starts ->
            <div class="blog-item-wrapper">
              <div class="blog-item-img">
                <a href="single-post.html">
                  <img src="img/blog/03.jpg" class="img-fluid" alt="">
                </a>             
              </div>
              <div class="blog-item-text"> 
                <h3><a href="single-post.html">Writing Professional <br>Emails to Customers</a></h3>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry.</p>
                <a href="" class="read-more">5 Min read</a>
              </div>
              <div class="author">
                <span class="name"><i class="lni-user"></i><a href="#">Posted by Admin</a></span>
                <span class="date float-right"><i class="lni-calendar"></i><a href="#">10 April, 2020</a></span>
              </div>
            </div>
            <!-- Blog Item Wrapper Ends->
          </div>
          <!-- End Col ->

        </div>
        <!-- End Row ->
      </div>
    </section>
    <!-- blog Section End -->

    <!-- Contact Us Section -->
    <section id="contact" class="section">
      <!-- Container Starts -->
      <div class="container">
        <!-- Start Row -->
        <div class="row">
          <div class="col-lg-12">
            <div class="contact-text section-header text-center">  
              <div>   
                <h2 class="section-title">Contactanos</h2>
                <div class="desc-text">
                  <p>Ante cualquier duda, sugerencia o inquitud, no dude en escribirnos</p>  
                </div>
              </div> 
            </div>
          </div>

        </div>
        <!-- End Row -->
        <!-- Start Row -->
        <div class="row">

         
          <!-- Start Col -->
          <div class="col-lg-6 col-md-12">
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
          {{-- <div class="form-group">
            <button class="btn btn-success">Enviar</button>
          </div> --}}
          <div class="submit-button">
            <button class="btn btn-common" style="width:100%" id="submit" type="submit">Enviar</button>
            <div id="msgSubmit" class="h3 hidden"></div> 
            <div class="clearfix"></div> 
          </div>

          {!! Form::close() !!}
          {{-- <form id="contactForm">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <input type="text" class="form-control" id="name" name="name" placeholder="Name" required data-error="Please enter your name">
                  <div class="help-block with-errors"></div>
                </div>                                 
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <input type="text" placeholder="Subject" id="msg_subject" class="form-control" name="msg_subject" required data-error="Please enter your subject">
                  <div class="help-block with-errors"></div>
                </div> 
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <input type="text" class="form-control" id="email" name="email" placeholder="Email" required data-error="Please enter your Email">
                  <div class="help-block with-errors"></div>
                </div>                                 
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <input type="text" placeholder="Budget" id="budget" class="form-control" name="budget" required data-error="Please enter your Budget">
                  <div class="help-block with-errors"></div>
                </div> 
              </div>
              <div class="col-md-12">
                <div class="form-group"> 
                  <textarea class="form-control" id="message"  name="message" placeholder="Write Message" rows="4" data-error="Write your message" required></textarea>
                  <div class="help-block with-errors"></div>
                </div>
                <div class="submit-button">
                  <button class="btn btn-common" style="width:100%" id="submit" type="submit">Enviar</button>
                  <div id="msgSubmit" class="h3 hidden"></div> 
                  <div class="clearfix"></div> 
                </div>
              </div>
            </div>            
          </form> --}}
          </div>
          <!-- End Col -->
          <!-- Start Col -->
          <div class="col-lg-1">
            
          </div>
          <!-- End Col -->
          <!-- Start Col -->
          <div class="col-lg-4 col-md-12">
            <div class="contact-img">
              <img src="{{ url('slick/img/contact/01.png')}}" class="img-fluid" alt="">
            </div>
          </div>
          <!-- End Col -->
          <!-- Start Col -->
          <div class="col-lg-1">
          </div>
          <!-- End Col -->

        </div>
        <!-- End Row -->
      </div>
    </section>
    <!-- Contact Us Section End -->

    <!-- Footer Section Start -->
    <footer>
      <!-- Footer Area Start -->
      <section id="footer-Content">
        <div class="container">
          <!-- Start Row -->
          <div class="row">

          <!-- Start Col -->
            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 col-mb-12">
              
              <div class="footer-logo">
               <img src="img/footer-logo.png" alt="">
              </div>
            </div>
             <!-- End Col -->
              <!-- Start Col -->
            <div class="col-lg-2 col-md-6 col-sm-6 col-xs-6 col-mb-12">
              <div class="widget">
                <h3 class="block-title">Company</h3>
                <ul class="menu">
                  <li><a href="#">  - About Us</a></li>
                  <li><a href="#">- Career</a></li>
                  <li><a href="#">- Blog</a></li>
                  <li><a href="#">- Press</a></li>
                </ul>
              </div>
            </div>
             <!-- End Col -->
              <!-- Start Col -->
            <div class="col-lg-2 col-md-6 col-sm-6 col-xs-6 col-mb-12">
              <div class="widget">
                <h3 class="block-title">Product</h3>
                <ul class="menu">
                  <li><a href="#">  - Customer Service</a></li>
                  <li><a href="#">- Enterprise</a></li>
                  <li><a href="#">- Price</a></li>
                  <li><a href="#">- Scurity</a></li>
                  <li><a href="#">- Why SLICK?</a></li>
                </ul>
              </div>
            </div>
             <!-- End Col -->
              <!-- Start Col -->
            <div class="col-lg-2 col-md-6 col-sm-6 col-xs-6 col-mb-12">
              <div class="widget">
                <h3 class="block-title">Download App</h3>
                <ul class="menu">
                  <li><a href="#">  - Android App</a></li>
                  <li><a href="#">- IOS App</a></li>
                  <li><a href="#">- Windows App</a></li>
                  <li><a href="#">- Play Store</a></li>
                  <li><a href="#">- IOS Store</a></li>
                </ul>
              </div>
            </div>
             <!-- End Col -->
              <!-- Start Col -->
            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 col-mb-12">
              <div class="widget">
                <h3 class="block-title">Subscribe Now</h3>
                <p>Appropriately implement calysts for change visa wireless catalysts for change. </p>
                <div class="subscribe-area">
                  <input type="email" class="form-control" placeholder="Enter Email">
                  <span><i class="lni-chevron-right"></i></span>
                </div>
              </div>
            </div>
            <!-- End Col -->
          </div>
          <!-- End Row -->
        </div>
        <!-- Copyright Start  -->

        <div class="copyright">
          <div class="container">
            <!-- Star Row -->
            <div class="row">
              <div class="col-md-12">
                <div class="site-info text-center">
                  <p>Crafted by <a href="http://uideck.com" rel="nofollow">UIdeck</a></p>
                </div>              
                
              </div>
              <!-- End Col -->
            </div>
            <!-- End Row -->
          </div>
        </div>
      <!-- Copyright End -->
      </section>
      <!-- Footer area End -->
      
    </footer>
    <!-- Footer Section End --> 


    <!-- Go To Top Link -->
    <a href="#" class="back-to-top">
      <i class="lni-chevron-up"></i>
    </a> 

    <!-- Preloader -->
    <div id="preloader">
      <div class="loader" id="loader-1"></div>
    </div>
    <!-- End Preloader -->

    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="{{ url('slick/js/jquery-min.js')}}"></script>
    <script src="{{ url('slick/js/popper.min.js')}}"></script>
    <script src="{{ url('slick/js/bootstrap.min.js')}}"></script>
    <script src="{{ url('slick/js/owl.carousel.js')}}"></script>      
    <script src="{{ url('slick/js/jquery.nav.js')}}"></script>    
    <script src="{{ url('slick/js/scrolling-nav.js')}}"></script>    
    <script src="{{ url('slick/js/jquery.easing.min.js')}}"></script>     
    <script src="{{ url('slick/js/nivo-lightbox.js')}}"></script>     
    <script src="{{ url('slick/js/jquery.magnific-popup.min.js')}}"></script>      
    <script src="{{ url('slick/js/main.js')}}"></script>
    <script> 
    //mis funciones 
    $.ajaxSetup({
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });
    //he seleccionado un expediente
    function buscar_datos_exp(id){
      $('#modalRegister').modal('show');
      $('#id_exp').val(id);
      $('#num_exp_buscado').val(id);
      $.ajax({
          type: 'GET',
          url: 'http://localhost:8000/datos_ultimo_movimiento_para_exp_ajax/'+id,
          success: function(data) {
            console.log('el resultado es:\n');
            console.log(data);
            $('#oficina_actual_buscado').val(data.nombre);
            $('#profesional_buscado').val(data.profesional);
            $('#profesional_email_buscado').val(data.profesionalemail);
            $('#cantidad_mov_buscado').val(data.orden);
            var fecha = new Date(data.fecha_entrada);

            $('#fecha_ult_mov_buscado').val(fecha.toLocaleDateString());
            $('#comentario_ult_mov_buscado').val(data.comentario);
          },
          error: function(error) {
            // Do something with the error
            alert("error en algo");
          }
      });
    };
    $('#buscar_form').submit(function(event){
      event.preventDefault();
      var $form = $(this);
      $.ajax({
          type: 'POST',
          url: $form.attr('action'),
          data: $form.serialize(),
          success: function(data) {
            // Do something with the response
            console.log('el resultado es:\n');
            console.log(data);
            var html = "";
            $("#container").html("");
            html += "<ul>";
            $.each(data, function (index, item) {
                    html += "<li> <a href='#' onclick='buscar_datos_exp("+item.numero_expediente+")'>" + item.numero_expediente + "</a></li><hr>";
            });
            html += "</ul>";
            $("#container").append(html);
          },
          error: function(error) {
            // Do something with the error
            alert("error en algo");
          }
      });
    });
    //fin de mis funciones
    $('document').ready(function () {
      //para expedientes
      //fin expedientes

      //Init datepicker for date fields if data-datepicker attribute defined
      //or if browser does not handle date inputs
      });
</script>
  </body>
</html>