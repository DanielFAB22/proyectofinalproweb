package danielavila.solucionesmusicales.repository;

import danielavila.solucionesmusicales.model.Carrito;
import danielavila.solucionesmusicales.model.ItemCarrito;
import danielavila.solucionesmusicales.model.Producto;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ItemCarritoRepository extends JpaRepository<ItemCarrito, Long> {

    Optional<ItemCarrito> findByCarritoAndProducto(Carrito carrito, Producto producto);
}