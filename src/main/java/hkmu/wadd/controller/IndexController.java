package hkmu.wadd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
    @GetMapping({"/", "/index"}) // 统一处理根路径和/index路径
    public String index() {
        return "index"; // 返回统一的index.jsp
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }
}
