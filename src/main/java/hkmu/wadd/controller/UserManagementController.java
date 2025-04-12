package hkmu.wadd.controller;

import hkmu.wadd.dao.UserManagementService;
import hkmu.wadd.model.CourseUser;
import hkmu.wadd.validator.UserValidator;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequestMapping("/courseUser")
public class UserManagementController {
    @Resource
    UserManagementService userManagementService;

    @Autowired
    PasswordEncoder pe;

    @Autowired
    private UserValidator userValidator;

    @GetMapping({"", "/", "/list"})
    public String list(ModelMap model, Principal principal) {
        model.addAttribute("lectureUsers", userManagementService.getUsers());
        // Get the current user's username
        String username = principal.getName();
        // Fetch the current user's full information
        CourseUser currentUser = userManagementService.getUserByUsername(username);
        // Add current user data to the model
        model.addAttribute("currentUser", currentUser);
        return "listUser";
    }

    public static class Form {
        @NotEmpty(message = "Please enter your user name")
        private String username;

        @NotEmpty(message = "Please enter your password")
        @Size(min=5, max=15, message = "Your password length must be between {min} and {max}.")
        private String password;
        private String confirmPassword;
        private String fullName;
        private String email;
        private String phone;
        @NotEmpty(message="Please select at least one role.")
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
        public String getConfirmPassword() {
            return confirmPassword;
        }
        public void setConfirmPassword(String confirmPassword) {
            this.confirmPassword = confirmPassword;
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
    public ModelAndView createUser() {
        return new ModelAndView("addUser", "lectureUser", new Form());
    }

    @PostMapping("/create")
    public String createUser(@ModelAttribute("lectureUser") @Valid Form form, BindingResult result)
            throws IOException {
        userValidator.validate(form, result);

        if (result.hasErrors()) {
            return "addUser";
        }

        userManagementService.createUser(form.getUsername(),
                form.getPassword(),
                form.getFullName(),
                form.getEmail(),
                form.getPhone(),
                form.getRoles());
        return "redirect:/courseUser/list";
    }

    public static class updateForm {
        private String password;
        private String fullName;
        private String email;
        private String phone;

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

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

    }

    @GetMapping("/edit/{username}")
    public ModelAndView editUser(@PathVariable("username") String username)
        throws IOException {
        CourseUser user = userManagementService.getUserByUsername(username);

        ModelAndView modelAndView = new ModelAndView("editUser");
        modelAndView.addObject("user", user);

        updateForm userForm = new updateForm();
        userForm.setFullName(user.getFullName());
        userForm.setEmail(user.getEmail());
        userForm.setPhone(user.getPhone());
        modelAndView.addObject("userForm", userForm);
        return modelAndView;
    }

    @PostMapping("/edit/{username}")
    public String editUser(@PathVariable("username") String username,
                           Form form ){
        userManagementService.updateUser(username, pe.encode(form.getPassword()),
                form.getFullName(), form.getEmail(), form.getPhone());
    return "redirect:/courseUser/list";
    }

    @GetMapping("/delete/{username}")
    public String delete(@PathVariable("username") String username) {
        userManagementService.delete(username);
        return "redirect:/courseUser/list";
    }
}

