package danielavila.solucionesmusicales.service;

import danielavila.solucionesmusicales.dto.RegistrationRequestDTO;
import danielavila.solucionesmusicales.model.Rol;
import danielavila.solucionesmusicales.model.Usuario;
import danielavila.solucionesmusicales.repository.RolRepository;
import danielavila.solucionesmusicales.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private RolRepository rolRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;


    
    public List<Usuario> listarTodosUsuarios() {
        return usuarioRepository.findAll();
    }

    
    @Transactional // <--- AÑADIDO: Asegura que el FetchType.EAGER se resuelva completamente.
    public Usuario encontrarPorId(Long id) {
        return usuarioRepository.findById(id).orElse(null);
    }

    
    public Usuario encontrarPorUsername(String username) {
        return usuarioRepository.findByUsername(username).orElse(null);
    }


    
    @Transactional
    public Usuario guardar(Usuario usuario) {
        if (usuario.getId() != null) {
            // Es una ACTUALIZACIÓN
            Optional<Usuario> usuarioExistenteOpt = usuarioRepository.findById(usuario.getId());

            if (usuarioExistenteOpt.isPresent()) {
                Usuario existente = usuarioExistenteOpt.get();


                existente.setEmail(usuario.getEmail());



                return usuarioRepository.save(existente);
            }
        }


        return usuarioRepository.save(usuario);
    }

    
    @Transactional
    public void eliminarPorId(Long id) {
        usuarioRepository.deleteById(id);
    }


    
    @Transactional
    public Usuario registrarNuevoUsuario(RegistrationRequestDTO request) {


        if (usuarioRepository.findByUsername(request.getUsername()).isPresent()) {
            throw new IllegalArgumentException("El nombre de usuario '" + request.getUsername() + "' ya está registrado.");
        }

        if (usuarioRepository.findByEmail(request.getEmail()).isPresent()) {
            throw new IllegalArgumentException("El email '" + request.getEmail() + "' ya está registrado.");
        }


        Usuario nuevoUsuario = new Usuario();
        nuevoUsuario.setUsername(request.getUsername());
        nuevoUsuario.setEmail(request.getEmail());


        String passwordEncriptada = passwordEncoder.encode(request.getPassword());
        nuevoUsuario.setPassword(passwordEncriptada);


        Optional<Rol> rolUser = rolRepository.findByNombre("ROLE_USER");

        if (rolUser.isEmpty()) {
            throw new IllegalStateException("El rol 'ROLE_USER' no se encuentra configurado en la base de datos.");
        }

        Set<Rol> roles = new HashSet<>();
        roles.add(rolUser.get());
        nuevoUsuario.setRoles(roles);


        return usuarioRepository.save(nuevoUsuario);
    }
}