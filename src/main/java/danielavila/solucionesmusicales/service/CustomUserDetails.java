package danielavila.solucionesmusicales.service;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;


public class CustomUserDetails extends User {

    private final String email;

    public CustomUserDetails(
            String username,
            String password,
            String email,
            Collection<? extends GrantedAuthority> authorities) {

        super(username, password, authorities);
        this.email = email;
    }

    public String getEmail() {
        return email;
    }
}