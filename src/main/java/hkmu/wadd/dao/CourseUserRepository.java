package hkmu.wadd.dao;

import hkmu.wadd.model.CourseUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CourseUserRepository extends JpaRepository<CourseUser, String> {
    Optional<CourseUser> findByUsername(String username);
}
