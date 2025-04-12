package hkmu.wadd.controller;

import hkmu.wadd.dao.UserManagementService;
import hkmu.wadd.validator.UserValidator;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import hkmu.wadd.controller.UserManagementController.Form;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/")
public class RegistrationController {
    @Resource
    UserManagementService userManagementService;
    @Autowired
    private UserValidator userValidator;

    // Display the registration form
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("lectureUser", new Form());
        return "registration";
    }

    // Handle registration form submission
    @PostMapping("/register")
    public String registerUser(@ModelAttribute("lectureUser") @Valid Form form, BindingResult result)
            throws IllegalArgumentException {
        userValidator.validate(form, result);

        if (result.hasErrors()) {
            return "registration";
        }

        userManagementService.createUser(form.getUsername(),
                form.getPassword(),
                form.getFullName(),
                form.getEmail(),
                form.getPhone(),
                form.getRoles());
        return "redirect:/login"; // Redirect to the login page after successful registration
    }
}