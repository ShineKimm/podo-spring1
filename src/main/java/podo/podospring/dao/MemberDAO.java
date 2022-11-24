package podo.podospring.dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import podo.podospring.common.dao.AbstractDAO;

@Repository
public class MemberDAO extends AbstractDAO {

    @SuppressWarnings("unchecked")
    public Map<String, Object> doLogin(Map<String, Object> params)
            throws NoSuchAlgorithmException {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        HttpSession session = request.getSession();

        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        //암호화
        String pw =  (String)params.get("pw");
        String hex = "";
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(pw.getBytes());
        hex = String.format("%064x", new BigInteger(1, md.digest()));
        params.put("pw",hex);

        int cnt = selectCnt("member.doLoginCNT",params);
        if (cnt < 1) {
            resultMap.put("resultCode", "1000");
            resultMap.put("resultMessage", "존재하지 않는 아이디입니다.");
        } else {
            Map<String, Object> hMap = (Map<String, Object>) selectOne("member.verification", params);
            if (hMap != null) {
                System.out.println(hMap.get("MS_NAME"));
                resultMap.put("MS_NAME",hMap.get("MS_NAME"));
                resultMap.put("MS_NUM",hMap.get("MS_NUM"));
            }
            if (hMap == null) {
                resultMap.put("resultCode", "2000");
                resultMap.put("resultMessage", "암호가 잘못되었습니다.");
            } else {
                Map<String, Object> SessionMap = (Map<String, Object>)selectOne("member.setSession", hMap);
                session.setAttribute("MS_NUM", SessionMap.get("MS_NUM"));
                session.setAttribute("MS_MAIN_CODIV", SessionMap.get("MS_MAIN_CODIV"));
                session.setAttribute("MS_DIVISION", SessionMap.get("MS_DIVISION"));
                session.setAttribute("MS_CLASS", SessionMap.get("MS_CLASS"));
                session.setAttribute("MS_LEVEL", SessionMap.get("MS_LEVEL"));
                session.setAttribute("MS_ID", SessionMap.get("MS_ID"));
                session.setAttribute("MS_PASSWORD", SessionMap.get("MS_PASSWORD"));
                session.setAttribute("MS_NAME", SessionMap.get("MS_NAME"));
                session.setAttribute("MS_SEX", SessionMap.get("MS_SEX"));
                session.setAttribute("MS_BIRTH", SessionMap.get("MS_BIRTH"));
                session.setAttribute("MS_BIRTHYL", SessionMap.get("MS_BIRTHYL"));
                session.setAttribute("MS_EMAIL", SessionMap.get("MS_EMAIL"));
                session.setAttribute("MS_EMAIL_YN", SessionMap.get("MS_EMAIL_YN"));
                session.setAttribute("MS_FIRST_PHONE1", SessionMap.get("MS_FIRST_PHONE1"));
                session.setAttribute("MS_MID_PHONE1", SessionMap.get("MS_MID_PHONE1"));
                session.setAttribute("MS_LAST_PHONE1", SessionMap.get("MS_LAST_PHONE1"));
                session.setAttribute("SMS_CHK1", SessionMap.get("SMS_CHK1"));
                session.setAttribute("MS_HOMETEL", SessionMap.get("MS_HOMETEL"));
                session.setAttribute("MS_HOMEZIP", SessionMap.get("MS_HOMEZIP"));
                session.setAttribute("MS_HOMEADDR1", SessionMap.get("MS_HOMEADDR1"));
                session.setAttribute("MS_HOMEADDR2", SessionMap.get("MS_HOMEADDR2"));
                session.setAttribute("MS_COMPTEL", SessionMap.get("MS_COMPTEL"));
                session.setAttribute("MS_COMPZIP", SessionMap.get("MS_COMPZIP"));
                session.setAttribute("MS_COMPADDR1", SessionMap.get("MS_COMPADDR1"));
                session.setAttribute("MS_COMPADDR2", SessionMap.get("MS_COMPADDR2"));
                session.setAttribute("MS_DM_H", SessionMap.get("MS_DM_H"));
                session.setAttribute("MS_DM_C", SessionMap.get("MS_DM_C"));
                session.setAttribute("MS_CAR_NO", SessionMap.get("MS_CAR_NO"));
                session.setAttribute("MS_FIRSTDAY", SessionMap.get("MS_FIRSTDAY"));
                session.setAttribute("MS_WEEKDAY_CNT", SessionMap.get("MS_WEEKDAY_CNT"));
                session.setAttribute("MS_WEEKEND_CNT", SessionMap.get("MS_WEEKEND_CNT"));
                session.setAttribute("INPUT_STAFF", SessionMap.get("INPUT_STAFF"));
                session.setAttribute("INPUT_DATETIME", SessionMap.get("INPUT_DATETIME"));
                session.setAttribute("INPUT_IP", SessionMap.get("INPUT_IP"));
                session.setAttribute("UPDATE_STAFF", SessionMap.get("UPDATE_STAFF"));
                session.setAttribute("UPDATE_DATETIME", SessionMap.get("UPDATE_DATETIME"));
                session.setAttribute("UPDATE_IP", SessionMap.get("UPDATE_IP"));
                session.setAttribute("MS_JOB_CD", SessionMap.get("MS_JOB_CD"));
                session.setAttribute("MS_AREA", SessionMap.get("MS_AREA"));
                session.setAttribute("MS_BK_CNT", SessionMap.get("MS_BK_CNT"));
                session.setMaxInactiveInterval(60);

                hMap.put("sessionID",params.get("sessionID"));
                update("member.loginInformation", hMap);
                resultMap.put("resultCode","0000");
                resultMap.put("resultName",resultMap.get("MS_NAME"));
            }
        }
        return resultMap;
    }

