package danielavila.solucionesmusicales.service;

import danielavila.solucionesmusicales.model.Usuario;
import danielavila.solucionesmusicales.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Set;
import java.util.stream.Collectors;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Usuario usuario = usuarioRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("Usuario no encontrado: " + username));


        Set<GrantedAuthority> authorities = usuario.getRoles().stream()
                .map(rol -> {
                    String roleName = rol.getNombre().toUpperCase();


                    if (roleName.startsWith("ROLE_")) {

                        return new SimpleGrantedAuthority(roleName);
                    } else {

                        return new SimpleGrantedAuthority("ROLE_" + roleName);
                    }
                })
                .collect(Collectors.toSet());


        return new CustomUserDetails(
                usuario.getUsername(),
                usuario.getPassword(),
                usuario.getEmail(),
                authorities
        );
    }


    public Usuario obtenerUsuarioPorUsername(String username) {
        return usuarioRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("Usuario no encontrado: " + username));
    }
}