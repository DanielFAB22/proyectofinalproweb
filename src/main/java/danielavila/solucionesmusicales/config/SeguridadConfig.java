package danielavila.solucionesmusicales.config;

import danielavila.solucionesmusicales.service.UserDetailsServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import org.springframework.beans.factory.annotation.Autowired;

@Configuration
@EnableMethodSecurity
public class SeguridadConfig {

    @Autowired
    private CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http, UserDetailsServiceImpl userDetailsService) throws Exception {
        http
                // Ignorar CSRF solo para endpoints REST
                .csrf(csrf -> csrf
                        .ignoringRequestMatchers("/api/registro", "/api/admin/**")
                )

                // Configuración de permisos
                .authorizeHttpRequests(auth -> auth
                        // Endpoints de admin
                        .requestMatchers("/paneladmin", "/api/admin/**").hasRole("ADMIN")

                        // Endpoints públicos
                        .requestMatchers(
                                "/",
                                "/index",
                                "/login",
                                "/registro",
                                "/api/registro",
                                "/assets/**",
                                "/css/**",
                                "/js/**",
                                "/images/**",
                                "/somos",
                                "/catalogos/**",
                                "/guitarras/**",
                                "/bajos/**",
                                "/WEB-INF/jsp/views/public/**",
                                "/swagger-ui/**",
                                "/v3/api-docs/**"
                        ).permitAll()

                        // Cualquier otra petición requiere autenticación
                        .anyRequest().authenticated()
                )

                // Login
                .formLogin(form -> form
                        .loginPage("/login")
                        .loginProcessingUrl("/login")
                        .successHandler(customAuthenticationSuccessHandler)
                        .failureUrl("/login?error=true")
                        .permitAll()
                )

                // Logout
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/login?logout=true")
                        .permitAll()
                )

                // Manejo de errores
                .exceptionHandling(exception -> exception
                        .accessDeniedPage("/acceso-denegado")
                )

                // UserDetailsService
                .userDetailsService(userDetailsService);

        return http.build();
    }

    // Encoder de contraseñas
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // UserDetailsService
    @Bean
    public UserDetailsService userDetailsService(UserDetailsServiceImpl impl) {
        return impl;
    }
}
