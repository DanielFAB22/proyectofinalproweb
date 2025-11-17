package danielavila.solucionesmusicales.repository;

import danielavila.solucionesmusicales.model.Carrito;
import danielavila.solucionesmusicales.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CarritoRepository extends JpaRepository<Carrito, Long> {

    Optional<Carrito> findByUsuario(Usuario usuario);
}