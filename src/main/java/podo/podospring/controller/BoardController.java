package podo.podospring.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.cassandra.CassandraProperties.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import podo.podospring.service.BoardService;

@Controller
public class BoardController {
    private static final Logger logger =
            LoggerFactory.getLogger(BoardController.class);

    private BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @ResponseBody
    @RequestMapping("/getBoardList")
    public HashMap<String, Object> getBoardList(@RequestParam HashMap<String, Object> params) {
        params.put("sType",params.get("type"));
        HashMap<String, Object> result = boardService.getBoardList(params);

        return result;
    }

    @ResponseBody
    @RequestMapping("/getBoardDetail")
    public HashMap<String, Object> getBoardDetail(@RequestParam HashMap<String, Object> params) {
        params.put("sType",params.get("type"));
        params.put("sIdx",params.get("idx"));
        HashMap<String, Object> result = boardService.getBoardDetail(params);


        return result;
    }

    @ResponseBody
    @RequestMapping("/writeBoard")
    public HashMap<String, Object> writeBoard(@RequestParam HashMap<String, Object> params, HttpSession session, MultipartHttpServletRequest files, HttpServletRequest request) {
//
//      TODO 파일 업로드 기능 구현
        String uploadFolder = "C:\\test\\upload";
//        List<MultipartFile> list = files.getFiles("files");
        java.util.Iterator<String> fileNames =  files.getFileNames();

        while(fileNames.hasNext())
        {
            String fileName = fileNames.next();
            MultipartFile mFile = files.getFile(fileName);
            System.out.println(fileName);
        }



        params.put("actionFlag",params.get("flag"));
        params.put("sType",params.get("type"));
        params.put("title",params.get("txtTitle"));
        params.put("content",params.get("txtContent"));
        String staff = (String)session.getAttribute("USER_STAFF");
        params.put("staff",params.get(staff));

        if ("6" == params.get("sType")) {
            staff = (String)session.getAttribute("MS_NUM");
        }
        if (null == params.get("bkPerson")) {
            params.put("bkPerson","0");
        }

        String fileName1, fileName2, fileName3;
        String originFileName1, originFileName2, originFileName3;
        String filePath1, filePath2, filePath3;



//        boardService.writeBoard(params);

//        params.put("resultCode","0000");

        return null;
    }

}
