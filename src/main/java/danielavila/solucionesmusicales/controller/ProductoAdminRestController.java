package danielavila.solucionesmusicales.controller;

import danielavila.solucionesmusicales.model.Producto;
import danielavila.solucionesmusicales.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/admin/productos")
@PreAuthorize("hasRole('ADMIN')")
public class ProductoAdminRestController {

    @Autowired
    private ProductoService productoService;


    @PutMapping("/{id}")
    public ResponseEntity<?> editarProducto(@PathVariable Long id, @RequestBody Producto productoActualizado) {

        if (!id.equals(productoActualizado.getId())) {
            return new ResponseEntity<>("El ID del producto en la URL no coincide con el ID del cuerpo.", HttpStatus.BAD_REQUEST);
        }

        try {

            Producto producto = productoService.guardar(productoActualizado);
            return new ResponseEntity<>(producto, HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("message", e.getMessage());
            return new ResponseEntity<>(errorResponse, HttpStatus.NOT_FOUND);
        } catch (Exception e) {
            return new ResponseEntity<>("Error interno al actualizar el producto.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    @PostMapping("/{id}/stock")
    public ResponseEntity<?> modificarStock(@PathVariable Long id, @RequestParam int cantidad) {
        try {

            Producto producto = productoService.actualizarStock(id, cantidad);

            Map<String, Object> successResponse = new HashMap<>();
            successResponse.put("message", "Stock de " + producto.getNombre() + " actualizado con éxito.");
            successResponse.put("nuevoStock", producto.getStock());
            successResponse.put("productoId", producto.getId());

            return new ResponseEntity<>(successResponse, HttpStatus.OK);
        } catch (IllegalArgumentException e) {
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("message", e.getMessage());
            return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            return new ResponseEntity<>("Error interno al modificar el stock.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}