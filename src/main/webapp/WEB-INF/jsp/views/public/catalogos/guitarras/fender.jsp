<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://solucionesmusicales.com/auth" prefix="auth" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <link href="${pageContext.request.contextPath}/assets/css/styles.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <title>FENDER GUITARRAS</title>
</head>
<body>
<header>

    <a href="${pageContext.request.contextPath}/">
        <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="logo soluciones musicales" class="logo">
    </a>

    <div class="iconos">

        <a href="${pageContext.request.contextPath}/carrito">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                 class="bi bi-basket" viewBox="0 0 16 16">
                <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1v4.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 13.5V9a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h1.217L5.07 1.243a.5.5 0 0 1 .686-.172zM2 9v4.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V9zM1 7v1h14V7zm3 3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 4 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 6 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 8 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5"/>
            </svg>
        </a>


        <c:choose>

            <c:when test="${auth:tieneRol(sessionScope.usuario, 'ROLE_ADMIN')}">
                <a href="${pageContext.request.contextPath}/paneladmin">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                         class="bi bi-person-circle" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                        <path fill-rule="evenodd"
                              d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7
                              a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8
                              10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
                    </svg>
                </a>
            </c:when>

            <c:otherwise>
                <a href="${pageContext.request.contextPath}/inicio">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                         class="bi bi-person-circle" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                        <path fill-rule="evenodd"
                              d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7
                              a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8
                              10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
                    </svg>
                </a>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="somos">
        <a href="${pageContext.request.contextPath}/somos"><h5>Quiénes somos?</h5></a>
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

<div class="container justify-content-center text-center">

    <img src="${pageContext.request.contextPath}/assets/img/catalogos/guitarras/fender/fender.png" class="d-block mx-auto p-3" alt="logo fender guitarras">
    <p >Fender es la marca más icónica en la historia de la guitarra eléctrica, conocida por sus diseños revolucionarios como la **Stratocaster** y la **Telecaster**. Con un tono brillante y versátil, las guitarras Fender han definido géneros desde el rock hasta el pop y el blues, siendo el estándar de la industria musical por más de siete décadas.</p>
</div>



<div class="container my-5">
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

        <c:choose>

            <c:when test="${not empty productos}">
                <c:forEach var="producto" items="${productos}">
                    <div class="col">
                        <div class="card h-100 shadow-sm">

                            <img src="${pageContext.request.contextPath}/assets/img/catalogos/${producto.imagenUrl}"
                                 class="card-img-top p-3"
                                 alt="${producto.nombre}"
                                 style="object-fit: contain; height: 250px;">
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title">${producto.nombre}</h5>


                                <button class="btn btn-sm btn-outline-secondary mb-2"
                                        type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#collapseDescription${producto.id}"
                                        aria-expanded="false"
                                        aria-controls="collapseDescription${producto.id}">
                                    Mostrar Descripción
                                </button>


                                <div class="collapse mb-3" id="collapseDescription${producto.id}">
                                    <p class="card-text text-muted small">${producto.descripcion}</p>
                                </div>


                                <p class="card-text text-success fs-4 mt-auto">
                                    <fmt:formatNumber value="${producto.precio}" type="currency" currencySymbol="$" maxFractionDigits="0" />
                                </p>
                            </div>
                            <div class="card-footer bg-white border-0 pt-0">
                                <form action="${pageContext.request.contextPath}/Agregarcarrito" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <input type="hidden" name="productos_id" value="${producto.id}">
                                    <button type="submit" class="btn btn-primary w-100">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket me-2" viewBox="0 0 16 16">
                                            <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1v4.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 13.5V9a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h1.217L5.07 1.243a.5.5 0 0 1 .686-.172zM2 9v4.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V9zM1 7v1h14V7zm3 3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 4 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 6 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 8 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5"/>
                                        </svg>
                                        AÑADIR AL CARRITO
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>

            <c:otherwise>
                <div class="col-12">
                    <div class="alert alert-info text-center" role="alert">
                        No hay guitarras Fender disponibles en este momento.
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

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
                    <li><a href="${pageContext.request.contextPath}/somos" class="text-light text-decoration-none">Quiénes somos</a></li>
                    <li><a href="${pageContext.request.contextPath}/catalogos/guitarras/fender" class="text-light text-decoration-none">Guitarras</a></li>
                    <li><a href="${pageContext.request.contextPath}/catalogos/bajos/fender" class="text-light text-decoration-none">Bajos</a></li>
                    <li><a href="#" class="text-light text-decoration-none">Contacto</a></li>
                </ul>
            </div>
        </div>

        <hr class="border-light">
        <p class="text-center mb-0">&copy; 2025 Soluciones Musicales - Todos los derechos reservados</p>
    </div>
</footer>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</html>