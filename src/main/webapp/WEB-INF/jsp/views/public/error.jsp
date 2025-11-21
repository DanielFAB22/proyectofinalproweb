<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Acceso Denegado - Soluciones Musicales</title>


    <% String contextPath = request.getContextPath(); %>

    <link href="<%= contextPath %>/assets/css/styles.css" rel="stylesheet" type="text/css">
</head>
<body class="error-page-body">

<div class="error-card">
    <div class="error-icon">&#9888;</div>
    <h1>403 - Acceso Denegado</h1>
    <p>
        No tiene permiso para acceder al recurso solicitado.
        Su cuenta no cumple con los requisitos de rol para esta página.
    </p>
    <a href="<%= contextPath %>/" class="action-link">Ir a la Página Principal</a>
</div>

</body>
</html>