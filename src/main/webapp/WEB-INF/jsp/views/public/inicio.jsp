<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String contextPath = request.getContextPath();
%>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%= contextPath %>/assets/css/styles.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <title>DASHBOARD</title>

</head>
<body>
<div id="alert-container" class="position-fixed top-0 end-0 p-3" style="z-index: 1050;"></div>
<header>
    <a href="<%= contextPath %>/"><img src="<%= contextPath %>/assets/img/logo.png" alt="logo soluciones musicales" class="logo"></a>

    <div class="iconos">
        <a href="<%= contextPath %>/carrito">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-basket" viewBox="0 0 16 16">
                <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1v4.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 13.5V9a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h1.217L5.07 1.243a.5.5 0 0 1 .686-.172zM2 9v4.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V9zM1 7v1h14V7zm3 3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 4 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 6 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 8 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5"/>
            </svg>
        </a>
        <a href="<sec:authorize access="hasRole('ROLE_ADMIN')"><%= contextPath %>/paneladmin</sec:authorize><sec:authorize access="!hasRole('ROLE_ADMIN')"><%= contextPath %>/inicio</sec:authorize>">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
            </svg>
        </a>

    </div>
    <div class="somos">
        <a href="<%= contextPath %>/somos"><h5>Qui&eacute;nes somos?</h5></a>
    </div>


</header>
<nav class="menu">
    <div class="btn-group">
        <button class="btn btn-secondary btn-lg dropdown-toggle" type="button"
                data-bs-toggle="dropdown" aria-expanded="false">
            GUITARRAS ELÉCTRICAS
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/catalogos/guitarras/fender">FENDER</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/catalogos/guitarras/gibson">GIBSON</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/catalogos/guitarras/schecter">SCHECTER</a></li>
        </ul>
    </div>

    <div class="btn-group">
        <button class="btn btn-secondary btn-lg dropdown-toggle" type="button"
                data-bs-toggle="dropdown" aria-expanded="false">
            BAJOS ELÉCTRICOS
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/catalogos/bajos/fender">FENDER</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/catalogos/bajos/ibanez">IBANEZ</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/catalogos/bajos/schecter">SCHECTER</a></li>
        </ul>
    </div>


</nav>

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">

            <div class="user-panel">
                <div class="row align-items-center mb-4 border-bottom pb-3">
                    <div class="col-md-8">

                        <h2 class="text-primary fw-bold">Panel de Usuario</h2>
                        <h4 class="mb-0">Bienvenido, <span class="text-dark"><sec:authentication property="principal.username"/></span>!</h4>


                        <p class="text-muted mt-1 mb-0">Correo electrónico: <span class="fw-bold text-dark"><sec:authentication property="principal.email"/></span></p>
                    </div>
                    <div class="col-md-4 text-md-end mt-3 mt-md-0">

                        <form action="<%= contextPath %>/logout" method="post" class="d-inline">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button class="btn btn-outline-danger" type="submit">
                                Cerrar sesi&oacute;n
                            </button>
                        </form>
                    </div>
                </div>

                <div class="row">


                    <div class="col-md-3">
                        <h5 class="text-secondary mb-3">Opciones</h5>
                        <div class="list-group">
                            <a href="<%= contextPath %>/inicio" class="list-group-item list-group-item-action active">

                                Dashboard
                            </a>
                        </div>
                    </div>



                    <div class="col-md-9 mt-4 mt-md-0">
                        <div class="p-4 bg-white border border-primary rounded-3 text-center">
                            <h4 class="mb-3 text-primary">¿Tienes un instrumento que ya no usas?</h4>
                            <p class="text-muted mb-4">¡Publícalo y véndelo fácilmente a otros músicos de la comunidad!</p>


                            <a href="<%= contextPath %>/panelusuario/publicar-usado" class="btn btn-lg btn-success shadow-sm">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-cash-stack me-2" viewBox="0 0 16 16">
                                    <path d="M14 3H1a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h13a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v2H1V4zM15 8V4a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v4h13zm0 1H1v4a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V9z"/>
                                    <path d="M4.5 10a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zM4 12a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.5-.5z"/>
                                </svg>
                                Vender tu Instrumento Usado
                            </a>
                        </div>



                    </div>
                </div>
            </div>

        </div>
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
                    <li><a href="<%= contextPath %>/somos" class="text-light text-decoration-none">Qui&eacute;nes somos</a></li>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>