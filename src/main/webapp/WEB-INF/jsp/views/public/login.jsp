<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>LOGIN</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/login.css" rel="stylesheet">
</head>
<body>


<div class="login-container">
    <div class="login-card shadow-lg">
        <div class="text-center mb-4">
            <h2 class="fw-bold text-primary mt-2">LOGIN</h2>
            <p class="bold">Ingrese sus credenciales para acceder al sistema</p>
        </div>

        <form method="post" action="${pageContext.request.contextPath}/login">
            <div class="mb-3">
                <label class="form-label">Usuario</label>
                <input type="text" name="username" class="form-control form-control-lg rounded-3" placeholder="Ingrese su usuario" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Contraseña</label>
                <input type="password" name="password" class="form-control form-control-lg rounded-3" placeholder="Ingrese su contraseña" required>
            </div>

            <c:if test="${not empty param.error}">
                <div class="alert alert-danger text-center rounded-3 py-2">
                    Usuario o contraseña incorrectos.
                </div>
            </c:if>

            <c:if test="${not empty param.logout}">
                <div class="alert alert-success text-center rounded-3 py-2">
                    Has cerrado sesión correctamente.
                </div>
            </c:if>

            <button type="submit" class="btn btn-primary w-100 py-2 rounded-3 mt-3">
                Ingresar al sistema
            </button>
        </form>


        <div class="text-center mt-3">
            <p class="text-muted">
                ¿No tienes una cuenta?
                <a href="${pageContext.request.contextPath}/registro" class="text-primary fw-bold text-decoration-none">
                    ¡Regístrate gratis!
                </a>
            </p>
        </div>


    </div>
</div>

</body>
</html>