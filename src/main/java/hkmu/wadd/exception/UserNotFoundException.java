package hkmu.wadd.exception;

public class UserNotFoundException extends Exception {
    public UserNotFoundException(Long id) {
        super("User #" + id + " not found");
    }
    
    public UserNotFoundException(String username) {
        super("User with username '" + username + "' not found");
    }
} 