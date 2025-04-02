package hkmu.wadd.dao;

import hkmu.wadd.exception.CourseNotFound;
import hkmu.wadd.exception.LectureNotFound;
import hkmu.wadd.model.Course;
import hkmu.wadd.model.Lecture;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class CourseService {
    @Resource
    private CourseRepository cRepo;

    @Resource
    private LectureRepository lRepo;

    @Transactional
    public List<Course> getCourses() {
        return cRepo.findAll();
    }

    @Transactional
    public Course getCourse(long id)
            throws CourseNotFound {
        Course course = cRepo.findById(id).orElse(null);
        if (course == null) {
            throw new CourseNotFound(id);
        }
        return course;
    }

    @Transactional
    public Lecture getLecture(long courseId, UUID lectureId)
            throws CourseNotFound, LectureNotFound {
        Course course = cRepo.findById(courseId).orElse(null);
        if (course == null) {
            throw new CourseNotFound(courseId);
        }
        Lecture lecture = lRepo.findById(lectureId).orElse(null);
        if (lecture == null) {
            throw new LectureNotFound(lectureId);
        }
        return lecture;
    }

    @Transactional(rollbackFor = CourseNotFound.class)
    public void delete(long id) throws CourseNotFound {
        Course deletedCourse = cRepo.findById(id).orElse(null);
        if (deletedCourse == null) {
            throw new CourseNotFound(id);
        }
        cRepo.delete(deletedCourse);
    }

    @Transactional(rollbackFor = LectureNotFound.class)
    public void deleteLecture(long courseId, UUID lectureId)
            throws CourseNotFound, LectureNotFound {
        Course course = cRepo.findById(courseId).orElse(null);
        if (course == null) {
            throw new CourseNotFound(courseId);
        }
        for (Lecture lecture : course.getLectures()) {
            if (lecture.getId().equals(lectureId)) {
                course.deleteLecture(lecture);
                cRepo.save(course);
                return;
            }
        }
        throw new LectureNotFound(lectureId);
    }

    @Transactional
    public long createCourse(String teacherName, String courseName, String lectureTitle,
                             String comment, List<MultipartFile> lectures)
            throws IOException {
        Course course = new Course();
        course.setTeacherName(teacherName);
        course.setCourseName(courseName);
        course.setLectureTitle(lectureTitle);
        course.setComment(comment);

        for (MultipartFile filePart : lectures) {
            Lecture lecture = new Lecture();
            lecture.setName(filePart.getOriginalFilename());
            lecture.setMimeContentType(filePart.getContentType());
            lecture.setContents(filePart.getBytes());
            lecture.setCourse(course);
            if (lecture.getName() != null && lecture.getName().length() > 0
                    && lecture.getContents() != null
                    && lecture.getContents().length > 0) {
                course.getLectures().add(lecture);
            }
        }
        Course savedCourse = cRepo.save(course);
        return savedCourse.getId();
    }
}
