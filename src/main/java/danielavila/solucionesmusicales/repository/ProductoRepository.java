package danielavila.solucionesmusicales.repository;

import danielavila.solucionesmusicales.model.Producto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ProductoRepository extends JpaRepository<Producto, Long> {


    List<Producto> findByDestacadoTrue();


}