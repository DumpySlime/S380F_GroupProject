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

    @GetMapping(value = {"", "/pollList"})
    public String pollList(ModelMap model) {
        model.addAttribute("pollDatabase", pollService.getPolls());
        return "pollList";
    }

    @GetMapping("/create")
    public ModelAndView createPoll() {
        return new ModelAndView("addPoll", "pollForm", new Poll());
    }

    @PostMapping("/create")
    public View create(Form form) throws IOException {
        long pollId = pollService.createPoll(form.getQuestion(), form.getAuthor(), form.getOption1(), form.getOption2(), form.getOption3(), form.getOption4());
        return new RedirectView("/poll/pollList" + pollId, true);
    }

    @GetMapping("/poll/{pollId}")
    public String view(@PathVariable("pollId") long pollId, ModelMap model) throws PollNotFound {
        Poll poll = pollService.getPoll(pollId);
        model.addAttribute("pollId", pollId);
        model.addAttribute("poll", poll);
        return "viewPoll";
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

    private synchronized long getNextTicketPollId() {
        return this.POLL_ID_SEQUENCE++;
    }

    public static class Form {
        private String question,
                author,
                option1,
                option2,
                option3,
                option4;

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

        public String getOption1() {
            return option1;
        }

        public void setOption1(String option1) {
            this.option1 = option1;
        }

        public String getOption2() {
            return option2;
        }

        public void setOption2(String option2) {
            this.option2 = option2;
        }

        public String getOption3() {
            return option3;
        }

        public void setOption3(String option3) {
            this.option3 = option3;
        }

        public String getOption4() {
            return option4;
        }

        public void setOption4(String option4) {
            this.option4 = option4;
        }
    }
}
