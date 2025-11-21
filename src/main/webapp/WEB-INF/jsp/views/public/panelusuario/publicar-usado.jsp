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
    <title>PUBLICAR ARTÍCULO USADO</title>

</head>
<body>


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
        <div class="col-lg-8">

            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%= contextPath %>/inicio">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Publicar Artículo Usado</li>
                </ol>
            </nav>

            <div class="form-container">
                <h2 class="text-center text-primary mb-4 pb-2 border-bottom">
                    Publicación Rápida de Producto Usado
                </h2>
                <p class="text-muted text-center mb-5">
                    Clasifica tu instrumento para que aparezca en el catálogo correcto.
                </p>


                <form action="<%= contextPath %>/articulos/publicar" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>


                    <div class="row g-3 mb-4">

                        <div class="col-md-6">
                            <label for="tipo" class="form-label fw-bold">Tipo de Instrumento (*)</label>

                            <select class="form-select" id="tipo" name="tipoProducto" onchange="mostrarMarcas()" required>
                                <option value="" disabled selected>Selecciona tipo</option>
                                <option value="Guitarra">Guitarra Eléctrica</option>
                                <option value="Bajo">Bajo Eléctrico</option>
                            </select>
                        </div>


                        <div class="col-md-6">
                            <label for="marca" class="form-label fw-bold">Marca (*)</label>

                            <select class="form-select d-none" id="marcas_guitarras" name="marca" disabled>
                                <option value="" disabled selected>Selecciona marca de guitarra</option>
                                <option value="Fender">FENDER</option>
                                <option value="Gibson">GIBSON</option>
                                <option value="Schecter">SCHECTER</option>
                            </select>

                            <select class="form-select d-none" id="marcas_bajos" name="marca" disabled>
                                <option value="" disabled selected>Selecciona marca de bajo</option>
                                <option value="Fender">FENDER</option>
                                <option value="Ibanez">IBANEZ</option>
                                <option value="Schecter">SCHECTER</option>
                            </select>


                            <select class="form-select" id="marca_placeholder" name="marca_placeholder" disabled style="display: block;">
                                <option value="">Elige primero el tipo</option>
                            </select>

                        </div>
                    </div>



                    <div class="mb-4">
                        <label for="nombre" class="form-label fw-bold">Nombre del Producto (*)</label>
                        <input type="text" class="form-control" id="nombre" name="nombre"
                               placeholder="Ej: Bajo Eléctrico Ibanez SR500" required maxlength="100">
                    </div>


                    <div class="mb-4">
                        <label for="descripcion" class="form-label fw-bold">Descripción del Producto (*)</label>
                        <textarea class="form-control" id="descripcion" name="descripcion" rows="4"
                                  placeholder="Describe las características y el estado del instrumento." required></textarea>
                    </div>


                    <div class="mb-4">
                        <label for="imagen" class="form-label fw-bold">Foto del Producto (*)</label>

                        <input class="form-control" type="file" id="imagen" name="imagen" accept="image/*" required>
                        <div class="form-text">Sube la mejor foto de tu producto. Máximo 5MB (ejemplo).</div>
                    </div>

                    <div class="row g-3 mb-5">

                        <div class="col-md-6">
                            <label for="precio" class="form-label fw-bold">Precio (COP) (*)</label>
                            <div class="input-group">
                                <span class="input-group-text">$</span>
                                <input type="number" class="form-control" id="precio" name="precio"
                                       placeholder="1200000" min="1" required>
                            </div>
                        </div>


                        <div class="col-md-6">
                            <label for="stock" class="form-label fw-bold">Cantidad/Stock (*)</label>
                            <input type="number" class="form-control" id="stock" name="stock"
                                   placeholder="1" min="1" required>
                        </div>
                    </div>





                    <button type="submit" class="btn btn-primary btn-lg w-100">
                        Guardar Producto
                    </button>


                    <a href="<%= contextPath %>/inicio" class="btn btn-outline-secondary w-100 mt-3">
                        Cancelar y Volver al Panel
                    </a>
                </form>

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

<script>
    function mostrarMarcas() {
        const tipoSelect = document.getElementById('tipo');
        const marcaGuitarras = document.getElementById('marcas_guitarras');
        const marcaBajos = document.getElementById('marcas_bajos');
        const marcaPlaceholder = document.getElementById('marca_placeholder');
        const tipo = tipoSelect.value;


        marcaGuitarras.classList.add('d-none');
        marcaBajos.classList.add('d-none');
        marcaPlaceholder.style.display = 'none';

        marcaGuitarras.setAttribute('disabled', 'disabled');
        marcaBajos.setAttribute('disabled', 'disabled');


        if (tipo === 'Guitarra') {
            marcaGuitarras.classList.remove('d-none');
            marcaGuitarras.removeAttribute('disabled');
        } else if (tipo === 'Bajo') {
            marcaBajos.classList.remove('d-none');
            marcaBajos.removeAttribute('disabled');
        } else {
            marcaPlaceholder.style.display = 'block';
        }
    }


    window.onload = mostrarMarcas;
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>