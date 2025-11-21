package danielavila.solucionesmusicales.service;

import danielavila.solucionesmusicales.model.Carrito;
import danielavila.solucionesmusicales.model.Pedido;

public interface PedidoService {


    Long procesarCompra(Carrito carrito);


    Pedido obtenerPedidoParaRecibo(Long pedidoId, String username);
}