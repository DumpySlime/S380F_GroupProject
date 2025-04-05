package hkmu.wadd.controller;

import hkmu.wadd.dao.LectureService;
import hkmu.wadd.dao.PollService;
import hkmu.wadd.exception.LectureNotFound;
import hkmu.wadd.exception.NoteNotFound;
import hkmu.wadd.exception.PollNotFound;
import hkmu.wadd.model.Lecture;
import hkmu.wadd.model.Note;
import hkmu.wadd.model.Poll;
import hkmu.wadd.view.DownloadingView;
import jakarta.annotation.Resource;
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

    //private static final Logger log = LoggerFactory.getLogger(LectureController.class);
    @Resource
    private LectureService lectureService;

    // Controller methods, Form-backing object, ...
    @GetMapping(value = {"", "/index"})
    public String index(ModelMap model) {
        model.addAttribute("lectureDatabase", lectureService.getLectures());
        model.addAttribute("pollDatabase", pollService.getPolls());
        return "index";
    }

    // --- Lecture Related ---
    // Create Lecture object
    @GetMapping("/lecture/create")
    public ModelAndView createLecture() {
        return new ModelAndView("lecture_add", "lectureForm", new LectureForm());
    }

    public static class LectureForm {
        private String lectureTitle;
        private String comment;
        private List<MultipartFile> notes;

        public String getLectureTitle() {
            return lectureTitle;
        }

        public void setLectureTitle(String lectureTitle) {
            this.lectureTitle = lectureTitle;
        }

        public String getComment() {
            return comment;
        }

        public void setComments(String comment) {
            this.comment = comment;
        }

        public List<MultipartFile> getNotes() {
            return notes;
        }

        public void setNotes(List<MultipartFile> notes) {
            this.notes = notes;
        }
    }


    @PostMapping("/lecture/create")
    public View createLecture(LectureForm lectureForm) throws IOException {
        long lectureId = lectureService.createLecture(
                lectureForm.getLectureTitle(), lectureForm.getComment(), lectureForm.getNotes());
        return new RedirectView("/course/lecture/view/" + lectureId, true);
    }

    @GetMapping("/lecture/view/{lectureId}")
    public String viewLecture(@PathVariable("lectureId") long lectureId,
                       ModelMap model)
            throws LectureNotFound {
        Lecture lecture = lectureService.getLecture(lectureId);
        model.addAttribute("lectureId", lectureId);
        model.addAttribute("lecture", lecture);
        return "lecture_view";
    }

    @GetMapping("/lecture/edit/{lectureId}")
    public ModelAndView editLecture(@PathVariable("lectureId") long lectureId)
        throws LectureNotFound {
        Lecture lecture = lectureService.getLecture(lectureId);
        if (lecture == null) {
            return new ModelAndView(new RedirectView("/course/index", true));
        }
        ModelAndView modelAndView = new ModelAndView("lecture_edit");
        modelAndView.addObject("lecture", lecture);

        LectureForm lectureForm = new LectureForm();
        lectureForm.setLectureTitle(lecture.getLectureTitle());
        modelAndView.addObject("lectureForm", lectureForm);

        return modelAndView;
    }

    // Downloading lecture note
    @GetMapping("/lecture/{lectureId}/note/{note:.+}")
    public View download(@PathVariable("lectureId") long lectureId,
                         @PathVariable("note") UUID noteId)
            throws LectureNotFound, NoteNotFound {
        Note note = lectureService.getNote(lectureId, noteId);
        return new DownloadingView(note.getName(),
                note.getMimeContentType(), note.getContents());
    }

    @GetMapping("/lecture/delete/{lectureId}")
    public String deleteLecture(@PathVariable("lectureId") long lectureId)
            throws LectureNotFound {
        lectureService.delete(lectureId);
        return "redirect:/course/index";
    }

    @GetMapping("/lecture/{courseId}/delete/{note:.+}")
    public String deleteNote(@PathVariable("lectureId") long lectureId,
                             @PathVariable("note") UUID noteId)
            throws NoteNotFound, LectureNotFound {
        lectureService.deleteNote(lectureId, noteId);
        return "redirect:/lecture/lecture_view/" + lectureId;
    }

    // --- Poll Related ---
    @Resource
    private PollService pollService;

    private volatile long POLL_ID_SEQUENCE = 1;

    @GetMapping("/poll/create")
    public ModelAndView createPoll() {
        return new ModelAndView("poll_add", "pollForm", new PollForm());
    }

    @PostMapping("/poll/create")
    public View createPoll(CourseController.PollForm pollForm) throws IOException {
        long pollId = pollService.createPoll(pollForm.getQuestion(), pollForm.getOptionA(), pollForm.getOptionB(), pollForm.getOptionC(), pollForm.getOptionD(), pollForm.getComment());
        return new RedirectView("/course/poll/view/" + pollId, true);
    }

    @GetMapping("/poll/view/{pollId}")
    public String viewPoll(@PathVariable("pollId") long pollId, ModelMap model) throws PollNotFound {
        Poll poll = pollService.getPoll(pollId);
        model.addAttribute("pollId", pollId);
        model.addAttribute("poll", poll);
        return "poll_view";
    }

    @GetMapping("/poll/delete/{pollId}")
    public String deletePoll(@PathVariable("pollId") long pollId) throws PollNotFound {
        pollService.delete(pollId);
        return "redirect:/course/index";
    }

    @GetMapping("/poll/edit/{pollId}")
    public ModelAndView editPoll(@PathVariable("pollId") long pollId)
            throws PollNotFound {
        Poll poll = pollService.getPoll(pollId);
        if (poll == null) {
            return new ModelAndView(new RedirectView("/course/index", true));
        }
        ModelAndView modelAndView = new ModelAndView("poll_edit");
        modelAndView.addObject("lecture", poll);

        PollForm pollForm = new PollForm();
        pollForm.setQuestion(poll.getQuestion());
        pollForm.setOptionA(poll.getOptionA());
        pollForm.setOptionB(poll.getOptionB());
        pollForm.setOptionC(poll.getOptionC());
        pollForm.setOptionD(poll.getOptionD());
        pollForm.setComment(poll.getComment());
        modelAndView.addObject("pollForm", pollForm);

        return modelAndView;
    }

    @PostMapping("/poll/vote/{pollId}")
    public String vote(@PathVariable("pollId") Long pollId,
                       @RequestParam("userId") String userId,
                       @RequestParam("choice") String choice,
                       ModelMap model) {
        pollService.vote(pollId, userId, choice);

        return "redirect:/course/poll/poll_view/" + pollId; // Adjust as needed
    }

    private synchronized long getNextTicketPollId() {
        return this.POLL_ID_SEQUENCE++;
    }

    public static class PollForm {
        private String question,
                optionA,
                optionB,
                optionC,
                optionD;
        private String comment;

        public String getQuestion() {
            return question;
        }

        public void setQuestion(String question) {
            this.question = question;
        }

        public String getOptionA() {
            return optionA;
        }

        public void setOptionA(String optionA) {
            this.optionA = optionA;
        }

        public String getOptionB() {
            return optionB;
        }

        public void setOptionB(String optionB) {
            this.optionB = optionB;
        }

        public String getOptionC() {
            return optionC;
        }

        public void setOptionC(String optionC) {
            this.optionC = optionC;
        }

        public String getOptionD() {
            return optionD;
        }

        public void setOptionD(String optionD) {
            this.optionD = optionD;
        }

        public String getComment() {
            return comment;
        }

        public void setComment(String comment) {
            this.comment = comment;
        }
    }
}
