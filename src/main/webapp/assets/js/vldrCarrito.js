document.addEventListener("DOMContentLoaded", () => {
    const params = new URLSearchParams(window.location.search);
    const container = document.getElementById("alert-container");

    function showBootstrapAlert(message, type = "success") {
        if (!container) return;

        const alert = document.createElement("div");
        alert.className = `alert alert-${type} alert-dismissible fade show`;
        alert.role = "alert";
        alert.innerHTML = `
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        `;
        container.appendChild(alert);

        
        setTimeout(() => {
            bootstrap.Alert.getOrCreateInstance(alert).close();
        }, 3000);
    }

    if (params.has("error")) {
        const error = params.get("error");
        let mensaje = "";

        if (error === "stock_maximo") {
            mensaje = "No puedes añadir más unidades. Stock máximo alcanzado.";
        } else {
            mensaje = "Ha ocurrido un error al añadir el producto al carrito.";
        }

        showBootstrapAlert(mensaje, "danger");
        params.delete("error");
        window.history.replaceState({}, "", window.location.pathname);

    } else if (params.has("success")) {
        showBootstrapAlert("Producto añadido al carrito correctamente.", "success");
        params.delete("success");
        window.history.replaceState({}, "", window.location.pathname);
    }
});
