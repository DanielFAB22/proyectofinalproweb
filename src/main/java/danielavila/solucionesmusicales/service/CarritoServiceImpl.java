package danielavila.solucionesmusicales.service;

import danielavila.solucionesmusicales.model.Carrito;
import danielavila.solucionesmusicales.model.ItemCarrito;
import danielavila.solucionesmusicales.model.Producto;
import danielavila.solucionesmusicales.model.Usuario;
import danielavila.solucionesmusicales.repository.CarritoRepository;
import danielavila.solucionesmusicales.repository.ItemCarritoRepository;
import danielavila.solucionesmusicales.repository.ProductoRepository;
import danielavila.solucionesmusicales.repository.UsuarioRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;


@Service
@RequiredArgsConstructor
public class CarritoServiceImpl implements CarritoService {

    private final CarritoRepository carritoRepository;
    private final UsuarioRepository usuarioRepository;
    private final ProductoRepository productoRepository;
    private final ItemCarritoRepository itemCarritoRepository;


    @Override
    @Transactional
    public Carrito obtenerCarritoDeUsuario(String username) {
        Usuario usuario = usuarioRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));


        return carritoRepository.findByUsuario(usuario)
                .orElseGet(() -> {
                    Carrito nuevoCarrito = Carrito.builder().usuario(usuario).build();
                    return carritoRepository.save(nuevoCarrito);
                });
    }


    @Override
    @Transactional
    public void agregarProducto(String username, Integer productoId) {
        Carrito carrito = obtenerCarritoDeUsuario(username);


        Long productoIdLong = productoId.longValue();

        Producto producto = productoRepository.findById(productoIdLong)
                .orElseThrow(() -> new RuntimeException("Producto no encontrado."));


        Optional<ItemCarrito> existingItemOpt = carrito.getItems().stream()
                .filter(item -> item.getProducto().getId().equals(productoIdLong))
                .findFirst();

        int cantidadActual = existingItemOpt.map(ItemCarrito::getCantidad).orElse(0);
        int nuevaCantidad = cantidadActual + 1;


        if (producto.getStock() < nuevaCantidad) {
            throw new RuntimeException("No hay suficiente stock. Stock disponible para " + producto.getNombre() + ": " + producto.getStock());
        }

        if (existingItemOpt.isPresent()) {

            ItemCarrito item = existingItemOpt.get();
            item.setCantidad(nuevaCantidad);
            itemCarritoRepository.save(item);
        } else {

            ItemCarrito newItem = ItemCarrito.builder()
                    .producto(producto)
                    .carrito(carrito)
                    .cantidad(1)
                    .build();
            carrito.getItems().add(newItem);
            itemCarritoRepository.save(newItem);
        }

        carritoRepository.save(carrito);
    }


    @Override
    @Transactional
    public void quitarItem(String username, Long itemId) {
        Carrito carrito = obtenerCarritoDeUsuario(username);

        ItemCarrito itemToRemove = itemCarritoRepository.findById(itemId)
                .orElseThrow(() -> new RuntimeException("Ítem de carrito no encontrado."));

        if (!itemToRemove.getCarrito().getId().equals(carrito.getId())) {
            throw new RuntimeException("Acceso denegado al ítem del carrito.");
        }


        carrito.getItems().remove(itemToRemove);


        itemCarritoRepository.delete(itemToRemove);
    }

    @Override
    @Transactional
    public void reducirCantidad(String username, Long itemId) {
        Carrito carrito = obtenerCarritoDeUsuario(username);

        ItemCarrito itemToReduce = itemCarritoRepository.findById(itemId)
                .orElseThrow(() -> new RuntimeException("Ítem de carrito no encontrado."));


        if (!itemToReduce.getCarrito().getId().equals(carrito.getId())) {
            throw new RuntimeException("Acceso denegado al ítem del carrito.");
        }

        int cantidadActual = itemToReduce.getCantidad();

        if (cantidadActual > 1) {

            itemToReduce.setCantidad(cantidadActual - 1);
            itemCarritoRepository.save(itemToReduce);
        } else if (cantidadActual == 1) {

            carrito.getItems().remove(itemToReduce);
            itemCarritoRepository.delete(itemToReduce);
        }


        carritoRepository.save(carrito);
    }


    @Override
    @Transactional
    public void vaciarCarrito(String username) {
        Carrito carrito = obtenerCarritoDeUsuario(username);


        if (!carrito.getItems().isEmpty()) {
            itemCarritoRepository.deleteAll(carrito.getItems());
        }


        carrito.getItems().clear();
        carritoRepository.save(carrito);
    }
}