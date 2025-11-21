package danielavila.solucionesmusicales.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ErrorController {

    @GetMapping("/acceso-denegado")
    public ModelAndView handleAccessDenied() {

        return new ModelAndView("views/public/error");
    }
}