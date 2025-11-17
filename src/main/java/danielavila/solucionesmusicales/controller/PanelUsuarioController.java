package danielavila.solucionesmusicales.controller;

import danielavila.solucionesmusicales.model.Producto;
import danielavila.solucionesmusicales.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;

@Controller
public class PanelUsuarioController {


    @Autowired
    private ProductoService productoService;


    @GetMapping("/panelusuario/publicar-usado")
    public String mostrarFormularioPublicacion() {
        return "views/public/panelusuario/publicar-usado";
    }


    @PostMapping("/articulos/publicar-usado")
    public String crearProducto(
            @ModelAttribute Producto producto,
            @RequestParam("imagen") MultipartFile imagen,
            RedirectAttributes ra) {


        if (imagen.isEmpty()) {
            ra.addFlashAttribute("error", "Debe seleccionar una imagen para el producto.");

            return "redirect:/panelusuario/publicar-usado";
        }

        try {

            String imagenUrlRelativa = productoService.guardarImagenYObtenerUrl(producto, imagen);


            producto.setImagenUrl(imagenUrlRelativa);


            if (producto.getDestacado() == null) {
                producto.setDestacado(false);
            }



            productoService.guardar(producto);


            ra.addFlashAttribute("success", "¡Artículo '" + producto.getNombre() + "' publicado con éxito!");

        } catch (IOException e) {

            ra.addFlashAttribute("error", "Error interno: Falló al guardar la imagen física.");
            System.err.println("Error de IO al guardar imagen: " + e.getMessage());
            return "redirect:/panelusuario/publicar-usado";
        } catch (Exception e) {

            ra.addFlashAttribute("error", "Error de publicación: " + e.getMessage());
            System.err.println("Error general al publicar artículo: " + e.getMessage());
            return "redirect:/panelusuario/publicar-usado";
        }


        return "redirect:/inicio";
    }
}