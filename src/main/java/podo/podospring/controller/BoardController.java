package podo.podospring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.boot.autoconfigure.cassandra.CassandraProperties.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import podo.podospring.service.BoardService;

@Controller
public class BoardController {

    private BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @ResponseBody
    @RequestMapping("/getBoardList")
    public List<HashMap<String, Object>> getBoardList(@RequestParam HashMap<String, Object> params) {

        List<HashMap<String, Object>> result = boardService.getBoardList(params);
        System.out.println("게시판 리스트 출력 완료");


        return result;
    }

}