    @SuppressWarnings("unchecked")
    public Map<String, Object> chkDuplicateId(HashMap<String, Object> params) {
        int cnt = selectCnt("member.chkDuplicateId",params);
        params.put("cnt", cnt);
        if (cnt < 1) {
            params.put("resultCode", "0000");
        } else {
            params.put("resultCode", "1000");
        }
        return params;
    }

    @SuppressWarnings("unchecked")
    public Map<String, Object> doCertification(HashMap<String, Object> params) {
        HashMap<String, Object> resultMap = null;
        int cnt = selectCnt("member.doCertification",params);
        if (cnt > 0) {
            resultMap.put("resultCode", "9999");
            resultMap.put("resultMessage", "이미 가입되어있는 번호입니다. 아이디 비밀번호 찾기를 이용해 주세요.");
        } else {
            resultMap.put("message","[본인확인]\\n\\n인증번호 [\" & certifyKey & \"]를 입력해 주세요.\\n\\n-포도CC");
            // SP_SMS_SEND coDiv, "", phone1 & phone2 & phone3, message, "", "", "", "", "", "", "", "HOMEPAGE", ip, "", "", ""
            resultMap.put("resultCode", "0000");
        }
        resultMap.put("cnt",cnt);
        return resultMap;
    }
    
    @SuppressWarnings("unchecked")
    public Map<String, Object> doSignUp(HashMap<String, Object> params) {
        List<Map<String, Object>> list_MS_ID = selectList("member.doSignUp1",params);
        if (list_MS_ID.isEmpty()) {
            params.put("netDivision","21");
            params.put("netClass","00");
            params.put("netLevel","00");

            
//             TODO KDY 트렌젝션 시작구문 추가해야함
            try {
                String msNum = (String)selectOne("member.doSignUp2",params);
                String homeAddress = (String) selectOne("member.doSignUp3",params);
                params.put("msNum",msNum);
                params.put("homeAddress",homeAddress);

                insert("member.doSignUp4",params);
                insert("member.doSignUp5",params);

                int getCnt = selectCnt("doSignUp6",params);
                if (getCnt > 0) {
                    insert("member.doSignUp7", params);
                    params.put("resultCode","0000");
                } else {
                    insert("member.doSignUp8", params);
                    params.put("resultCode","0000");
                }
            } catch (Exception e) {
                params.put("resultCode","9999");
                params.put("resultMessage","알 수 없는 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
            }
            //트렌젝션 끝

        } else {
            params.put("resultCode","9999");
                params.put("resultMessage","이미 회원가입되어 있는 번호입니다.");
        }
        return params;
    }
}
