package danielavila.solucionesmusicales.service;

import danielavila.solucionesmusicales.model.*;
import danielavila.solucionesmusicales.repository.PedidoRepository;
import danielavila.solucionesmusicales.repository.ProductoRepository;
import danielavila.solucionesmusicales.repository.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class PedidoServiceImpl implements PedidoService {

    private final PedidoRepository pedidoRepository;
    private final ProductoRepository productoRepository;
    private final UsuarioRepository usuarioRepository;

    @Override
    @Transactional
    public Long procesarCompra(Carrito carrito) {
        if (carrito == null || carrito.getItems().isEmpty()) {
            throw new RuntimeException("El carrito está vacío.");
        }


        List<ItemPedido> itemsPedido = new ArrayList<>();
        Integer total = 0;

        for (ItemCarrito itemCarrito : carrito.getItems()) {
            Producto producto = itemCarrito.getProducto();
            Integer cantidad = itemCarrito.getCantidad();


            if (producto.getStock() < cantidad) {
                throw new RuntimeException("Stock insuficiente para el producto: " + producto.getNombre());
            }
            producto.setStock(producto.getStock() - cantidad);
            productoRepository.save(producto);


            Integer precioUnitario = producto.getPrecio();

            ItemPedido itemPedido = ItemPedido.builder()
                    .producto(producto)
                    .cantidad(cantidad)
                    .precioFijado(precioUnitario)
                    .build();


            total += itemPedido.getPrecioFijado() * cantidad;
            itemsPedido.add(itemPedido);
        }


        Pedido pedido = Pedido.builder()
                .usuario(carrito.getUsuario())
                .fechaCreacion(LocalDateTime.now())
                .total(total)
                .items(itemsPedido)
                .build();



        for (ItemPedido item : itemsPedido) {
            item.setPedido(pedido);
        }


        pedido = pedidoRepository.save(pedido);



        return pedido.getId();
    }


    @Override
    @Transactional(readOnly = true)
    public Pedido obtenerPedidoParaRecibo(Long pedidoId, String username) {


        Pedido pedido = pedidoRepository.findByIdAndUsuarioUsername(pedidoId, username)
                .orElseThrow(() -> new RuntimeException("Pedido no encontrado o acceso denegado."));


        return pedido;
    }
}