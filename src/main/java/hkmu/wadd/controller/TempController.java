package hkmu.wadd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TempController {
    @GetMapping("/poll/temp")
    public String get(){
        return "a_secret_page";
    }

}
