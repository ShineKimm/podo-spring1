package podo.podospring.controller;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import podo.podospring.service.MemberService;

//' Member API (method)
//        ' doLogin 			  : 로그인
//        ' doLogout			  : 로그아웃
//        ' chkDuplicateId  : 아이디 중복체크
//        ' doSignUp 			  : 회원 가입
//        ' doUpdateMemeber : 회원 정보 수정
//        ' doFindId				: 아이디 찾기
//        ' doFindPw				: 비밀번호 찾기
//        ' doDeleteMemeber : 회원 탈퇴
//        ' doCertification : 인증번호 전송
//        ' getVisitList		: 내장내역 조회
//        ' getScoreList		: 스코어정보 조회
//        ' getCouponList		: 쿠폰조회

@Controller
public class MemberController {
    private MemberService memberService;


    @Autowired
    public MemberController(MemberService memberService) {
        this.memberService = memberService;

    }

    @ResponseBody
    @RequestMapping("/doLogin")
    public Map<String, Object> doLogin(@RequestParam HashMap<String, Object> params, HttpSession session)
            throws NoSuchAlgorithmException {

        //System.out.println("session.getId() = " + session.getId());
        params.put("sessionID", session.getId());
        Map<String, Object> resultMap = memberService.doLogin(params);

        return resultMap;
    }

    @ResponseBody
    @RequestMapping("/doLogout")
    public Map<String, Object> doLogout(@RequestParam HashMap<String, Object> params, HttpSession session) {

        session.invalidate();
        params.put("resultCode","0000");

        return params;
    }

    @ResponseBody
    @RequestMapping("/chkDuplicateId")
    public Map<String, Object> chkDuplicateId(@RequestParam HashMap<String, Object> params) {

        Map<String, Object> resultMap = memberService.chkDuplicateId(params);
        return resultMap;
    }

    @ResponseBody
    @RequestMapping("/doCertification")
    public Map<String, Object> doCertification(@RequestParam HashMap<String, Object> params) {

        Map<String, Object> resultMap = memberService.doCertification(params);
        return resultMap;
    }

    @ResponseBody
    @RequestMapping("/doSignUp")
    public Map<String, Object> doSignUp(@RequestParam HashMap<String, Object> params) {

        if (params.get("chkMail").equals("") || params.get("chkMail").equals("undefined")) {
            params.put("chkMail","N");
        }
        if (params.get("sms").equals("N")) {
            params.put("mkt1","N");
            params.put("mkt2","N");
            params.put("mkt3","N");
        } else if (params.get("sms").equals("Y")) {
            params.put("mkt1","Y");
            params.put("mkt2","Y");
            params.put("mkt3","Y");
        }

        Map<String, Object> resultMap = memberService.doSignUp(params);
        return resultMap;
    }
}
