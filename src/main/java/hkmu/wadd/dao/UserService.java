package hkmu.wadd.dao;

import hkmu.wadd.exception.UserNotFoundException;
import hkmu.wadd.model.User;
import jakarta.annotation.Resource;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserService {
    
    @Resource
    private UserRepository userRepository;
    
    @Resource
    private PasswordEncoder passwordEncoder;
    
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
    
    public User getUser(Long id) throws UserNotFoundException {
        return userRepository.findById(id)
                .orElseThrow(() -> new UserNotFoundException(id));
    }
    
    public User getUserByUsername(String username) throws UserNotFoundException {
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new UserNotFoundException(username));
    }
    
    @Transactional
    public Long createUser(String username, String password, String fullName, String email, String role) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));
        user.setFullName(fullName);
        user.setEmail(email);
        user.setRole(role);
        
        User savedUser = userRepository.save(user);
        return savedUser.getId();
    }
    
    @Transactional
    public void updateUser(Long id, String username, String fullName, String email, String role) 
            throws UserNotFoundException {
        User user = getUser(id);
        user.setUsername(username);
        user.setFullName(fullName);
        user.setEmail(email);
        user.setRole(role);
        userRepository.save(user);
    }
    
    @Transactional
    public void updatePassword(Long id, String password) throws UserNotFoundException {
        User user = getUser(id);
        user.setPassword(passwordEncoder.encode(password));
        userRepository.save(user);
    }
    
    @Transactional
    public void deleteUser(Long id) throws UserNotFoundException {
        if (!userRepository.existsById(id)) {
            throw new UserNotFoundException(id);
        }
        userRepository.deleteById(id);
    }
} 