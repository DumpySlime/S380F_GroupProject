package hkmu.wadd.controller;

import hkmu.wadd.dao.UserService;
import hkmu.wadd.exception.UserNotFoundException;
import hkmu.wadd.model.User;
import jakarta.annotation.Resource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Resource
    private UserService userService;

    @GetMapping("/dashboard")
    public String dashboard(ModelMap model) {
        // 获取当前用户信息
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("username", auth.getName());
        return "admin/dashboard";
    }

    // 用户管理
    @GetMapping("/users")
    public String listUsers(ModelMap model) {
        model.addAttribute("users", userService.getAllUsers());
        return "admin/users";
    }

    @GetMapping("/users/create")
    public ModelAndView createUserForm() {
        return new ModelAndView("admin/createUser", "userForm", new UserForm());
    }

    @PostMapping("/users/create")
    public View createUser(UserForm form) {
        userService.createUser(
                form.getUsername(),
                form.getPassword(),
                form.getFullName(),
                form.getEmail(),
                form.getRole()
        );
        return new RedirectView("/admin/users", true);
    }

    @GetMapping("/users/edit/{id}")
    public ModelAndView editUserForm(@PathVariable("id") Long id) throws UserNotFoundException {
        User user = userService.getUser(id);
        UserForm form = new UserForm();
        form.setUsername(user.getUsername());
        form.setFullName(user.getFullName());
        form.setEmail(user.getEmail());
        form.setRole(user.getRole());
        
        return new ModelAndView("admin/editUser", "userForm", form);
    }

    @PostMapping("/users/edit/{id}")
    public View editUser(@PathVariable("id") Long id, UserForm form) throws UserNotFoundException {
        userService.updateUser(
                id,
                form.getUsername(),
                form.getFullName(),
                form.getEmail(),
                form.getRole()
        );
        
        if (form.getPassword() != null && !form.getPassword().isEmpty()) {
            userService.updatePassword(id, form.getPassword());
        }
        
        return new RedirectView("/admin/users", true);
    }

    @GetMapping("/users/delete/{id}")
    public View deleteUser(@PathVariable("id") Long id) throws UserNotFoundException {
        userService.deleteUser(id);
        return new RedirectView("/admin/users", true);
    }

    // 表单对象
    public static class UserForm {
        private String username;
        private String password;
        private String fullName;
        private String email;
        private String role;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String getFullName() {
            return fullName;
        }

        public void setFullName(String fullName) {
            this.fullName = fullName;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getRole() {
            return role;
        }

        public void setRole(String role) {
            this.role = role;
        }
    }
} 