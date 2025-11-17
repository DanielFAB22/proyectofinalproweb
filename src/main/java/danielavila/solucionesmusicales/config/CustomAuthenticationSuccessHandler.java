package danielavila.solucionesmusicales.config;

import danielavila.solucionesmusicales.model.Usuario;
import danielavila.solucionesmusicales.service.UsuarioService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationSuccessHandler.class);


    private final UsuarioService usuarioService;


    public CustomAuthenticationSuccessHandler(@Lazy UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication)
            throws IOException, ServletException {

        String redirectUrl = "/inicio";
        String username = authentication.getName();

        logger.info("--- AUTENTICACIÓN EXITOSA Y CARGA DE SESIÓN ---");
        logger.info("Usuario autenticado (Spring Security): " + username);

        try {

            Usuario usuarioLogueado = usuarioService.encontrarPorUsername(username);

            if (usuarioLogueado != null) {


                HttpSession session = request.getSession(true);
                session.setAttribute("usuario", usuarioLogueado);
                logger.info("Objeto Usuario cargado en sesión.");



                boolean isAdmin = usuarioLogueado.getRoles().stream()
                        .anyMatch(r -> "ROLE_ADMIN".equals(r.getNombre()));

                if (isAdmin) {
                    redirectUrl = "/paneladmin";
                    logger.info("ROL ADMIN DETECTADO. Redirigiendo a: " + redirectUrl);
                } else {
                    logger.info("ROL DE USUARIO ESTÁNDAR. Redirigiendo por defecto a: " + redirectUrl);
                }

            } else {
                logger.error("ERROR CRÍTICO: No se pudo cargar el objeto Usuario desde el UserService para: " + username);
            }
        } catch (Exception e) {
            logger.error("Error al cargar el objeto Usuario en la sesión: ", e);
        }

        logger.info("Redireccionamiento final a: " + redirectUrl);
        logger.info("---------------------------------------------");


        response.sendRedirect(request.getContextPath() + redirectUrl);
    }
}