package danielavila.solucionesmusicales.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class DestacadosController {



    
    @GetMapping("/guitarras/{nombreProducto}")
    public String detalleGuitarraDestacada(@PathVariable String nombreProducto) {

        return "views/public/guitarras/" + nombreProducto;
    }



    
    @GetMapping("/bajos/{nombreProducto}")
    public String detalleBajoDestacado(@PathVariable String nombreProducto) {

        return "views/public/bajos/" + nombreProducto;
    }
}