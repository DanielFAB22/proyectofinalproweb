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


            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

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


        <div class="mt-4 pt-3 border-top">
            <p class="text-center text-muted mb-3">O inicie sesión con</p>


            <a href="${pageContext.request.contextPath}/oauth2/authorization/google"
               class="btn btn-social btn-danger w-100 py-2 rounded-3 mb-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" viewBox="0 0 16 16">
                    <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.15 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.442-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.868 2.408 3.309 4.492 3.309 1.09 0 2.112-.34 2.934-.936z"/>
                </svg>
                Iniciar sesión con Google
            </a>


            <a href="${pageContext.request.contextPath}/oauth2/authorization/github"
               class="btn btn-social btn-dark w-100 py-2 rounded-3">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" viewBox="0 0 16 16">
                    <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.28.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.01 8.01 0 0 0 16 8c0-4.42-3.58-8-8-8"/>
                </svg>
                Iniciar sesión con GitHub
            </a>
        </div>



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