package danielavila.solucionesmusicales.controller;

import danielavila.solucionesmusicales.model.Producto;
import danielavila.solucionesmusicales.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/catalogos")
public class CatalogoController {

    @Autowired
    private ProductoService productoService;

    private List<Producto> filtrarPorMarcaYTipoProducto(String marca, String tipoProducto) {
        return productoService.listarTodosProductosConStock().stream()
                .filter(p -> marca.equals(p.getMarca()))
                .filter(p -> tipoProducto.equals(p.getTipoProducto()))
                .toList();
    }

    // ------------------ GUITARRAS -----------------------

    @GetMapping("/guitarras")
    public String guitarras() {
        return "views/public/catalogos/guitarras/index";
    }

    @GetMapping("/guitarras/fender")
    public String guitarrasFender(Model model) {
        model.addAttribute("productos",
                filtrarPorMarcaYTipoProducto("Fender", "Guitarra"));
        return "views/public/catalogos/guitarras/fender";
    }

    @GetMapping("/guitarras/gibson")
    public String guitarrasGibson(Model model) {
        model.addAttribute("productos",
                filtrarPorMarcaYTipoProducto("Gibson", "Guitarra"));
        return "views/public/catalogos/guitarras/gibson";
    }

    @GetMapping("/guitarras/schecter")
    public String guitarrasSchecter(Model model) {
        model.addAttribute("productos",
                filtrarPorMarcaYTipoProducto("Schecter", "Guitarra"));
        return "views/public/catalogos/guitarras/schecter";
    }

    // ------------------ BAJOS ---------------------------

    @GetMapping("/bajos")
    public String bajos() {
        return "views/public/catalogos/bajos/index";
    }

    @GetMapping("/bajos/fender")
    public String bajosFender(Model model) {
        model.addAttribute("productos",
                filtrarPorMarcaYTipoProducto("Fender", "Bajo"));
        return "views/public/catalogos/bajos/fender";
    }

    @GetMapping("/bajos/ibanez")
    public String bajosIbanez(Model model) {
        model.addAttribute("productos",
                filtrarPorMarcaYTipoProducto("Ibanez", "Bajo"));
        return "views/public/catalogos/bajos/ibanez";
    }

    @GetMapping("/bajos/schecter")
    public String bajosSchecter(Model model) {
        model.addAttribute("productos",
                filtrarPorMarcaYTipoProducto("Schecter", "Bajo"));
        return "views/public/catalogos/bajos/schecter";
    }
}
