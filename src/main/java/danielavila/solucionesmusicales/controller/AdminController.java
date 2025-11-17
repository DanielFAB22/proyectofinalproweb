package danielavila.solucionesmusicales.controller;

import danielavila.solucionesmusicales.model.Producto;
import danielavila.solucionesmusicales.model.Usuario;
import danielavila.solucionesmusicales.service.ProductoService;
import danielavila.solucionesmusicales.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.List;


@Controller
@RequestMapping("/paneladmin")
@PreAuthorize("hasRole('ADMIN')")
public class AdminController {

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private ProductoService productoService;


    @GetMapping
    public String adminPanel(Model model) {

        try {
            List<Producto> productos = productoService.listarTodosProductosConStock();
            model.addAttribute("productos", productos);
            return "views/admin/paneladmin";
        } catch (Exception e) {
            model.addAttribute("error", "Error al cargar los datos del dashboard: " + e.getMessage());
            return "views/admin/paneladmin";
        }
    }


    @GetMapping("/usuarios")
    public String listarUsuarios(Model model) {
        try {
            List<Usuario> usuarios = usuarioService.listarTodosUsuarios();
            model.addAttribute("usuarios", usuarios);
            return "views/admin/usuarios";
        } catch (Exception e) {
            model.addAttribute("error", "Error al cargar la lista de usuarios: " + e.getMessage());
            return "views/admin/usuarios";
        }
    }


    @GetMapping("/usuarios/editar/{id}")
    public String mostrarFormularioEdicion(@PathVariable("id") Long id, Model model, RedirectAttributes ra) {
        try {
            Usuario usuarioAEditar = usuarioService.encontrarPorId(id);
            if (usuarioAEditar != null) {
                model.addAttribute("usuario", usuarioAEditar);
                return "views/admin/editar-usuario";
            } else {
                ra.addFlashAttribute("error", "Usuario no encontrado con ID: " + id);
                return "redirect:/paneladmin/usuarios";
            }
        } catch (Exception e) {
            ra.addFlashAttribute("error", "Error al cargar el usuario para edición: " + e.getMessage());
            return "redirect:/paneladmin/usuarios";
        }
    }


    @PostMapping("/usuarios/guardar")
    public String guardarEdicion(@ModelAttribute("usuario") Usuario usuarioFormulario, RedirectAttributes ra) {
        try {
            usuarioService.guardar(usuarioFormulario);
            ra.addFlashAttribute("success", "Usuario '" + usuarioFormulario.getUsername() + "' editado correctamente.");
            return "redirect:/paneladmin/usuarios";
        } catch (Exception e) {
            ra.addFlashAttribute("error", "Error al guardar la edición del usuario: " + e.getMessage());
            return "redirect:/paneladmin/usuarios/editar/" + usuarioFormulario.getId();
        }
    }


    @GetMapping("/usuarios/eliminar/{id}")
    public String eliminarUsuario(@PathVariable("id") Long id,
                                  Authentication authentication,
                                  RedirectAttributes ra) {

        try {
            String usernameActual = authentication.getName();
            Usuario usuarioActual = usuarioService.encontrarPorUsername(usernameActual);
            Usuario usuarioAEliminar = usuarioService.encontrarPorId(id);

            if (usuarioActual != null && usuarioActual.getId().equals(id)) {
                ra.addFlashAttribute("error", "ERROR: No puedes eliminar tu propia cuenta de administrador.");
                return "redirect:/paneladmin/usuarios";
            }

            if (usuarioAEliminar == null) {
                ra.addFlashAttribute("error", "ERROR: Usuario a eliminar no encontrado.");
                return "redirect:/paneladmin/usuarios";
            }

            usuarioService.eliminarPorId(id);
            ra.addFlashAttribute("success", "Usuario '" + usuarioAEliminar.getUsername() + "' eliminado correctamente.");
            return "redirect:/paneladmin/usuarios";
        } catch (Exception e) {
            ra.addFlashAttribute("error", "Error al eliminar el usuario: " + e.getMessage());
            return "redirect:/paneladmin/usuarios";
        }
    }


