package hkmu.wadd.controller;

import hkmu.wadd.dao.CourseUserService;
import hkmu.wadd.dao.LectureService;
import hkmu.wadd.dao.UserManagementService;
import hkmu.wadd.model.CourseUser;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
public class RegistrationController {
    UserManagementService userManagementService;
    // Display the registration form
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("form", new IndexController.Form());
        model.addAttribute("registrationUsers", userManagementService.getUsers());
        return "registration";
    }

    // Handle registration form submission
    @PostMapping("/register")
    public String registerUser(IndexController.Form form)
            throws IllegalArgumentException {
        userManagementService.createUser(form.getUsername(),
                form.getPassword(),
                form.getFullName(),
                form.getEmail(),
                form.getPhone(),
                form.getRoles());
        return "redirect:/login"; // Redirect to the login page after successful registration
    }
}