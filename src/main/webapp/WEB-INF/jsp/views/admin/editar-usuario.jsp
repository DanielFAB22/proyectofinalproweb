<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="${pageContext.request.contextPath}/assets/css/styles.css" rel="stylesheet" type="text/css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <title>EDITAR USUARIO - SOLUCIONES MUSICALES</title>



</head>
<body>


<div class="container admin-container mt-4">
    <div class="row">
        <div class="col-12">
            <h1>Panel de Administraci&oacute;n</h1>
            <h2 class="mb-4">Editar Usuario: ${usuario.username}</h2>


            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>¡Error al guardar!</strong> ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>


            <a href="${pageContext.request.contextPath}/paneladmin#user-list" class="btn btn-secondary mb-4">
                &larr; Volver al Listado de Usuarios
            </a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">

            <form:form action="${pageContext.request.contextPath}/paneladmin/usuarios/guardar" method="POST" modelAttribute="usuario">


                <form:hidden path="id" />

                <form:hidden path="password" />

                <form:hidden path="roles" />

                <div class="mb-3">
                    <label for="username" class="form-label">Username:</label>
                    <form:input path="username" class="form-control" readonly="true"/>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <form:input path="email" class="form-control" required="true" type="email"/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Roles Asignados:</label>
                    <div>
                        <c:forEach var="rol" items="${usuario.roles}">
                            <span class="badge text-bg-primary">${rol.nombre}</span>
                        </c:forEach>
                    </div>
                    <small class="form-text text-muted">La gesti&oacute;n de roles es avanzada y no est&aacute; disponible en este formulario.</small>
                </div>

                <div class="alert alert-info mt-4">
                    **Advertencia:** Este formulario no permite cambiar la contrase&ntilde;a por seguridad. Solo el **Email** es editable.
                </div>

                <button type="submit" class="btn btn-success mt-3">
                    Guardar Cambios
                </button>

            </form:form>
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
                    <li><a href="${pageContext.request.contextPath}/somos" class="text-light text-decoration-none">Qui&eacute;nes somos</a></li>
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