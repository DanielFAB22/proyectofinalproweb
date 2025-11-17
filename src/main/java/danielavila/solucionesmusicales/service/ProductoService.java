package danielavila.solucionesmusicales.service;

import danielavila.solucionesmusicales.model.Producto;
import danielavila.solucionesmusicales.repository.ProductoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ProductoService {

    private final ProductoRepository productoRepository;


    private final String UPLOAD_BASE_DIR = "src/main/webapp/assets/img/catalogos/";


    @Transactional(readOnly = true)
    public List<Producto> listarTodosProductosConStock() {
        return productoRepository.findAll();
    }

    @Transactional(readOnly = true)
    public List<Producto> findDestacados() {
        return productoRepository.findByDestacadoTrue();
    }

    @Transactional(readOnly = true)
    public Optional<Producto> buscarPorId(Long id) {
        return productoRepository.findById(id);
    }

    @Transactional(readOnly = true)
    public Producto encontrarPorId(Long id) {
        return productoRepository.findById(id).orElse(null);
    }



    @Transactional
    public Producto guardar(Producto producto) {
        return productoRepository.save(producto);
    }


    public String guardarImagenYObtenerUrl(Producto producto, MultipartFile file) throws IOException {


        String tipoInput = producto.getTipoProducto().toLowerCase();
        String marcaDir = producto.getMarca().toLowerCase();


        String tipoDir;
        if (tipoInput.contains("guitarra")) {
            tipoDir = "guitarras";
        } else if (tipoInput.contains("bajo")) {
            tipoDir = "bajos";
        } else {
            tipoDir = tipoInput;
        }


        Path fullUploadDir = Paths.get(UPLOAD_BASE_DIR, tipoDir, marcaDir);


        if (!Files.exists(fullUploadDir)) {
            Files.createDirectories(fullUploadDir);
        }


        String originalFilename = file.getOriginalFilename();
        String extension = "";
        if (originalFilename != null && originalFilename.lastIndexOf('.') > 0) {
            extension = originalFilename.substring(originalFilename.lastIndexOf('.'));
        }

        String newFilename = UUID.randomUUID().toString() + extension;


        Path filePath = fullUploadDir.resolve(newFilename);


        Files.copy(file.getInputStream(), filePath);


        String relativeUrl = tipoDir + File.separator + marcaDir + File.separator + newFilename;


        return relativeUrl.replace(File.separator, "/");
    }


    @Transactional
    public Producto actualizarStock(Long productoId, int cantidad) {
        Producto producto = productoRepository.findById(productoId)
                .orElseThrow(() -> new IllegalArgumentException("Producto no encontrado con ID: " + productoId));

        int nuevoStock = producto.getStock() + cantidad;
        if (nuevoStock < 0) {
            throw new IllegalArgumentException("La operación resulta en un stock negativo para el producto: " + producto.getNombre());
        }

        producto.setStock(nuevoStock);
        return productoRepository.save(producto);
    }

    @Transactional
    public void eliminarPorId(Long id) {
        productoRepository.deleteById(id);
    }
}