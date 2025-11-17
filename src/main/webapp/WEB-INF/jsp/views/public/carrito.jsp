<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ taglib uri="http://solucionesmusicales.com/auth" prefix="auth" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>CARRITO</title>
    <link href="${pageContext.request.contextPath}/assets/css/styles.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Estilo para la alerta fija en la parte superior */
        .fixed-alert {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1050;
            width: 90%; /* Ancho en móvil */
            max-width: 400px; /* Ancho máximo en escritorio */
        }
    </style>
</head>
<body>

<header>
    <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="logo soluciones musicales" class="logo"></a>

    <div class="iconos">

        <c:choose>
            <c:when test="${auth:tieneRol(sessionScope.usuario, 'ROLE_ADMIN')}">

                <a href="${pageContext.request.contextPath}/paneladmin" title="Los administradores no usan el carrito">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-basket-fill text-muted" viewBox="0 0 16 16">
                        <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1v4.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 13.5V9a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h1.217L5.07 1.243a.5.5 0 0 1 .686-.172zM2 9v4.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V9zM1 7v1h14V7zm3 3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 4 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 6 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 8 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5"/>
                    </svg>
                </a>
            </c:when>
            <c:otherwise>

                <a href="${pageContext.request.contextPath}/carrito">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-basket" viewBox="0 0 16 16">
                        <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1v4.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 13.5V9a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h1.217L5.07 1.243a.5.5 0 0 1 .686-.172zM2 9v4.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V9zM1 7v1h14V7zm3 3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 4 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 6 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 8 10m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5m2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5"/>
                    </svg>
                </a>
            </c:otherwise>
        </c:choose>


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

<div class="container p-4">

    <h1 class="p-4">Carrito de <c:out value="${usuarioNombre}"/></h1>


    <c:if test="${not empty error || not empty mensaje}">
        <div class="fixed-alert">
            <c:choose>
                <c:when test="${not empty error}">

                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong> Error:</strong> <c:out value="${error}"/>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:when>
                <c:when test="${not empty mensaje}">

                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Éxito:</strong> <c:out value="${mensaje}"/>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:when>
            </c:choose>
        </div>
    </c:if>


    <c:choose>

        <c:when test="${auth:tieneRol(sessionScope.usuario, 'ROLE_ADMIN')}">
            <div class="alert alert-warning text-center p-5">
                <h2>Acceso Restringido</h2>
                <p class="lead">Los **Administradores** no pueden realizar compras en la tienda. Esta funcionalidad está reservada para los clientes.</p>
                <a href="${pageContext.request.contextPath}/paneladmin" class="btn btn-primary btn-lg mt-3">Ir al Panel de Administración</a>
            </div>
        </c:when>


        <c:otherwise>

            <c:choose>
                <c:when test="${empty carrito.items}">
                    <div class="alert alert-info">Tu carrito está vacío. ¡Es hora de agregar unos instrumentos!</div>
                </c:when>
                <c:otherwise>
                    <table class="table table-striped">
                        <thead class="table-dark">
                        <tr>
                            <th>Producto</th>
                            <th>Precio Unidad</th>
                            <th>Cantidad</th>
                            <th>Subtotal</th>
                            <th>Acción</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="item" items="${carrito.items}">
                            <tr>
                                <td><c:out value="${item.producto.nombre}"/></td>

                                <td><fmt:formatNumber value="${item.producto.precio}" type="currency" currencySymbol="$" /></td>


                                <td><c:out value="${item.cantidad}"/></td>


                                <td><fmt:formatNumber value="${item.subtotal}" type="currency" currencySymbol="$" /></td>

                                <td>

                                    <form action="${pageContext.request.contextPath}/carrito/quitar" method="post" style="display:inline;">

                                        <input type="hidden" name="itemId" value="${item.id}" />
                                        <button type="submit" class="btn btn-danger btn-sm" title="Quitar item">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                                <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4h7.764L13 11v9a1 1 0 0 0 1 1H3a1 1 0 0 0 1-1V4z"/>
                                            </svg>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>


                    <h3 class="p-4 text-end">Total del Carrito: <fmt:formatNumber value="${carrito.total}" type="currency" currencySymbol="$" /></h3>

                    <div class="d-flex justify-content-end">
                        <a href="${pageContext.request.contextPath}/checkout" class="btn btn-success btn-lg">Proceder al Pago</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>

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
                    <li><a href="${pageContext.request.contextPath}/guitarras" class="text-light text-decoration-none">Guitarras</a></li>
                    <li><a href="${pageContext.request.contextPath}/bajos" class="text-light text-decoration-none">Bajos</a></li>
                    <li><a href="${pageContext.request.contextPath}/contacto" class="text-light text-decoration-none">Contacto</a></li>
                </ul>
            </div>
        </div>

        <hr class="border-light">
        <p class="text-center mb-0">&copy; 2025 Soluciones Musicales - Todos los derechos reservados</p>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>