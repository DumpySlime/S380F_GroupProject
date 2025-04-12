package hkmu.wadd.controller;

import hkmu.wadd.dao.LectureService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexController {
    @Resource
    private LectureService lectureService;

    // Redirect to lecture list
    @GetMapping(value = {"/", "/index"})
    public String list(ModelMap model) {
        model.addAttribute("lectureDatabase", lectureService.getLectures());
        return "index";
    }

    // Show login page
    @GetMapping("/login")
    public String login() {
        return "login";
    }

}
