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



    @GetMapping("/guitarras")
    public String guitarras() {
        return "views/public/catalogos/guitarras/index";
    }

    @GetMapping("/guitarras/fender")
    public String guitarrasFender(Model model) {

        List<Producto> productosFender = filtrarPorMarcaYTipoProducto("Fender", "Guitarra");
        model.addAttribute("productos", productosFender);
        return "views/public/catalogos/guitarras/fender";
    }

    @GetMapping("/guitarras/gibson")
    public String guitarrasGibson(Model model) {

        List<Producto> productosGibson = filtrarPorMarcaYTipoProducto("Gibson", "Guitarra");
        model.addAttribute("productos", productosGibson);
        return "views/public/catalogos/guitarras/gibson";
    }

    @GetMapping("/guitarras/schecter")
    public String guitarrasSchecter(Model model) {

        List<Producto> productosSchecter = filtrarPorMarcaYTipoProducto("Schecter", "Guitarra");
        model.addAttribute("productos", productosSchecter);
        return "views/public/catalogos/guitarras/schecter";
    }


    @GetMapping("/bajos")
    public String bajos() {
        return "views/public/catalogos/bajos/index";
    }

    @GetMapping("/bajos/fender")
    public String bajosFender(Model model) {

        List<Producto> bajosFender = filtrarPorMarcaYTipoProducto("Fender", "Bajo");
        model.addAttribute("productos", bajosFender);
        return "views/public/catalogos/bajos/fender";
    }

    @GetMapping("/bajos/ibanez")
    public String bajosIbanez(Model model) {

        List<Producto> bajosIbanez = filtrarPorMarcaYTipoProducto("Ibanez", "Bajo");
        model.addAttribute("productos", bajosIbanez);
        return "views/public/catalogos/bajos/ibanez";
    }

    @GetMapping("/bajos/schecter")
    public String bajosSchecter(Model model) {

        List<Producto> bajosSchecter = filtrarPorMarcaYTipoProducto("Schecter", "Bajo");
        model.addAttribute("productos", bajosSchecter);
        return "views/public/catalogos/bajos/schecter";
    }
}