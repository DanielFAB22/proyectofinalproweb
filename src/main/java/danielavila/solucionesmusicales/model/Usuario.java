package danielavila.solucionesmusicales.model;

import jakarta.persistence.*;
import lombok.*;
import java.util.Set;
import java.util.List;
import java.util.ArrayList;
import java.util.HashSet;

@Entity
@Table(name = "usuarios")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode(exclude = {"carritos", "roles"})
@ToString(exclude = {"carritos", "roles"})
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String username;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String email;

    private boolean activo = true;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "usuario_roles",
            joinColumns = @JoinColumn(name = "usuario_id"),
            inverseJoinColumns = @JoinColumn(name = "rol_id")
    )
    private Set<Rol> roles = new HashSet<>();

    @OneToMany(
            mappedBy = "usuario",
            cascade = CascadeType.REMOVE,
            orphanRemoval = true,
            fetch = FetchType.LAZY
    )
    private List<Carrito> carritos = new ArrayList<>();

    public String getRol() {
        if (this.roles != null && !this.roles.isEmpty()) {
            Rol firstRol = this.roles.iterator().next();
            try {
                return firstRol.getNombre();
            } catch (Exception e) {
                return firstRol.toString();
            }
        }
        return "SIN_ROL";
    }
}
