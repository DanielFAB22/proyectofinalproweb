<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="<%= contextPath %>/assets/css/styles.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <title>REGISTRARSE</title>
</head>
<body>
<div id="alert-container" class="position-fixed top-0 end-0 p-3" style="z-index: 1050;"></div>
<header>

    <a href="<%= contextPath %>/index"><img src="<%= contextPath %>/assets/img/logo.png" alt="logo soluciones musicales" class="logo"></a>

    <div class="iconos">
        <a href="<%= contextPath %>/carrito.jsp">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-basket" viewBox="0 0 16 16">
                <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1v4.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 13.5V9a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h1.217L5.07 1.243a.5.5 0 0 1 .686-.172zM2 9v4.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V9zM1 7v1h14V7zm3 3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 4 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 6 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 8 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5"/>
            </svg>
        </a>


        <a href="<%= (session.getAttribute("usuario") != null) ? contextPath + "/inicio" : contextPath + "/login"%>">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                 class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                <path fill-rule="evenodd"
                      d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7
                          0 0 0-5.468 11.37C3.242 11.226 4.805 10 8
                          10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
            </svg>
        </a>


    </div>
    <div class="somos">
        <a href="<%= contextPath %>/somos"><h5>Quienes somos?</h5></a>
    </div>
</header>
<nav class="menu">
    <div class="btn-group">
        <button class="btn btn-secondary btn-lg dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            GUITARRAS ELECTRICAS
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%= contextPath %>/catalogos/guitarras/fender.jsp">FENDER</a></li>
            <li><a class="dropdown-item" href="<%= contextPath %>/catalogos/guitarras/gibson.jsp">GIBSON</a></li>
            <li><a class="dropdown-item" href="<%= contextPath %>/catalogos/guitarras/schecter.jsp">SCHECTER</a></li>


        </ul>
    </div>

    <div class="btn-group">
        <button class="btn btn-secondary btn-lg dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            BAJOS ELECTRICOS
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%= contextPath %>/catalogos/bajos/fender.jsp">FENDER</a></li>
            <li><a class="dropdown-item" href="<%= contextPath %>/catalogos/bajos/ibanez.jsp">IBANEZ</a></li>
            <li><a class="dropdown-item" href="<%= contextPath %>/catalogos/bajos/schecter.jsp">SCHECTER</a></li>


        </ul>
    </div>
</nav>
<div class="p-4">

    <form id="formRegistro" onsubmit="return nuevoRegistro(event);">
        <div class="mb-3">
            <label for="nombreUsuario" class="form-label">Nombre de usuario</label>

            <input type="text" name="username" class="form-control" id="nombreUsuario" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" required>
            <div id="emailHelp" class="form-text">Su correo no sera compartido a terceros.</div>
        </div>
        <div class="mb-3">
            <label for="contrasena" class="form-label">Contraseña</label>
            <input type="password" name="password" class="form-control" id="contrasena" required>
        </div>
        <button type="submit" class="btn btn-primary">Registrarse</button>
    </form>
    <div class="pt-4">

        <a href="<%= contextPath %>/login"><button  class="btn btn-secondary">Volver al Login</button></a>
    </div>
</div>


<footer class="bg-dark text-light mt-5 p-4">
    <div class="container">
        <div class="row">

            <div class="col-md-4">
                <h5>SOLUCIONES MUSICALES</h5>
                <p>Tu tienda de confianza en guitarras y bajos.</p>
            </div>


            <div class="col-md-4">
                <h5>Contacto</h5>
                <ul class="list-unstyled">
                    <li>+57 300 123 4567</li>
                    <li> contacto@solucionesmusicales.com</li>
                    <li> Neiva, Huila, Colombia</li>
                </ul>
            </div>


            <div class="col-md-4">
                <h5>Enlaces</h5>
                <ul class="list-unstyled">
                    <li><a href="<%= contextPath %>/somos" class="text-light text-decoration-none">Quiénes somos</a></li>
                    <li><a href="#" class="text-light text-decoration-none">Guitarras</a></li>
                    <li><a href="#" class="text-light text-decoration-none">Bajos</a></li>
                    <li><a href="#" class="text-light text-decoration-none">Contacto</a></li>
                </ul>
            </div>
        </div>

        <hr class="border-light">
        <p class="text-center mb-0">&copy; 2025 Soluciones Musicales - Todos los derechos reservados</p>
    </div>
</footer>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" xintegrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>


<script>

    window.contextPath = "<%= contextPath %>";
</script>


<script src="<%= contextPath %>/assets/js/vldrRegistro.js"></script>


</html>