package danielavila.solucionesmusicales.util;

import danielavila.solucionesmusicales.model.Usuario;
import danielavila.solucionesmusicales.model.Rol;


public class JspFunctions {

    
    public static boolean tieneRol(Usuario usuario, String nombreRol) {
        if (usuario == null || usuario.getRoles() == null) {
            return false;
        }


        for (Rol rol : usuario.getRoles()) {
            if (rol.getNombre() != null && rol.getNombre().equalsIgnoreCase(nombreRol)) {
                return true;
            }
        }
        return false;
    }
}