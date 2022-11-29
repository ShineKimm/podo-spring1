package podo.podospring.controller;

import java.io.File;
import java.io.IOException;
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

        java.util.Iterator<String> fileNames =  files.getFileNames();
        while(fileNames.hasNext())
        {
            String fileName = fileNames.next();
            MultipartFile mFile = files.getFile(fileName);
            File file = new File("C:\\dev\\podo-spring\\src\\main\\webapp\\WEB-INF\\views\\uploads\\"+"test222.txt");
            System.out.println(fileName);
            if (mFile.getSize()!=0) {
                if (! file.exists()) { // 경로상 파일이 존재하지 않을 경우
                    if (file.getParentFile().mkdirs()) { // 경로에 해당하는 디렉토리들을 생성
                        try {
                            file.createNewFile(); //이후 파일 생성
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
                try {
                    mFile.transferTo(file); //임시로 저장된 multipartFile을 실제 파일로 전송
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        params.put("actionFlag",params.get("flag"));
        params.put("coDiv",params.get("coDiv"));
        params.put("sType",params.get("type"));
        params.put("title",params.get("txtTitle"));
        params.put("content",params.get("txtContent"));
        params.put("boardDiv",params.get("boardDiv"));
        params.put("joinStatus",params.get("joinStatus"));
        params.put("bkDay",params.get("bkDay"));
        params.put("bkTime",params.get("bkTime"));
        params.put("bkPerson",params.get("bkPerson"));
        params.put("phone1",params.get("phone1"));
        params.put("phone2",params.get("phone2"));
        params.put("phone3",params.get("phone3"));
        params.put("link",params.get("link"));
        params.put("timeStamp",params.get("timeStamp"));
        params.put("ipAddr",params.get("ip"));
        String staff = (String)session.getAttribute("USER_STAFF");
        params.put("staff",staff);
        String sType = (String)params.get("sType");

        if (sType.equals("6")) {
            staff = (String)session.getAttribute("MS_NUM");
            params.put("staff",staff);
        }
        if (null == params.get("bkPerson")) {
            params.put("bkPerson","0");
        }
        String fileName1, fileName2, fileName3;
        String originFileName1, originFileName2, originFileName3;
        String filePath1, filePath2, filePath3;

//        for each fileKey in Upload.UploadedFiles.keys
//                fileName = Upload.UploadedFiles(fileKey).FileName
//        extension = Mid(fileName, InStrRev(fileName, "."))
//        timeStamp = timeStamp + 1
//        newFileName = CSTR(timeStamp) & extension
//        If fileKey = "fileupload1" Then
//                fileName1 = newFileName
//        originFileName1 = fileName
//        filePath1 = "/uploads/" & currentDate
//        ElseIf fileKey = "fileupload2" Then
//                fileName2 = newFileName
//        originFileName2 = fileName
//        filePath2 = "/uploads/" & currentDate
//        ElseIf fileKey = "fileupload3" Then
//                fileName3 = newFileName
//        originFileName3 = fileName
//        filePath3 = "/uploads/" & currentDate
//        End If
//
//        oldFilePath = filePath & "\" & fileName
//        newFilePath = filePath & "\" & newFileName
//
//        Dim fso2 : set fso2 = server.createobject("scripting.filesystemobject")
//        fso2.copyfile oldFilePath, newFilePath
//        fso2.deletefile(oldFilePath)
//        set fso2 = nothing
//        next

        boardService.writeBoard(params);

        return params;
    }

    @ResponseBody
    @RequestMapping("/doDelete")
    public HashMap<String, Object> doDelete(@RequestParam HashMap<String, Object> params) {
        params.put("coDiv",params.get("coDiv"));
        params.put("sType",params.get("type"));
        params.put("sIdx",params.get("idx"));
        params.put("sDiv",params.get("div"));
        if (params.get("sDiv") == null) {
            params.put("1",params.get("sDiv"));
        }
        params = boardService.doDelete(params);



        return params;
    }

    @ResponseBody
    @RequestMapping("/getJoinList")
    public HashMap<String, Object> getJoinList(@RequestParam HashMap<String, Object> params) {
        params.put("coDiv",params.get("coDiv"));
        params.put("sType",params.get("type"));
        params.put("stDate",params.get("stDate"));
        params.put("edDate",params.get("edDate"));
        params.put("startCnt",params.get("startCnt"));
        params.put("pageCnt",params.get("pageCnt"));
        params.put("searchText",params.get("searchText"));
        params.put("searchOption",params.get("searchOption"));

        params = boardService.getJoinList(params);



        return params;
    }

    @ResponseBody
    @RequestMapping("/getReplyList")
    public HashMap<String, Object> getReplyList(@RequestParam HashMap<String, Object> params) {
        params.put("coDiv",params.get("coDiv"));
        params.put("sType",params.get("type"));
        params.put("sIdx",params.get("idx"));

        params = boardService.getReplyList(params);



        return params;
    }

    @ResponseBody
    @RequestMapping("/doDeleteReply")
    public HashMap<String, Object> doDeleteReply(@RequestParam HashMap<String, Object> params) {
        params.put("coDiv",params.get("coDiv"));
        params.put("sType",params.get("type"));
        params.put("sIdx",params.get("idx"));
        params.put("sSeq",params.get("seq"));

        params = boardService.doDeleteReply(params);
        return params;
    }



}
