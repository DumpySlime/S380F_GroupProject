package hkmu.wadd.controller;

import hkmu.wadd.dao.UserManagementService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Controller
@RequestMapping("/courseUser")
public class UserManagementController {
    @Resource
    UserManagementService userManagementService;

    @GetMapping({"", "/", "/list"})
    public String list(ModelMap model) {
        model.addAttribute("lectureUsers", userManagementService.getUsers());
        return "listUser";
    }

    public static class Form {
        private String username;
        private String password;
        private String fullName;
        private String email;
        private String phone;
        private String[] roles;

        // getters and setters for all properties
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
        public String getFullName() { return fullName; }
        public void setFullName(String fullName) {this.fullName = fullName;}
        public String getEmail() { return email; }
        public void setEmail(String email) { this.email = email; }
        public String getPhone() { return phone; }
        public void setPhone(String phone) { this.phone = phone; }
        public String[] getRoles() {
            return roles;
        }

        public void setRoles(String[] roles) {
            this.roles = roles;
        }
    }

    @GetMapping("/create")
    public ModelAndView createUser(String username, String password, String fullName, String email, String phone, String[] roles) {
        return new ModelAndView("addUser", "lectureUser", new Form());
    }

    @PostMapping("/create")
    public String createUser(Form form) throws IOException {
        userManagementService.createUser(form.getUsername(),
                form.getPassword(),
                form.getFullName(),
                form.getEmail(),
                form.getPhone(),
                form.getRoles());
        return "redirect:/courseUser/list";
    }

    @GetMapping("/delete/{username}")
    public String delete(@PathVariable("username") String username) {
        userManagementService.delete(username);
        return "redirect:/courseUser/list";
    }
}

