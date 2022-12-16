package podo.podospring.service;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

public interface MemberService {

    Map<String, Object> doLogin(Map<String, Object> params)
            throws NoSuchAlgorithmException;

    Map<String, Object> chkDuplicateId(HashMap<String, Object> params);
    Map<String, Object> doCertification(HashMap<String, Object> params);

    Map<String, Object> doSignUp(HashMap<String, Object> params);

    Map<String, Object> doUpdateMemeber(HashMap<String, Object> params);

    Map<String, Object> doDeleteMemeber(HashMap<String, Object> params);

    Map<String, Object> doFindId(HashMap<String, Object> params);

    Map<String, Object> doFindPw(HashMap<String, Object> params);
}
