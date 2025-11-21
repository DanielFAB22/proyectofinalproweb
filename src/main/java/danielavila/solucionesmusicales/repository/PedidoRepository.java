package danielavila.solucionesmusicales.repository;

import danielavila.solucionesmusicales.model.Pedido;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PedidoRepository extends JpaRepository<Pedido, Long> {


    @Query("SELECT p FROM Pedido p JOIN FETCH p.items i JOIN FETCH i.producto WHERE p.id = :id AND p.usuario.username = :username")
    Optional<Pedido> findByIdAndUsuarioUsername(@Param("id") Long id, @Param("username") String username);
}