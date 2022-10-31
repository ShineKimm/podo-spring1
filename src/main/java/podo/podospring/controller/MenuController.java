package podo.podospring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuController {
    @GetMapping("/guide/reserGuide")
    public String reserGuide() {
        return "guide/reserGuide";
    }
}
