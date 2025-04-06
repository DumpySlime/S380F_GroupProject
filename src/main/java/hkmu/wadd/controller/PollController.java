package hkmu.wadd.controller;

import hkmu.wadd.dao.PollService;
import hkmu.wadd.exception.PollNotFound;
import hkmu.wadd.model.Poll;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;

@Controller
@RequestMapping("/poll")
public class PollController {

    // --- Poll Related ---
    @Resource
    private PollService pollService;

    private volatile long POLL_ID_SEQUENCE = 1;

    @GetMapping("/create")
    public ModelAndView createPoll() {
        return new ModelAndView("poll_add", "pollForm", new PollForm());
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

    @PostMapping("/create")
    public View createPoll(PollForm pollForm) throws IOException {
        long pollId = pollService.createPoll(pollForm.getQuestion(), pollForm.getOptionA(),
                pollForm.getOptionB(), pollForm.getOptionC(), pollForm.getOptionD(), pollForm.getComment());
        return new RedirectView("/view/" + pollId, true);
    }

    @GetMapping("/view/{pollId}")
    public String viewPoll(@PathVariable("pollId") long pollId, ModelMap model) throws PollNotFound {
        Poll poll = pollService.getPoll(pollId);
        model.addAttribute("pollId", pollId);
        model.addAttribute("poll", poll);
        return "poll_view";
    }

    @GetMapping("/delete/{pollId}")
    public String deletePoll(@PathVariable("pollId") long pollId) throws PollNotFound {
        pollService.delete(pollId);
        return "redirect:/course/index";
    }

    @GetMapping("/edit/{pollId}")
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

    @PostMapping("/vote/{pollId}")
    public String vote(@PathVariable("pollId") Long pollId,
                       @RequestParam("userId") String userId,
                       @RequestParam("choice") String choice,
                       ModelMap model) {
        pollService.vote(pollId, userId, choice);

        return "redirect:/poll_view/" + pollId; // Adjust as needed
    }

    private synchronized long getNextTicketPollId() {
        return this.POLL_ID_SEQUENCE++;
    }

}
