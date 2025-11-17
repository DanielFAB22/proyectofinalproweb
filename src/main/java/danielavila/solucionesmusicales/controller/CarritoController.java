package danielavila.solucionesmusicales.controller;

import danielavila.solucionesmusicales.model.Carrito;
import danielavila.solucionesmusicales.service.CarritoService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
public class CarritoController {

    private final CarritoService carritoService;



    @PostMapping("/Agregarcarrito")
    public String agregarAlCarrito(@RequestParam("productos_id") Integer productoId,
                                   Authentication authentication,
                                   RedirectAttributes redirectAttributes) {

        if (authentication == null || !authentication.isAuthenticated()) {

            return "redirect:/login";
        }

        String username = authentication.getName();

        try {

            boolean isAdmin = authentication.getAuthorities().stream()
                    .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));

            if (isAdmin) {

                throw new RuntimeException("Funcionalidad deshabilitada. Los administradores no pueden utilizar el carrito de compras.");
            }


            carritoService.agregarProducto(username, productoId);
            redirectAttributes.addFlashAttribute("mensaje", " Producto añadido al carrito con éxito!");
        } catch (RuntimeException e) {

            redirectAttributes.addFlashAttribute("error", " Error al añadir el producto: " + e.getMessage());
        }


        return "redirect:/carrito";
    }

    @GetMapping("/carrito")
    public String verCarrito(Model model, Authentication authentication) {
        if (authentication == null || !authentication.isAuthenticated()) {
            return "redirect:/login";
        }

        String username = authentication.getName();

        Carrito carrito = carritoService.obtenerCarritoDeUsuario(username);


        model.addAttribute("carrito", carrito);
        model.addAttribute("usuarioNombre", username);


        return "views/public/carrito";
    }



    @PostMapping("/carrito/quitar")
    public String quitarItemCarrito(@RequestParam("itemId") Long itemId,
                                    Authentication authentication,
                                    RedirectAttributes redirectAttributes) {

        if (authentication == null || !authentication.isAuthenticated()) {
            return "redirect:/login";
        }

        String username = authentication.getName();

        try {
            carritoService.quitarItem(username, itemId);
            redirectAttributes.addFlashAttribute("mensaje", "Producto eliminado del carrito.");
        } catch (RuntimeException e) {
            redirectAttributes.addFlashAttribute("error", "Error al eliminar el producto: " + e.getMessage());
        }

        return "redirect:/carrito";
    }
}