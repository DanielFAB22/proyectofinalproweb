package danielavila.solucionesmusicales.service;

import danielavila.solucionesmusicales.model.Carrito;


public interface CarritoService {


    Carrito obtenerCarritoDeUsuario(String username);


    void agregarProducto(String username, Integer productoId);


    void quitarItem(String username, Long itemId);


    void reducirCantidad(String username, Long itemId);


    void vaciarCarrito(String username);
}