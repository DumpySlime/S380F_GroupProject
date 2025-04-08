package hkmu.wadd.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public InMemoryUserDetailsManager userDetailsService(PasswordEncoder passwordEncoder) {
        UserDetails admin = User.builder()
                .username("admin")
                .password(passwordEncoder.encode("admin123"))
                .roles("ADMIN")
                .build();
        UserDetails user = User.builder()
                .username("user")
                .password(passwordEncoder.encode("user123"))
                .roles("USER")
                .build();
        return new InMemoryUserDetailsManager(admin, user);
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(authorize -> authorize
                .requestMatchers("/h2-console/**").permitAll()  // 允许访问H2控制台
                .requestMatchers("/WEB-INF/jsp/**").permitAll()  // 允许访问JSP文件
                .requestMatchers("/login", "/css/**", "/js/**", "/images/**").permitAll()  // 允许访问登录页和静态资源
                .requestMatchers("/admin/**").hasRole("ADMIN")  // 需要ADMIN角色
                .requestMatchers("/user/**").hasAnyRole("ADMIN", "USER")  // 需要ADMIN或USER角色
                .anyRequest().authenticated()  // 其他请求需要认证
            )
            .formLogin(form -> form
                .loginPage("/login")
                .loginProcessingUrl("/login")  // 明确指定登录处理URL
                .defaultSuccessUrl("/admin/dashboard", true)  // 强制登录成功后跳转到dashboard
                .permitAll()
            )
            .logout(logout -> logout
                .logoutSuccessUrl("/login?logout")
                .permitAll()
            )
            .csrf(csrf -> csrf.disable())  // 在生产环境中应该启用CSRF保护
            .headers(headers -> headers.frameOptions().disable());  // 允许H2控制台的iframe

        return http.build();
    }
} 