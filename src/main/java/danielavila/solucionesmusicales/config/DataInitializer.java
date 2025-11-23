package danielavila.solucionesmusicales.config;

import danielavila.solucionesmusicales.model.Producto;
import danielavila.solucionesmusicales.model.Rol;
import danielavila.solucionesmusicales.model.Usuario;
import danielavila.solucionesmusicales.repository.ProductoRepository;
import danielavila.solucionesmusicales.repository.RolRepository;
import danielavila.solucionesmusicales.repository.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Arrays;
import java.util.List;
import java.util.Set;

@Configuration
@RequiredArgsConstructor
public class DataInitializer {

    private final PasswordEncoder passwordEncoder;

    @Bean
    CommandLineRunner initData(RolRepository rolRepo, UsuarioRepository userRepo, ProductoRepository productoRepo) {
        return args -> {

            // ------- ROLES -------
            Rol rolUser = rolRepo.findByNombre("ROLE_USER").orElse(null);
            Rol rolAdmin = rolRepo.findByNombre("ROLE_ADMIN").orElse(null);

            if (rolUser == null) {
                rolUser = rolRepo.save(new Rol(null, "ROLE_USER"));
                System.out.println(" Rol 'ROLE_USER' creado.");
            }
            if (rolAdmin == null) {
                rolAdmin = rolRepo.save(new Rol(null, "ROLE_ADMIN"));
                System.out.println(" Rol 'ROLE_ADMIN' creado.");
            }

            // ------- USUARIO ADMIN -------
            if (userRepo.findByUsername("admin").isEmpty()) {
                Usuario admin = Usuario.builder()
                        .username("admin")
                        .email("admin@soluciones.com")
                        .password(passwordEncoder.encode("1234"))
                        .roles(Set.of(rolAdmin))
                        .activo(true)
                        .build();

                userRepo.save(admin);
                System.out.println(" Usuario 'admin' creado.");
            }

            // ------- USUARIO NORMAL -------
            if (userRepo.findByUsername("user").isEmpty()) {
                Usuario user = Usuario.builder()
                        .username("user")
                        .email("user@soluciones.com")
                        .password(passwordEncoder.encode("1234"))
                        .roles(Set.of(rolUser))
                        .activo(true)
                        .build();

                userRepo.save(user);
                System.out.println(" Usuario 'user' creado.");
            }

            // ------- PRODUCTOS -------
            if (productoRepo.count() == 0) {

                List<Producto> productos = Arrays.asList(

                        Producto.builder()
                                .nombre("GUITARRA SCHECTER OMEN 6")
                                .descripcion("Modelo ideal para principiantes y rockeros, con un sonido potente y pastillas humbucker.")
                                .precio(1790000).stock(5)
                                .imagenUrl("guitarras/schecter/omen6.png")
                                .tipoProducto("Guitarra").marca("Schecter")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("LES PAUL P90")
                                .descripcion("Tono vintage y con cuerpo. Equipada con pastillas P90 que ofrecen un sonido brillante y con mordida.")
                                .precio(10682500).stock(2)
                                .imagenUrl("guitarras/gibson/lespaulp90.png")
                                .tipoProducto("Guitarra").marca("Gibson")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("SQUIER CLASSIC VIBE 50S TELECASTER")
                                .descripcion("Estilo clásico de los 50. Tono Telecaster auténtico a un precio accesible, ideal para el blues y country.")
                                .precio(2100000).stock(7)
                                .imagenUrl("guitarras/fender/classicvibe50stelecaster.png")
                                .tipoProducto("Guitarra").marca("Fender")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("FENDER SQUIER SONIC MUSTANG")
                                .descripcion("Guitarra compacta y moderna. Perfecta para manos pequeñas y géneros alternativos con un toque único.")
                                .precio(1242000).stock(9)
                                .imagenUrl("guitarras/fender/squiersonicmustang.png")
                                .tipoProducto("Guitarra").marca("Fender")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("FENDER AMERICAN STANDARD")
                                .descripcion("El estándar de la Stratocaster, hecha en EE. UU. Tono versátil, mástil cómodo y calidad profesional.")
                                .precio(5678000).stock(4)
                                .imagenUrl("guitarras/fender/fenderstandard.png")
                                .tipoProducto("Guitarra").marca("Fender")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("GIBSON LES PAUL CUSTOM F HOLES")
                                .descripcion("Les Paul con cuerpo semi-hueco para un tono resonante, ideal para jazz y blues fusion.")
                                .precio(34432000).stock(2)
                                .imagenUrl("guitarras/gibson/gibsoncustomfholes.png")
                                .tipoProducto("Guitarra").marca("Gibson")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("GIBSON LES PAUL STANDARD PLAIN TOP")
                                .descripcion("La Les Paul más icónica. Tono rock clásico, sustain infinito y un acabado atemporal.")
                                .precio(10242000).stock(6)
                                .imagenUrl("guitarras/gibson/gibsonstandardplain.png")
                                .tipoProducto("Guitarra").marca("Gibson")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("GIBSON LES PAUL JR TV YELLOW")
                                .descripcion("Diseño minimalista y sonido crudo. Una pastilla P90 para rock puro y garage.")
                                .precio(6500000).stock(10)
                                .imagenUrl("guitarras/gibson/lespauljrtvyellow.png")
                                .tipoProducto("Guitarra").marca("Gibson")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("AVENGER STANDARD")
                                .descripcion("Diseño agresivo y mástil rápido. Perfecta para shredding y metal moderno.")
                                .precio(1600000).stock(10)
                                .imagenUrl("guitarras/schecter/avengerstandard.png")
                                .tipoProducto("Guitarra").marca("Schecter")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("DAMIEN 6")
                                .descripcion("Ideal para heavy metal. Pastillas activas de alta ganancia y cuerpo de caoba para un sonido denso.")
                                .precio(2300000).stock(4)
                                .imagenUrl("guitarras/schecter/damien6.png")
                                .tipoProducto("Guitarra").marca("Schecter")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("E-1 CUSTOM")
                                .descripcion("Estilo Explorer revisado. Instrumento de alta gama con componentes de primer nivel y gran sustain.")
                                .precio(4190000).stock(1)
                                .imagenUrl("guitarras/schecter/e-1custom.png")
                                .tipoProducto("Guitarra").marca("Schecter")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("FENDER PRECISION BASS")
                                .descripcion("El bajo que lo empezó todo. Tono grueso, potente y fundamental para el rock y el soul.")
                                .precio(3790000).stock(6)
                                .imagenUrl("bajos/fender/fenderprecisionbass.png")
                                .tipoProducto("Bajo").marca("Fender")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("FENDER PLAYER II JAZZ BASS")
                                .descripcion("Versatilidad y elegancia. El icónico Jazz Bass, ahora con un tono mejorado para músicos de hoy.")
                                .precio(4400000).stock(4)
                                .imagenUrl("bajos/fender/playerii.png")
                                .tipoProducto("Bajo").marca("Fender")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("FENDER STANDARD JAZZ BASS")
                                .descripcion("Clásico y confiable, con el famoso perfil de mástil delgado que facilita la ejecución rápida.")
                                .precio(3342000).stock(6)
                                .imagenUrl("bajos/fender/standardjazzbass.png")
                                .tipoProducto("Bajo").marca("Fender")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("FENDER AMERICAN ULTRA PRECISION BASS")
                                .descripcion("Lo mejor de Fender. Bajo premium con electrónica avanzada y mástil ergonómico de alto rendimiento.")
                                .precio(9900000).stock(1)
                                .imagenUrl("bajos/fender/americanultraprecisionbass.png")
                                .tipoProducto("Bajo").marca("Fender")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("IBANEZ GSR-180")
                                .descripcion("Bajo de iniciación ligero y cómodo, ideal para aprender con un sonido claro y definido.")
                                .precio(1100000).stock(3)
                                .imagenUrl("bajos/ibanez/ibanezgsr180.png")
                                .tipoProducto("Bajo").marca("Ibanez")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("IBANEZ BTB-606")
                                .descripcion("Bajo de 6 cuerdas para el bajista moderno. Rango extendido y tono articulado, perfecto para el metal progresivo.")
                                .precio(3740000).stock(3)
                                .imagenUrl("bajos/ibanez/ibanezbtb606.png")
                                .tipoProducto("Bajo").marca("Ibanez")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("IBANEZ SRAS7-CBS ASHULA")
                                .descripcion("Un bajo experimental de 7 cuerdas sin trastes en parte del diapasón. Tono híbrido único.")
                                .precio(4690000).stock(3)
                                .imagenUrl("bajos/ibanez/ibanezsras7cbsashula.png")
                                .tipoProducto("Bajo").marca("Ibanez")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("STILETTO EXTREME-4")
                                .descripcion("Diseño aerodinámico y gran potencia. Bajo de 4 cuerdas con un sustain excepcional para el rock duro.")
                                .precio(2400000).stock(6)
                                .imagenUrl("bajos/schecter/stilettoextreme-4.png")
                                .tipoProducto("Bajo").marca("Schecter")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("CV-5")
                                .descripcion("Bajo de 5 cuerdas con estilo vintage. Sonido gordo y pastillas versátiles, apto para cualquier género.")
                                .precio(3240000).stock(2)
                                .imagenUrl("bajos/schecter/cv5.png")
                                .tipoProducto("Bajo").marca("Schecter")
                                .destacado(false).build(),

                        Producto.builder()
                                .nombre("CORSAIR BASS")
                                .descripcion("Diseño clásico tipo semi-hueco. Sonido cálido, resonante y profundo, ideal para el reggae o el blues.")
                                .precio(4690000).stock(2)
                                .imagenUrl("bajos/schecter/corsairbass.png")
                                .tipoProducto("Bajo").marca("Schecter")
                                .destacado(true)
                                .build()
                );

                productoRepo.saveAll(productos);
                System.out.println(" Productos iniciales cargados: " + productos.size());
            }
        };
    }
}
