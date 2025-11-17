package danielavila.solucionesmusicales.controller;

import danielavila.solucionesmusicales.model.Producto;
import danielavila.solucionesmusicales.service.ProductoService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeController {


    private final ProductoService productoService;

    
    @GetMapping({"/", "/index"})
    public String home(Model model) {

        List<Producto> destacados = productoService.findDestacados();


        model.addAttribute("productosDestacados", destacados);

        return "views/public/index";
    }

    
    @GetMapping("/login")
    public String login() {
        return "views/public/login";
    }

    
    @GetMapping("/registro")
    public String registro() {
        return "views/public/registro";
    }

    
    @GetMapping("/somos")
    public String quienesSomos() {

        return "views/public/somos";
    }

    
    @GetMapping("/inicio")
    public String inicio() {
        return "views/public/inicio";
    }
}