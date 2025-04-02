package hkmu.wadd.exception;

public class CourseNotFound extends Exception {
    public CourseNotFound(long id) {
        super("Course "+ id +"Not Found");
    }
}
