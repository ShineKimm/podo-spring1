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
//            resultMap = selectMap("member.verification",params, "id");
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
                session.setAttribute("MS_NUM", hMap.get("MS_NUM"));
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
