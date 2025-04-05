package hkmu.wadd.controller;

import hkmu.wadd.dao.PollService;
import hkmu.wadd.exception.PollNotFound;
import hkmu.wadd.model.Poll;
import jakarta.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Controller
@RequestMapping("/poll")
public class PollController {

    @Resource
    private PollService pollService;

    private volatile long POLL_ID_SEQUENCE = 1;
    private Map<Long, Poll> pollDatabase = new ConcurrentHashMap<>();

    private static final Logger log = LoggerFactory.getLogger(PollController.class);

    @GetMapping(value = {"", "/poll"})
    public String pollList(ModelMap model) {
        model.addAttribute("pollDatabase", pollService.getPolls());
        return "pollList";
    }

    @GetMapping("/create")
    public ModelAndView createPoll() {
        return new ModelAndView("poll_add", "pollForm", new Poll());
    }

    @PostMapping("/create")
    public View create(Form form) throws IOException {
        long pollId = pollService.createPoll(form.getQuestion(), form.getAuthor(), form.getOptionA(), form.getOptionB(), form.getOptionC(), form.getOptionD());
        return new RedirectView("/poll/pollList/" + pollId, true);
    }

    @GetMapping("/view/{pollId}")
    public String view(@PathVariable("pollId") long pollId, ModelMap model) throws PollNotFound {
        Poll poll = pollService.getPoll(pollId);
        model.addAttribute("pollId", pollId);
        model.addAttribute("poll", poll);
        return "poll_view";
    }

    @ExceptionHandler({PollNotFound.class})
    public ModelAndView error(Exception e) {
        return new ModelAndView("error", "message", e.getMessage());
    }

    @GetMapping("/delete/{pollId}")
    public String deletePoll(@PathVariable("pollId") long pollId) throws PollNotFound {
        pollService.delete(pollId);
        return "redirect:/index/poll";
    }

    @PostMapping("/vote/{pollId}")
    public String vote(@PathVariable("pollId") Long pollId,
                       @RequestParam("userId") String userId,
                       @RequestParam("choice") String choice,
                       ModelMap model) {
        pollService.vote(pollId, userId, choice);

        return "redirect:/poll/pollList/" + pollId; // Adjust as needed
    }

    private synchronized long getNextTicketPollId() {
        return this.POLL_ID_SEQUENCE++;
    }

    public static class Form {
        private String question,
                author,
                optionA,
                optionB,
                optionC,
                optionD,
                comment;

        public String getQuestion() {
            return question;
        }

        public void setQuestion(String question) {
            this.question = question;
        }

        public String getAuthor() {
            return author;
        }

        public void setAuthor(String author) {
            this.author = author;
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
