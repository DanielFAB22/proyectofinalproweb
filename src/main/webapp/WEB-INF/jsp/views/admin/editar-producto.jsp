<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="${pageContext.request.contextPath}/assets/css/styles.css" rel="stylesheet" type="text/css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <title>EDITAR PRODUCTO - SOLUCIONES MUSICALES</title>


</head>
<body>

<div class="container admin-container mt-4">
    <div class="row">
        <div class="col-12">
            <h1>Panel de Administraci&oacute;n</h1>
            <h2 class="mb-4">Editar Producto: ${producto.nombre} (ID: ${producto.id})</h2>

            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>¡Error al guardar!</strong> ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>


            <a href="${pageContext.request.contextPath}/paneladmin#product-list" class="btn btn-secondary mb-4">
                &larr; Volver al Listado de Productos
            </a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8">

            <form:form action="${pageContext.request.contextPath}/paneladmin/productos/guardar" method="POST" modelAttribute="producto">

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <form:hidden path="id" />


                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre del Producto:</label>
                    <form:input path="nombre" class="form-control" required="true"/>
                </div>


                <div class="mb-3">
                    <label for="descripcion" class="form-label">Descripci&oacute;n:</label>
                    <form:textarea path="descripcion" class="form-control" rows="5" required="true"/>
                </div>


                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="precio" class="form-label">Precio (COP):</label>
                        <form:input path="precio" class="form-control" required="true" type="number" min="0"/>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="stock" class="form-label">Stock / Cantidad:</label>
                        <form:input path="stock" class="form-control" required="true" type="number" min="0"/>
                    </div>
                </div>


                <div class="row">

                    <div class="col-md-6 mb-3">
                        <label for="tipoProducto" class="form-label">Tipo de Producto:</label>
                        <form:select path="tipoProducto" class="form-select" required="true">
                            <form:option value="" label="-- Seleccione un tipo --" />
                            <form:option value="Guitarra" label="Guitarra" />
                            <form:option value="Bajo" label="Bajo" />
                        </form:select>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="marca" class="form-label">Marca:</label>
                        <form:input path="marca" class="form-control" required="true"/>
                    </div>
                </div>


                <div class="mb-3">
                    <label for="imagenUrl" class="form-label">URL de la Imagen (Ruta relativa):</label>
                    <form:input path="imagenUrl" class="form-control" placeholder="Ej: guitarras/marca/modelo.png"/>
                    <c:if test="${not empty producto.imagenUrl}">
                        <small class="form-text text-muted mt-2 d-block">Ruta de imagen actual: ${producto.imagenUrl}</small>

                    </c:if>
                </div>


                <div class="mb-3 form-check mt-4">
                    <form:checkbox path="destacado" class="form-check-input" id="destacado"/>
                    <label class="form-check-label" for="destacado">
                        Marcar como **Producto Destacado** en la página principal.
                    </label>
                </div>


                <button type="submit" class="btn btn-lg btn-success mt-4">
                    Guardar Cambios del Producto
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