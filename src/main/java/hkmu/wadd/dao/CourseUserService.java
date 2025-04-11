package hkmu.wadd.dao;

import hkmu.wadd.model.UserRole;
import hkmu.wadd.model.CourseUser;
import jakarta.annotation.Resource;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class CourseUserService implements UserDetailsService {
    @Resource
    CourseUserRepository courseUserRepository;

    @Override
    public UserDetails loadUserByUsername(String username)
        throws UsernameNotFoundException{
        CourseUser courseUser = courseUserRepository.findById(username).orElse(null);
        if(courseUser == null){
            throw new UsernameNotFoundException("User '" + username + "' not found");
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (UserRole role: courseUser.getRoles()){
            authorities.add(new SimpleGrantedAuthority(role.getRole()));
        }
        return new User(courseUser.getUsername(), courseUser.getPassword(), authorities);
    }

    @Transactional
    public void registerUser(String username, String password,
                             String fullName, String email, String phone, String role ) {
        // Check if the user already exists
        if (courseUserRepository.existsById(username)){
            throw new IllegalArgumentException("Username '" +username+ "' is already taken.");
        }

        // Create a new user without encoding the password
        CourseUser newUser = new CourseUser();
        newUser.setUsername(username);
        newUser.setPassword(password);
        newUser.setFullName(fullName);
        newUser.setEmail(email);
        newUser.setPhone(phone);

        // Add the selected role
        UserRole selectedRole = new UserRole(newUser, role);
        newUser.getRoles().add(selectedRole);

        // Save the user to the database
        courseUserRepository.save(newUser);
    }
}
