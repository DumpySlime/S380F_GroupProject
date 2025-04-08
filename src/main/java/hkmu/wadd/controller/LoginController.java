package hkmu.wadd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String login() {
        // 检查用户是否已认证，如果已认证则重定向到仪表板
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.isAuthenticated() && 
            !auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ANONYMOUS"))) {
            return "redirect:/admin/dashboard";
        }
        return "login";
    }
    
    @GetMapping("/")
    public String index() {
        return "redirect:/admin/dashboard";
    }
} 