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

//    @RequestMapping("/board/list")
//    public String notice(Model model, Map<String, Object> params) {
//        System.out.println("공지사항 컨트롤러");
//        List<HashMap<String, Object>> list = boardService.boardList(params);
//
//        model.addAttribute("list",list );
//        return "board/list";
//    }

    @RequestMapping("/controller/getBoardList")
    @ResponseBody
    public List<HashMap<String, Object>> getBoardList(HttpServletRequest request, @RequestParam HashMap<String, Object> params) {
//        String coDiv = request.getParameter("coDiv");
//        String sType = request.getParameter("type");
        String boardDiv = request.getParameter("boardDiv");
        String stDate = request.getParameter("stDate");
        String edDate = request.getParameter("edDate");
//        String startCnt = request.getParameter("startCnt");
//        String pageCnt = request.getParameter("pageCnt");
        String searchText = request.getParameter("searchText");
        String searchOption = request.getParameter("searchOption");
        String adminYn = request.getParameter("adminYn");

//        params.put("coDiv", coDiv);
//        params.put("sType", sType);
        params.put("boardDiv", boardDiv);
        params.put("stDate", stDate);
        params.put("edDate", edDate);
//        params.put("startCnt", startCnt);
//        params.put("pageCnt", pageCnt);
        params.put("searchText", searchText);
        params.put("searchOption", searchOption);
        params.put("adminYn", adminYn);

        List<HashMap<String, Object>> result = boardService.getBoardList(params);
        System.out.println("게시판 리스트 출력 완료");

        return result;
    }

}
