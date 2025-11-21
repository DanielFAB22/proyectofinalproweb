package danielavila.solucionesmusicales.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController

@Tag(name = "Rutas de Acceso y Estado", description = "Endpoints de bienvenida, estado de la API y acceso a paneles protegidos (privados).")
public class PanelController {

    @Operation(
            summary = "Endpoint público",
            description = "Devuelve un mensaje accesible sin autenticación. "
                    + "Ideal para pruebas básicas o mensajes de bienvenida."
    )
    @GetMapping("/publico")
    public String publico() {
        return "Ruta pública: este endpoint no requiere autenticación.";
    }

    @Operation(
            summary = "Endpoint protegido 1 (Panel)",
            description = "Devuelve un mensaje accesible solo para usuarios autenticados. "
                    + "Puedes protegerlo según el rol en la configuración de seguridad."
    )
    @GetMapping("/privado/panel1")
    public String panelPrivado1() {
        return "Panel privado 1 - Solo accesible para usuarios autenticados.";
    }

    @Operation(
            summary = "Endpoint protegido 2 (Acceso)",
            description = "Otro ejemplo de ruta restringida a usuarios autenticados."
    )
    @GetMapping("/privado/panel2")
    public String panelPrivado2() {
        return "Panel privado 2 - Acceso restringido.";
    }

    @Operation(
            summary = "Endpoint de estado del servicio",
            description = "Devuelve un mensaje simple para verificar que la API está funcionando correctamente y está accesible."
    )
    @GetMapping("/status")
    public String status() {
        return "API funcionando correctamente.";
    }
}