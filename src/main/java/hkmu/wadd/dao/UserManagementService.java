package hkmu.wadd.dao;


import hkmu.wadd.model.CourseUser;
import hkmu.wadd.model.UserRole;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserManagementService {
    @Resource
    private CourseUserRepository cuRepo;

    @Autowired
    private PasswordEncoder pe;

    @Transactional
    public List<CourseUser> getUsers() {
        return cuRepo.findAll();
    }

    public CourseUser getUserByUsername(String username)
            throws IllegalArgumentException {
        return cuRepo.findByUsername(username).orElseThrow();
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
    public void createUser(String username, String password, String fullName,
                           String email, String phone, String[] roles) {
        CourseUser cUser = new CourseUser(username, pe.encode(password),
                fullName, email, phone, roles);
        cuRepo.save(cUser);
    }

    @Transactional
    public void updateUser(String username, String password,
                           String fullName, String email, String phone) {
        CourseUser cUser = getUserByUsername(username);
        cUser.setFullName(fullName);
        cUser.setPassword(password);
        cUser.setEmail(email);
        cUser.setPhone(phone);
    }

    @Transactional
    @PostConstruct
    public void createFirstAdmin() {
        if (cuRepo.count() == 0) {
            CourseUser cUser = new CourseUser("keith", pe.encode("keithpw"),
                    "AAAA", "ex@example.com", "1111111", new String[]{"ROLE_ADMIN", "ROLE_USER"});
            cuRepo.save(cUser);
        }
    }
}
