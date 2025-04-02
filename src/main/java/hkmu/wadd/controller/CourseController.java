package hkmu.wadd.controller;

import hkmu.wadd.dao.CourseService;
import hkmu.wadd.exception.CourseNotFound;
import hkmu.wadd.exception.LectureNotFound;
import hkmu.wadd.model.Course;
import hkmu.wadd.model.Lecture;
import hkmu.wadd.view.DownloadingView;
import jakarta.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/course")
public class CourseController {

    private static final Logger log = LoggerFactory.getLogger(CourseController.class);
    @Resource
    private CourseService cService;

    // Controller methods, Form-backing object, ...
    @GetMapping(value = {"", "/index"})
    public String index(ModelMap model) {
        model.addAttribute("courseDatabase", cService.getCourses());
        return "index";
    }

    public static class Form {
        private String teacherName;
        private String courseName;
        private String lectureTitle;
        private String comment;
        private List<MultipartFile> lectures;

        // Getters and Setters of customerName, subject, body, attachments
        public String getTeacherName() {
            return teacherName;
        }

        public void setTeacherName(String customerName) {
            this.teacherName = customerName;
        }

        public String getCourseName() {
            return courseName;
        }

        public void setCourseName(String courseName) {
            this.courseName = courseName;
        }

        public String getLectureTitle() {
            return lectureTitle;
        }

        public void setLectureTitle(String lectureTitle) {
            this.lectureTitle = lectureTitle;
        }

        public String getComment() {
            return comment;
        }

        public void setComment(String comment) {
            this.comment = comment;
        }

        public List<MultipartFile> getLectures() {
            return lectures;
        }

        public void setAttachments(List<MultipartFile> lectures) {
            this.lectures = lectures;
        }
    }

    // Create Course object
    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("add", "courseForm", new Form());
    }

    @PostMapping("/create")
    public View create(Form form) throws IOException {
        long courseId = cService.createCourse(form.getTeacherName(), form.getCourseName(),
                form.getLectureTitle(), form.getComment(), form.getLectures());
        return new RedirectView("/course/course_material/" + courseId, true);
    }

    @GetMapping("/course_material/{courseId}")
    public String view(@PathVariable("courseId") long courseId,
                       ModelMap model)
            throws CourseNotFound {
        Course course = cService.getCourse(courseId);
        model.addAttribute("courseId", courseId);
        model.addAttribute("course", course);
        return "course_material";
    }

    // Downloading lecture note
    @GetMapping("/{courseId}/lecture/{lecture:.+}")
    public View download(@PathVariable("courseId") long courseId,
                         @PathVariable("lecture") UUID lectureId)
            throws CourseNotFound, LectureNotFound {
        Lecture lecture = cService.getLecture(courseId, lectureId);
        return new DownloadingView(lecture.getName(),
                lecture.getMimeContentType(), lecture.getContents());
    }

    @GetMapping("/delete/{courseId}")
    public String deleteCourse(@PathVariable("courseId") long courseId)
            throws CourseNotFound {
        cService.delete(courseId);
        return "redirect:/course/index";
    }

    @GetMapping("/{courseId}/delete/{attachment:.+}")
    public String deleteLecture(@PathVariable("courseId") long courseId,
                                   @PathVariable("lecture") UUID lectureId)
            throws CourseNotFound, LectureNotFound {
        cService.deleteLecture(courseId, lectureId);
        return "redirect:/course/course_material/" + courseId;
    }
}
