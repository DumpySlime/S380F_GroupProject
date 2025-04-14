package hkmu.wadd.controller;

import hkmu.wadd.dao.CommentService;
import hkmu.wadd.dao.PollService;
import hkmu.wadd.dao.VoteRepository;
import hkmu.wadd.dao.VoteService;
import hkmu.wadd.exception.PollNotFound;
import hkmu.wadd.exception.VoteNotFound;
import hkmu.wadd.model.Comment;
import hkmu.wadd.model.Poll;
import hkmu.wadd.model.Vote;
//import hkmu.wadd.model.VoteId;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/index/poll")
public class PollController {
    @Resource
    private PollService pollService;
    @Resource
    private CommentService commentService;
    @Resource
    private VoteService voteService;
    @Autowired
    private VoteRepository voteRepository;

    @GetMapping("/create")
    public ModelAndView createPoll() {return new ModelAndView("addPoll", "pollForm", new PollForm());};

    public static class PollForm {
        private String question;
        private String optionAText;
        private String optionBText;
        private String optionCText;
        private String optionDText;

        public String getQuestion() {
            return question;
        }

        public void setQuestion(String question) {
            this.question = question;
        }

        public String getOptionAText() {
            return optionAText;
        }

        public void setOptionAText(String optionAText) {
            this.optionAText = optionAText;
        }

        public String getOptionBText() {
            return optionBText;
        }

        public void setOptionBText(String optionBText) {
            this.optionBText = optionBText;
        }

        public String getOptionCText() {
            return optionCText;
        }

        public void setOptionCText(String optionCText) {
            this.optionCText = optionCText;
        }

        public String getOptionDText() {
            return optionDText;
        }

        public void setOptionDText(String optionDText) {
            this.optionDText = optionDText;
        }
    }

    @PostMapping("/create")
    public View createPoll(PollForm pollForm, Principal principal) throws IOException {
        long pollId = pollService.createPoll(pollForm.getQuestion(), principal.getName(),
                pollForm.getOptionAText(), pollForm.getOptionBText(), pollForm.getOptionCText(), pollForm.getOptionDText());
        return new RedirectView("/index");
    }

    public static class VoteForm {
        private String choice;
        public String getChoice() {
            return choice;
        }
        public void setChoice(String choice) {
            this.choice = choice;
        }
    }

    @GetMapping("/vote/{pollId}")
    public ModelAndView votePoll(@PathVariable("pollId") long pollId, Principal principal, Model model)
        throws PollNotFound, VoteNotFound {
        String username = principal.getName();
        Poll poll = pollService.getPollById(pollId);
        if (poll == null) {
            return new ModelAndView(new RedirectView("/index", true));
        }
        VoteForm voteForm = new VoteForm();
        Vote userVote = voteService.getUserVote(username, pollId);
        if (userVote != null) {
            voteForm.setChoice(userVote.getChoice());
        }
        List<Comment> comments = commentService.getUndeletedCommentsByPollId(pollId);
        poll.setComments(comments);

        int a = 0, b = 0, c = 0, d = 0;
        List<Vote> votes = poll.getVotes();
        for (Vote vote : votes) {
            switch (vote.getChoice()) {
                case "A":
                    a++;
                    break;
                case "B":
                    b++;
                    break;
                case "C":
                    c++;
                    break;
                case "D":
                    d++;
                    break;
            }
        }

        ModelAndView modelAndView = new ModelAndView("viewPoll");
        modelAndView.addObject("poll", poll);
        modelAndView.addObject("comments", comments);
        modelAndView.addObject("voteForm", voteForm);
        modelAndView.addObject("choiceACount", a);
        modelAndView.addObject("choiceBCount", b);
        modelAndView.addObject("choiceCCount", c);
        modelAndView.addObject("choiceDCount", d);
        return modelAndView;
    }

    @PostMapping("/vote/{pollId}")
    public String votePoll(@PathVariable("pollId") long pollId, @RequestParam("choice") String choice, Principal principal)
            throws PollNotFound, VoteNotFound {
        String username = principal.getName();
        Poll poll = pollService.getPollById(pollId);

        if (poll == null) {
            return "redirect:/index";
        }

        Vote existingVote = voteService.getUserVote(username, pollId);
        if (existingVote != null) {
            existingVote.setChoice(choice);
            voteRepository.save(existingVote);
        } else {
            voteService.addVoteToPoll(username, pollId, choice);
        }
        return "redirect:/index";
    }

    @GetMapping("/edit/{pollId}")
    public ModelAndView editPoll(@PathVariable("pollId") long pollId, Principal principal, HttpServletRequest request)
        throws PollNotFound {
        Poll poll = pollService.getPollById(pollId);
        if (poll == null || (!request.isUserInRole("ROLE_ADMIN")
                && !principal.getName().equals(poll.getTeacherName()))) {
            return new ModelAndView(new RedirectView("/index", true));
        }
        ModelAndView modelAndView = new ModelAndView("editPoll");
        modelAndView.addObject("poll", poll);

        PollForm pollForm = new PollForm();
        pollForm.setQuestion(poll.getQuestion());
        pollForm.setOptionAText(poll.getOptionAText());
        pollForm.setOptionBText(poll.getOptionBText());
        pollForm.setOptionCText(poll.getOptionCText());
        pollForm.setOptionDText(poll.getOptionDText());
        modelAndView.addObject("pollForm", pollForm);

        return modelAndView;
    }

    @PostMapping("/edit/{pollId}")
    public String editPoll(@PathVariable("pollId") long pollId, PollForm pollForm,
                           Principal principal, HttpServletRequest request) throws PollNotFound, IOException {
        Poll poll = pollService.getPollById(pollId);
        if (poll == null || (!request.isUserInRole("ROLE_ADMIN")
                && !principal.getName().equals(poll.getTeacherName()))) {
            return "redirect:/index";
        }
        pollService.updatePoll(pollId, pollForm.getQuestion(), pollForm.getOptionAText(),
                pollForm.getOptionBText(), pollForm.getOptionCText(), pollForm.getOptionDText());
        return "redirect:/index";
    }

    @GetMapping("/delete/{pollId}")
    public String deletePoll(@PathVariable("pollId") long pollId)
        throws PollNotFound{
        Poll poll = pollService.getPollById(pollId);
        if (poll == null) {
            throw new PollNotFound(pollId);
        }
        pollService.deletePoll(pollId);
        return "redirect:/index";
    }
}