    @GetMapping("/productos")
    public String listarProductos(Model model) {
        try {
            List<Producto> productos = productoService.listarTodosProductosConStock();
            model.addAttribute("productos", productos);
            return "views/admin/productos";
        } catch (Exception e) {
            model.addAttribute("error", "Error al cargar la lista de productos: " + e.getMessage());
            return "views/admin/productos";
        }
    }

    @GetMapping("/productos/nuevo")
    public String mostrarFormularioNuevoProducto(Model model) {
        model.addAttribute("producto", new Producto());
        return "views/admin/agregar-producto";
    }


    @GetMapping("/productos/editar/{id}")
    public String mostrarFormularioEdicionProducto(@PathVariable("id") Long id, Model model, RedirectAttributes ra) {
        try {
            Producto productoAEditar = productoService.encontrarPorId(id);
            if (productoAEditar != null) {
                model.addAttribute("producto", productoAEditar);
                return "views/admin/editar-producto";
            } else {
                ra.addFlashAttribute("error", "Producto no encontrado con ID: " + id);
                return "redirect:/paneladmin/productos";
            }
        } catch (Exception e) {
            ra.addFlashAttribute("error", "Error al cargar el producto para edición: " + e.getMessage());
            return "redirect:/paneladmin/productos";
        }
    }


    @PostMapping("/productos/guardar")
    public String guardarEdicionProducto(
            @ModelAttribute("producto") Producto productoFormulario,
            @RequestParam(value = "imagen", required = false) MultipartFile imagen,
            @RequestParam(value = "imagenUrl", required = false) String imagenUrlExistente,
            RedirectAttributes ra) {

        boolean isNewProduct = productoFormulario.getId() == null || productoFormulario.getId() == 0;
        String imagenUrlFinal = imagenUrlExistente;

        try {
            if (imagen != null && !imagen.isEmpty()) {
                imagenUrlFinal = productoService.guardarImagenYObtenerUrl(productoFormulario, imagen);
            } else if (isNewProduct) {
                ra.addFlashAttribute("error", "Debe seleccionar una imagen para un nuevo producto.");
                return "redirect:/paneladmin/productos/nuevo";
            }

            productoFormulario.setImagenUrl(imagenUrlFinal);

            if (productoFormulario.getDestacado() == null) {
                productoFormulario.setDestacado(false);
            }

            productoService.guardar(productoFormulario);

            String mensaje = isNewProduct
                    ? "Producto '" + productoFormulario.getNombre() + "' agregado correctamente."
                    : "Producto '" + productoFormulario.getNombre() + "' editado correctamente.";

            ra.addFlashAttribute("success", mensaje);
            return "redirect:/paneladmin/productos";
        } catch (IOException e) {
            ra.addFlashAttribute("error", "Error interno: Falló al guardar la imagen física.");
            System.err.println("Error de IO al guardar imagen: " + e.getMessage());

            if (productoFormulario.getId() != null) {
                return "redirect:/paneladmin/productos/editar/" + productoFormulario.getId();
            } else {
                return "redirect:/paneladmin/productos/nuevo";
            }
        } catch (Exception e) {
            ra.addFlashAttribute("error", "Error al guardar el producto: " + e.getMessage());
            System.err.println("Error al guardar producto: " + e.getMessage());

            if (productoFormulario.getId() != null) {
                return "redirect:/paneladmin/productos/editar/" + productoFormulario.getId();
            } else {
                return "redirect:/paneladmin/productos/nuevo";
            }
        }
    }


    @GetMapping("/productos/eliminar/{id}")
    public String eliminarProducto(@PathVariable("id") Long id, RedirectAttributes ra) {
        try {
            Producto productoAEliminar = productoService.encontrarPorId(id);

            if (productoAEliminar == null) {
                ra.addFlashAttribute("error", "ERROR: Producto a eliminar no encontrado.");
                return "redirect:/paneladmin/productos";
            }

            productoService.eliminarPorId(id);
            ra.addFlashAttribute("success", "Producto '" + productoAEliminar.getNombre() + "' eliminado correctamente.");
            return "redirect:/paneladmin/productos";
        } catch (Exception e) {
            ra.addFlashAttribute("error", "Error al eliminar el producto: " + e.getMessage());
            return "redirect:/paneladmin/productos";
        }
    }
}