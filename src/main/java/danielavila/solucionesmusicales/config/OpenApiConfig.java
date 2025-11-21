package danielavila.solucionesmusicales.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import io.swagger.v3.oas.models.Paths;
import io.swagger.v3.oas.models.Operation;
import io.swagger.v3.oas.models.PathItem;
import io.swagger.v3.oas.models.media.Content;
import io.swagger.v3.oas.models.media.MediaType;
import io.swagger.v3.oas.models.media.Schema;
import io.swagger.v3.oas.models.parameters.RequestBody;
import io.swagger.v3.oas.models.responses.ApiResponse;
import io.swagger.v3.oas.models.responses.ApiResponses;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Map;

@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("Aplicacion de Soluciones Musicales")
                        .version("1.0")
                        .description("Bienvenido a la documentacion de soluciones musicales."))
                .addSecurityItem(new SecurityRequirement().addList("basicAuth"))
                .components(new io.swagger.v3.oas.models.Components()
                        .addSecuritySchemes("basicAuth",
                                new SecurityScheme()
                                        .type(SecurityScheme.Type.HTTP)
                                        .scheme("basic")))
                .paths(buildPaths());
    }

    private Paths buildPaths() {
        Paths paths = new Paths();


        Operation checkoutOperation = new Operation()
                .summary("Procesar la compra y generar un pedido (Orden de Compra)")
                .description("Procesa el contenido del carrito de compras actual del usuario autenticado, genera un nuevo pedido (Orden de Compra), y vacía el carrito. Requiere autenticación y token CSRF.")
                .addTagsItem("Pedidos")
                .requestBody(new RequestBody()
                        .description("Token CSRF necesario para proteger el endpoint.")
                        .required(true)
                        .content(new Content()
                                .addMediaType("application/x-www-form-urlencoded", new MediaType()
                                        .schema(new Schema<Map<String, Object>>()
                                                .type("object")
                                                .addProperties("_csrf", new Schema<String>().type("string").description("Token de seguridad CSRF requerido por Spring Security.")))
                                        .example(Map.of("_csrf", "token-de-seguridad")))))
                .responses(new ApiResponses()
                        .addApiResponse("302", new ApiResponse()
                                .description("Redirección: Al recibo de confirmación en caso de éxito, o al carrito/otra página en caso de error (e.g., carrito vacío)."))
                        .addApiResponse("401", new ApiResponse().description("No autorizado / Usuario no autenticado.")));

        paths.addPathItem("/checkout", new PathItem().post(checkoutOperation));


        Operation verReciboOperation = new Operation()
                .summary("Ver el recibo de un pedido específico")
                .description("Muestra el detalle del pedido (recibo) tras la compra. Solo accesible si el pedido pertenece al usuario autenticado.")
                .addTagsItem("Pedidos")
                .addParametersItem(new io.swagger.v3.oas.models.parameters.Parameter()
                        .name("pedidoId")
                        .in("path")
                        .required(true)
                        .schema(new Schema<Long>().type("integer").format("int64"))
                        .description("ID del pedido cuyo recibo se desea ver."))
                .responses(new ApiResponses()
                        .addApiResponse("200", new ApiResponse().description("Página del recibo cargada correctamente."))
                        .addApiResponse("302", new ApiResponse().description("Redirección al login si no está autenticado, o a la página principal si el pedido no es accesible."))
                        .addApiResponse("401", new ApiResponse().description("No autorizado / Usuario no autenticado.")));

        paths.addPathItem("/pedido/confirmacion/{pedidoId}", new PathItem().get(verReciboOperation));



        Operation removeItemOperation = new Operation()
                .summary("Eliminar un producto del carrito")
                .description("Permite a un usuario autenticado eliminar una cantidad específica de un producto (ítem) de su carrito de compras. Requiere autenticación y token CSRF.")
                .addTagsItem("Carrito de Compras")
                .requestBody(new RequestBody()
                        .description("Datos del ítem a eliminar y token CSRF")
                        .required(true)
                        .content(new Content()
                                .addMediaType("application/x-www-form-urlencoded", new MediaType()
                                        .schema(new Schema<Map<String, Object>>()
                                                .type("object")
                                                .addProperties("itemId", new Schema<String>().type("string").description("ID único del ítem de carrito a eliminar."))
                                                .addProperties("_csrf", new Schema<String>().type("string").description("Token de seguridad CSRF requerido por Spring Security.")))
                                        .example(Map.of("itemId", "123", "_csrf", "token-de-seguridad")))))
                .responses(new ApiResponses()
                        .addApiResponse("302", new ApiResponse()
                                .description("Redirección al carrito o a la página de origen después de la eliminación exitosa."))
                        .addApiResponse("401", new ApiResponse().description("No autorizado / Usuario no autenticado.")));

        paths.addPathItem("/carrito/quitar", new PathItem().post(removeItemOperation));


        Operation logoutOperation = new Operation()
                .summary("Cerrar la sesión del usuario")
                .description("Endpoint estándar de Spring Security para cerrar la sesión activa del usuario. Requiere el token CSRF.")
                .addTagsItem("Autenticación")
                .requestBody(new RequestBody()
                        .description("Token CSRF")
                        .required(true)
                        .content(new Content()
                                .addMediaType("application/x-www-form-urlencoded", new MediaType()
                                        .schema(new Schema<Map<String, Object>>()
                                                .type("object")
                                                .addProperties("_csrf", new Schema<String>().type("string").description("Token de seguridad CSRF requerido por Spring Security.")))
                                        .example(Map.of("_csrf", "token-de-seguridad")))))
                .responses(new ApiResponses()
                        .addApiResponse("302", new ApiResponse().description("Redirección a la página de inicio de sesión o principal tras cerrar sesión."))
                        .addApiResponse("405", new ApiResponse().description("Método no permitido (Debe ser POST).")));

        paths.addPathItem("/logout", new PathItem().post(logoutOperation));

        return paths;
    }
}