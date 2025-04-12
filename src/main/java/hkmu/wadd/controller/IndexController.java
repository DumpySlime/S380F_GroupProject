package hkmu.wadd.controller;

import hkmu.wadd.dao.LectureService;
import hkmu.wadd.dao.PollService;
import hkmu.wadd.dao.UserManagementService;
import hkmu.wadd.dao.VoteService;
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

    // Redirect to lecture list
    @GetMapping(value = {"", "/index"})
    public String list(ModelMap model) {
        model.addAttribute("lectureDatabase", lectureService.getLectures());
        model.addAttribute("pollDatabase", pollService.getUndeletedPolls());
        return "index";
    }

    @GetMapping("/index/votinghistory")
    public String votingHistory(Principal principal, ModelMap model) {
        String username = principal.getName();
        List<Vote> votingHistory = voteService.getUserVotingHistory(username);
        model.addAttribute("votingHistory", votingHistory);
        return "votingHistory";
    }

    // Show login page
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @Resource
    UserManagementService userManagementService;

    public static class Form {
        private String username;
        private String password;
        private String fullName;
        private String email;
        private String phone;
        private String[] roles;

        // Getters and setters
        public String getUsername() { return username; }
        public void setUsername(String username) { this.username = username; }
        public String getPassword() { return password; }
        public void setPassword(String password) { this.password = password; }
        public String getFullName() { return fullName; }
        public void setFullName(String fullName) {this.fullName = fullName;}
        public String getEmail() {return email;}
        public void setEmail(String email) {this.email = email;}
        public String getPhone() {return phone;}
        public void setPhone(String phone) {this.phone = phone;}
        public String[] getRoles() {return roles;}
        public void setRoles(String[] roles) {this.roles = roles;
        }
    }

}
