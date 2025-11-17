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
    <link href="<%= contextPath %>/assets/css/styles.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <title>GESTIÓN DE USUARIOS - SOLUCIONES MUSICALES</title>

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
        <a href="<%= contextPath %>/paneladmin">
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
        <button class="btn btn-secondary btn-lg dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            GUITARRAS ELÉCTRICAS
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/catalogos/guitarras/fender">FENDER</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/catalogos/guitarras/gibson">GIBSON</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/catalogos/guitarras/schecter">SCHECTER</a></li>
        </ul>
    </div>
    <div class="btn-group">
        <button class="btn btn-secondary btn-lg dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            BAJOS ELÉCTRICOS
        </button>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/catalogos/bajos/fender">FENDER</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/catalogos/bajos/ibanez">IBANEZ</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/catalogos/bajos/schecter">SCHECTER</a></li>
        </ul>
    </div>
</nav>


<div class="container admin-container mt-4">
    <div class="row">
        <div class="col-12">
            <h1>Gesti&oacute;n de Usuarios</h1>
            <p class="lead">Listado completo de usuarios registrados.</p>


            <a href="<%= contextPath %>/paneladmin" class="btn btn-secondary mb-3">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
                </svg>
                Volver al Panel Principal
            </a>


            <c:if test="${not empty success}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>¡Éxito!</strong> ${success}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>¡Error!</strong> ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <h2 class="mt-4">Lista de Usuarios</h2>

            <div class="table-responsive">
                <table class="table table-striped table-hover align-middle">
                    <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Rol</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>

                    <sec:authentication var="currentUsername" property="name"/>

                    <c:forEach var="usuario" items="${usuarios}">
                        <tr>
                            <td>${usuario.id}</td>

                            <td>
                                    ${usuario.username}
                                <c:if test="${usuario.username == currentUsername}">
                                    <span class="badge text-bg-primary ms-2">USUARIO ACTUAL</span>
                                </c:if>
                            </td>
                            <td>${usuario.email}</td>
                            <td>
                                    ${usuario.rol}
                                <c:if test="${usuario.rol == 'ADMIN' && usuario.username != currentUsername}">
                                    <span class="badge text-bg-danger ms-2">ADMIN</span>
                                </c:if>
                            </td>
                            <td>
                                <c:choose>

                                    <c:when test="${usuario.username == currentUsername}">
                                        <span class="badge text-bg-secondary p-2">Protegido (Self)</span>
                                    </c:when>


                                    <c:when test="${usuario.rol == 'ADMIN'}">
                                        <span class="badge text-bg-secondary p-2">Protegido (Admin)</span>
                                    </c:when>


                                    <c:otherwise>
                                        <a href="<%= contextPath %>/paneladmin/usuarios/editar/${usuario.id}" class="btn btn-sm btn-warning text-dark me-2">
                                            Editar
                                        </a>
                                        <a href="<%= contextPath %>/paneladmin/usuarios/eliminar/${usuario.id}"
                                           onclick="return confirm('¿Está seguro de que desea eliminar al usuario ${usuario.username}?')"
                                           class="btn btn-sm btn-danger">
                                            Eliminar
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty usuarios}">
                        <tr>
                            <td colspan="5" class="text-center">No hay usuarios registrados en el sistema.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" xintegrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</body>
</html>