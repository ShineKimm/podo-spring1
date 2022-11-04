package podo.podospring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import podo.podospring.service.BoardService;

@Controller
public class HomeController {

    private BoardService boardService;

    public HomeController(BoardService boardService) {
        this.boardService = boardService;
    }

    @GetMapping("/")
    public String index() {
        return "index";
    }


    @RequestMapping("/t_board")
    public String home(Model model, Map<String, Object> params) {

        //List<HashMap<String, Object>> list = sampleService.selectTest(null);

        List<HashMap<String, Object>> list = boardService.boardList(params);

        model.addAttribute("list",list );

        return "board/t_board";
    }

}
