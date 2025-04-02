package hkmu.wadd.dao;

import hkmu.wadd.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;

public interface CourseRepository extends JpaRepository<Course, Long> {
}
