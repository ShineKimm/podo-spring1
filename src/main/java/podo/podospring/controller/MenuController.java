package podo.podospring.controller;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MenuController {

    @GetMapping("/board/list")
    public String boardList() {
        System.out.println("공지사항 컨트롤러");
//        List<HashMap<String, Object>> list = boardService.boardList(params);
//        model.addAttribute("list",list);
        return "/board/list";
    }

    @GetMapping("/index")
    public String index() {
        return "/index";
    }
    @GetMapping("/guide/reserGuide")
    public String reserGuide() {
        return "/guide/reserGuide";
    }
    @GetMapping("/board/honor")
    public String honor() {
        return "/board/honor";
    }
    @GetMapping("/guide/fee")
    public String fee() {
        return "/guide/fee";
    }
    @GetMapping("/guide/break")
    public String break_1() {
        return "/guide/break";
    }
    @GetMapping("/guide/etiquette")
    public String etiquette() {
        return "/guide/etiquette";
    }
    @GetMapping("/guide/inquiry")
    public String inquiry() {
        return "/guide/inquiry";
    }
    @GetMapping("/club/intro")
    public String intro() {
        return "/club/intro";
    }
    @GetMapping("/club/greeting")
    public String greeting() {
        return "/club/greeting";
    }
    @GetMapping("/course/intro")
    public String courseIntro() {
        return "/course/intro";
    }
    @GetMapping("/fac/fac01")
    public String fac01() {
        return "/fac/fac01";
    }
    @GetMapping("/fac/fac02")
    public String fac02() {
        return "/fac/fac02";
    }
    @GetMapping("/fac/fac03")
    public String fac03() {
        return "/fac/fac03";
    }
    @GetMapping("/fac/fac04")
    public String fac04() {
        return "/fac/fac04";
    }

    @GetMapping("/reservation/joinList")
    public String joinList() {
        return "/reservation/joinList";
    }
    @GetMapping("/admin/member/login")
    public String adminLogin() {
        return "/admin/member/login";
    }
    @GetMapping("/admin/index")
    public String adminIndex() {
        return "/admin/index";
    }

    @GetMapping("/admin")
    public String adminIndex_1() {
        return "/admin/index";
    }


}
