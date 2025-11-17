package danielavila.solucionesmusicales.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "productos")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Producto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "productos_id")
    private Long id;

    private String nombre;




    @Lob
    private String descripcion;

    private Integer precio;

    private Integer stock;

    @Column(name = "imagen_url")
    private String imagenUrl;


    @Column(name = "tipo_producto")
    private String tipoProducto;


    private String marca;


    @Column(name = "destacado")
    private Boolean destacado;
}