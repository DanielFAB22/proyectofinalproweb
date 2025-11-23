document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("formRegistro");

    function showToast(message, type = "success") {
        const container = document.getElementById("alert-container");
        if (!container) return;

        const toast = document.createElement("div");
        toast.className = `alert alert-${type} alert-dismissible fade show`;
        toast.role = "alert";
        toast.innerHTML = `
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        `;
        container.appendChild(toast);

        setTimeout(() => {
            bootstrap.Alert.getOrCreateInstance(toast).close();
        }, 3000);
    }

    async function nuevoRegistro(event) {
        event.preventDefault();

        console.log("=== Iniciando registro ===");

        const data = new FormData(event.target);
        const jsonData = {
            username: data.get('username'),
            email: data.get('email'),
            password: data.get('password')
        };

        console.log("Datos del formulario:", jsonData);

        if (!jsonData.username || !jsonData.email || !jsonData.password) {
            console.warn("Campos requeridos incompletos.");
            showToast("Por favor, complete todos los campos requeridos.", 'danger');
            return false;
        }

        const contextPath = window.contextPath || '';
        const url = contextPath + '/api/registro';
        console.log("URL de la API:", url);

        try {
            console.log("Enviando petición POST a la API...");
            const response = await fetch(url, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(jsonData)
            });

            console.log("Respuesta recibida:", response);

            if (response.ok) {
                console.log("Registro exitoso.");
                showToast("¡Registro exitoso! Serás redirigido al inicio de sesión.", 'success');

                setTimeout(() => {
                    console.log("Redirigiendo al login...");
                    window.location.href = contextPath + '/login';
                }, 2000);
            } else {
                console.warn("Respuesta con error:", response.status);

                const errorData = await response.json().catch(() => ({}));
                console.log("Datos de error del servidor:", errorData);

                let errorMessage = errorData.message || `Error ${response.status}: Ha ocurrido un problema.`;

                if (response.status === 409) {
                    errorMessage = "Error: El nombre de usuario o email ya están en uso.";
                } else if (response.status === 400) {
                    errorMessage = "Error de validación: Por favor, revisa los datos ingresados.";
                } else if (response.status === 500) {
                    errorMessage = "Error interno del servidor. Intenta más tarde.";
                }

                showToast(errorMessage, 'danger');
            }

        } catch (error) {
            console.error('Error de red durante el registro:', error);
            showToast("Error de conexión con el servidor. Verifica tu red.", 'danger');
        }

        console.log("=== Fin de la función nuevoRegistro ===");
        return false;
    }

    if (form) {
        form.addEventListener("submit", nuevoRegistro);
    } else {
        console.error("Formulario de registro no encontrado.");
    }
});
