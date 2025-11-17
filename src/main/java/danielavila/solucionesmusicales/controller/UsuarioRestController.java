package danielavila.solucionesmusicales.controller;

import danielavila.solucionesmusicales.dto.RegistrationRequestDTO;
import danielavila.solucionesmusicales.model.Usuario;
import danielavila.solucionesmusicales.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class UsuarioRestController {

    @Autowired
    private UsuarioService usuarioService;

    
    @PostMapping("/registro")
    public ResponseEntity<?> registrarUsuario(@RequestBody RegistrationRequestDTO request) {


        if (request.getUsername() == null || request.getEmail() == null || request.getPassword() == null) {
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("message", "Faltan campos obligatorios (username, email, password).");
            return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
        }

        try {

            Usuario nuevoUsuario = usuarioService.registrarNuevoUsuario(request);


            Map<String, String> successResponse = new HashMap<>();
            successResponse.put("message", "Registro exitoso");
            successResponse.put("username", nuevoUsuario.getUsername());

            return new ResponseEntity<>(successResponse, HttpStatus.CREATED);

        } catch (IllegalArgumentException e) {

            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("message", e.getMessage());


            return new ResponseEntity<>(errorResponse, HttpStatus.CONFLICT);

        } catch (IllegalStateException e) {

            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("message", "Error de configuración: " + e.getMessage());
            return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);

        } catch (Exception e) {

            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("message", "Error interno del servidor al registrar usuario.");
            System.err.println("Error al registrar: " + e.getMessage()); // Loguear la excepción
            return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}