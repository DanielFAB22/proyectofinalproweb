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
                .csrf(csrf -> csrf.ignoringRequestMatchers("/api/admin/**"))

                .authorizeHttpRequests(auth -> auth

                        .requestMatchers("/paneladmin", "/api/admin/**").hasRole("ADMIN")

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
                        .anyRequest().authenticated()
                )


                .formLogin(form -> form
                        .loginPage("/login")
                        .loginProcessingUrl("/login")
                        .successHandler(customAuthenticationSuccessHandler)
                        .failureUrl("/login?error=true")
                        .permitAll()
                )


                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/login?logout=true")
                        .permitAll()
                )

                .exceptionHandling(exception -> exception

                        .accessDeniedPage("/acceso-denegado")
                )

                .userDetailsService(userDetailsService);

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService userDetailsService(UserDetailsServiceImpl impl) {
        return impl;
    }
}