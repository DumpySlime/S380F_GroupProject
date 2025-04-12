package hkmu.wadd.model;

import jakarta.persistence.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "users")
public class CourseUser {
    @Id
    private String username;
    private String password;
    private String fullName;
    private String email;
    private String phone;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    private List<UserRole> roles = new ArrayList<>();

    public CourseUser(){
    }

    public CourseUser(String username, String password, String fullName, String email, String phone, String[] roles) {
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        for(String role : roles){
            this.roles.add(new UserRole(this, role));
        }
    }

    // Getter 和 Setter
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public List<UserRole> getRoles() {
        return roles;
    }
    public void setRoles(String[] roles) {
        for(String role : roles){
            this.roles.add(new UserRole(this, role));
        }
    }

}