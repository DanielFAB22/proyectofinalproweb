package danielavila.solucionesmusicales.controller;

import danielavila.solucionesmusicales.model.Carrito;
import danielavila.solucionesmusicales.model.Pedido;
import danielavila.solucionesmusicales.service.CarritoService;
import danielavila.solucionesmusicales.service.PedidoService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;


@Controller
@RequiredArgsConstructor
public class PedidoController {

    private final CarritoService carritoService;
    private final PedidoService pedidoService;


    @GetMapping("/checkout")
    public String procederAlPago(Authentication authentication, RedirectAttributes redirectAttributes) {

        if (authentication == null || !authentication.isAuthenticated()) {
            return "redirect:/login";
        }

        String username = authentication.getName();

        try {

            boolean isAdmin = authentication.getAuthorities().stream()
                    .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));

            if (isAdmin) {
                redirectAttributes.addFlashAttribute("error", "Funcionalidad deshabilitada. Los administradores no pueden realizar compras.");
                return "redirect:/carrito";
            }


            Carrito carrito = carritoService.obtenerCarritoDeUsuario(username);

            if (carrito == null || carrito.getItems().isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "No se puede proceder al pago: el carrito está vacío.");
                return "redirect:/carrito";
            }


            Long pedidoId = pedidoService.procesarCompra(carrito);


            carritoService.vaciarCarrito(username);

            redirectAttributes.addFlashAttribute("mensaje", "¡Su compra ha sido realizada con éxito! Aquí está el recibo.");


            return "redirect:/pedido/confirmacion/" + pedidoId;

        } catch (RuntimeException e) {

            System.err.println("Error en /checkout al procesar la compra para " + username + ": " + e.getMessage());
            e.printStackTrace();

            redirectAttributes.addFlashAttribute("error", "Error al procesar el pago: " + e.getMessage());
            return "redirect:/carrito";
        }
    }


    @GetMapping("/pedido/confirmacion/{pedidoId}")
    public String verRecibo(@PathVariable("pedidoId") Long pedidoId,
                            Model model,
                            Authentication authentication,
                            RedirectAttributes redirectAttributes) {

        if (authentication == null || !authentication.isAuthenticated()) {
            return "redirect:/login";
        }

        String username = authentication.getName();

        try {

            Pedido pedido = pedidoService.obtenerPedidoParaRecibo(pedidoId, username);


            LocalDateTime localDateTime = pedido.getFechaCreacion();
            Date fechaPedidoLegacy = Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());


            model.addAttribute("fechaPedidoLegacy", fechaPedidoLegacy);

            model.addAttribute("orden", pedido);


            return "views/public/recibo";

        } catch (Exception e) {
            System.err.println("Error al cargar el recibo del pedido " + pedidoId + " para " + username + ": " + e.getMessage());
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "No se pudo encontrar el recibo o usted no tiene permiso para verlo.");
            return "redirect:/";
        }
    }
}