



function showToast(message, type) {

    const alertContainer = document.getElementById('alert-container');
    if (!alertContainer) {
        console.error("Contenedor de alertas no encontrado.");
        return;
    }

    const toastHtml = `
        <div class="toast align-items-center text-white bg-${type} border-0" role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="5000">
            <div class="d-flex">
                <div class="toast-body">
                    ${message}
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    `;
    alertContainer.insertAdjacentHTML('beforeend', toastHtml);
    const toastEl = alertContainer.lastElementChild;
    const toast = new bootstrap.Toast(toastEl);
    toast.show();


    toastEl.addEventListener('hidden.bs.toast', () => {
        toastEl.remove();
    });
}


async function nuevoRegistro(event) {
    event.preventDefault();

    const form = event.target;
    const data = new FormData(form);
    const jsonData = {};


    jsonData.username = data.get('username');
    jsonData.email = data.get('email');
    jsonData.password = data.get('password');


    if (!jsonData.username || !jsonData.email || !jsonData.password) {
        showToast("Por favor, complete todos los campos requeridos.", 'danger');
        return false;
    }


    const contextPath = window.contextPath || '';

    try {

        const response = await fetch(contextPath + '/api/registro', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',

            },
            body: JSON.stringify(jsonData)
        });

        if (response.ok) {

            showToast("¡Registro exitoso! Serás redirigido al inicio de sesión.", 'success');

            setTimeout(() => {
                window.location.href = contextPath + '/login';
            }, 2000);
        } else {

            const errorData = await response.json().catch(() => ({}));
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

    return false;
}