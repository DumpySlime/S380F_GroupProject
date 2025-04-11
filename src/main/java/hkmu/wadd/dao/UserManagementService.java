package hkmu.wadd.dao;

import hkmu.wadd.controller.UserManagementController;
import hkmu.wadd.model.CourseUser;
import jakarta.annotation.Resource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class UserManagementService {
    public UserManagementController umService;
    @Resource
    private CourseUserRepository cuRepo;

    @Transactional
    public List<CourseUser> getUsers() {
        return cuRepo.findAll();
    }

    @Transactional
    public void delete(String username) {
        CourseUser cUser = cuRepo.findById(username).orElse(null);
        if (cUser == null) {
            throw new UsernameNotFoundException("User '" + username + "' not found.");
        }
        cuRepo.delete(cUser);
    }

    @Transactional
    public void createUser(String username, String password, String fullName, String email, String phone, String[] roles) {
        CourseUser user = new CourseUser(username, password,fullName, email,phone,roles);
        cuRepo.save(user);
    }

    public Optional<CourseUser> getCurrentUser() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username;

        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        } else {
            username = principal.toString();
        }

        return cuRepo.findByUsername(username); // Assuming you have a method to find user by username
    }


    public void updateUser(CourseUser user) {
        // Fetch the existing user from the database
        CourseUser existingUser = cuRepo.findById(user.getEmail()).orElseThrow(() -> new RuntimeException("User not found"));

        // Update only the mutable fields
        existingUser.setUsername(user.getUsername());
        existingUser.setPassword(user.getPassword());
        existingUser.setFullName(user.getFullName());
        existingUser.setPhone(user.getPhone());

        // Roles should remain unchanged, so do not set them again
        cuRepo.save(existingUser); // Save the updated user
    }
}
