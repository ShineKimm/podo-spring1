package podo.podospring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "home";
    }
    //test
    //test2222
    //test333
    //test4444
    //test555
    //test555
    //test555
    //test666
    //test777
    //test888

}
