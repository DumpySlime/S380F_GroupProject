package hkmu.wadd.controller;

import hkmu.wadd.dao.CommentService;
import hkmu.wadd.dao.LectureService;
import hkmu.wadd.exception.LectureNotFound;
import hkmu.wadd.exception.NoteNotFound;
import hkmu.wadd.model.Comment;
import hkmu.wadd.model.Lecture;
import hkmu.wadd.model.Note;
import hkmu.wadd.view.DownloadingView;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/index/lecture")
public class LectureController {
    @Resource
    private LectureService lectureService;
    @Resource
    private CommentService commentService;
    // --- Lecture Related ---
    // Create Lecture object
    @GetMapping("/create")
    public ModelAndView createLecture() {
        return new ModelAndView("addLecture", "lectureForm", new LectureForm());
    }

    public static class LectureForm {
        private String lectureTitle;
        private String body;
        private List<MultipartFile> notes;

        public String getLectureTitle() {
            return lectureTitle;
        }

        public void setLectureTitle(String lectureTitle) {
            this.lectureTitle = lectureTitle;
        }

        public String getBody() {
            return body;
        }

        public void setBody(String body) {
            this.body = body;
        }

        public List<MultipartFile> getNotes() {
            return notes;
        }

        public void setNotes(List<MultipartFile> notes) {
            this.notes = notes;
        }
    }

    @PostMapping("/create")
    public View createLecture(LectureForm lectureForm, Principal principal) throws IOException {
        long lectureId = lectureService.createLecture(principal.getName(),
                lectureForm.getLectureTitle(), lectureForm.getBody(), lectureForm.getNotes());
        return new RedirectView("/index/lecture/view/" + lectureId, true);
    }

    @GetMapping("/view/{lectureId}")
    public String viewLecture(@PathVariable("lectureId") long lectureId,
                       ModelMap model)
            throws LectureNotFound {
        Lecture lecture = lectureService.getLecture(lectureId);
        List<Comment> comments = commentService.getUndeletedCommentsByLectureId(lectureId);

        // Append comments after fetching
        lecture.setComments(comments);

        model.addAttribute("lectureId", lectureId);
        model.addAttribute("lecture", lecture);
        model.addAttribute("comments", comments);
        return "viewLecture";
    }

    @GetMapping("/edit/{lectureId}")
    public ModelAndView editLecture(@PathVariable("lectureId") long lectureId,
                            Principal principal, HttpServletRequest request)
        throws LectureNotFound {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null
            || (!request.isUserInRole("ROLE_ADMIN")
        && !principal.getName().equals(lecture.getTeacherName()))){
            return new ModelAndView(new RedirectView("/index", true));
        }

        ModelAndView modelAndView = new ModelAndView("editLecture");
        modelAndView.addObject("lecture", lecture);

        LectureForm lectureForm = new LectureForm();
        lectureForm.setLectureTitle(lecture.getLectureTitle());
        lectureForm.setBody(lecture.getBody());
        modelAndView.addObject("lectureForm", lectureForm);

        return modelAndView;
    }

    @PostMapping("/edit/{lectureId}")
    public String editLecture(@PathVariable("lectureId") long lectureId, LectureForm form,
                            Principal principal, HttpServletRequest request)
        throws LectureNotFound , IOException {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null
        || (!request.isUserInRole("ROLE_ADMIN")
        && !principal.getName().equals(lecture.getTeacherName()))){
            return "redirect:/index/lecture/view/";
        }
        lectureService.updateLecture(lectureId, form.getLectureTitle(),
                form.getBody(), form.getNotes());
        return "redirect:/index/lecture/view/" + lectureId;
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
        return "redirect:/index";
    }

    @GetMapping("/{lectureId}/delete/{note:.+}")
    public String deleteNote(@PathVariable("lectureId") long lectureId,
                             @PathVariable("note") UUID noteId)
            throws NoteNotFound, LectureNotFound {
        lectureService.deleteNote(lectureId, noteId);
        return "redirect:/lecture/lecture_view/" + lectureId;
    }

}
