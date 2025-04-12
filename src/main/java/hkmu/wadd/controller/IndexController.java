package hkmu.wadd.controller;

import hkmu.wadd.dao.*;
import hkmu.wadd.model.Comment;
import hkmu.wadd.model.Vote;
import jakarta.annotation.Resource;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/")
public class IndexController {
    @Resource
    private LectureService lectureService;
    @Resource
    private PollService pollService;
    @Resource
    private VoteService voteService;
    @Resource
    private CommentService commentService;
    // Redirect to lecture list
    @GetMapping(value = {"/", "/index"})
    public String list(ModelMap model) {
        model.addAttribute("lectureDatabase", lectureService.getLectures());
        model.addAttribute("pollDatabase", pollService.getUndeletedPolls());
        return "index";
    }

    // Show Voting History
    @GetMapping("/index/votinghistory")
    public String votingHistory(Principal principal, ModelMap model) {
        String username = principal.getName();
        List<Vote> votingHistory = voteService.getUserVotingHistory(username);
        model.addAttribute("votingHistory", votingHistory);
        return "votingHistory";
    }

    // Show Comment History
    @GetMapping("/index/commenthistory")
    public String commentHistory(Principal principal, ModelMap model) {
        String username = principal.getName();
        List<Comment> commentHistory = commentService.getUserCommentHistory(username);
        model.addAttribute("commentHistory", commentHistory);
        return "commentHistory";
    }

    // Show login page
    @GetMapping("/login")
    public String login() {
        return "login";
    }
}
