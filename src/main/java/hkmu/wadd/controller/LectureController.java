package hkmu.wadd.controller;

import hkmu.wadd.dao.LectureService;
import hkmu.wadd.exception.LectureNotFound;
import hkmu.wadd.exception.NoteNotFound;
import hkmu.wadd.model.Lecture;
import hkmu.wadd.model.Note;
import hkmu.wadd.view.DownloadingView;
import jakarta.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/lecture")
public class LectureController {

    private static final Logger log = LoggerFactory.getLogger(LectureController.class);
    @Resource
    private LectureService lectureService;

    // Controller methods, Form-backing object, ...
    @GetMapping(value = {"", "/index"})
    public String index(ModelMap model) {
        model.addAttribute("lectureDatabase", lectureService.getLectures());
        return "index";
    }

    // Create Course object
    @GetMapping("/create")
    public ModelAndView create() {
        return new ModelAndView("lecture_add", "lectureForm", new Form());
    }

    public static class Form {
        private String teacherName;
        private String lectureTitle;
        private String comment;
        private List<MultipartFile> notes;

        // Getters and Setters of customerName, subject, body, attachments
        public String getTeacherName() {
            return teacherName;
        }

        public void setTeacherName(String customerName) {
            this.teacherName = customerName;
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

        public List<MultipartFile> getNotes() {
            return notes;
        }

        public void setNotes(List<MultipartFile> notes) {
            this.notes = notes;
        }
    }


    @PostMapping("/create")
    public View create(Form form) throws IOException {
        long lectureId = lectureService.createLecture(form.getTeacherName(),
                form.getLectureTitle(), form.getComment(), form.getNotes());
        return new RedirectView("/lecture/view/" + lectureId, true);
    }

    @GetMapping("/view/{lectureId}")
    public String view(@PathVariable("lectureId") long lectureId,
                       ModelMap model)
            throws LectureNotFound {
        Lecture lecture = lectureService.getLecture(lectureId);
        model.addAttribute("lectureId", lectureId);
        model.addAttribute("lecture", lecture);
        return "lecture_view";
    }

    // Downloading lecture note
    @GetMapping("/{lectureId}/note/{note:.+}")
    public View download(@PathVariable("lectureId") long lectureId,
                         @PathVariable("note") UUID noteId)
            throws LectureNotFound, NoteNotFound {
        Note note = lectureService.getNote(lectureId, noteId);
        return new DownloadingView(note.getName(),
                note.getMimeContentType(), note.getContents());
    }

    @GetMapping("/delete/{lectureId}")
    public String deleteLecture(@PathVariable("lectureId") long lectureId)
            throws LectureNotFound {
        lectureService.delete(lectureId);
        return "redirect:/course/index";
    }

    @GetMapping("/{courseId}/delete/{attachment:.+}")
    public String deleteNote(@PathVariable("lectureId") long lectureId,
                                   @PathVariable("note") UUID noteId)
            throws NoteNotFound, LectureNotFound {
        lectureService.deleteNote(lectureId, noteId);
        return "redirect:/lecture/view/" + lectureId;
    }

    // add show error page and security stuff
}
