package podo.podospring.service;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;
import podo.podospring.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{

    MemberDAO memberDAO;

    public MemberServiceImpl(MemberDAO memberDAO) {
        this.memberDAO = memberDAO;
    }

    @Override
    public Map<String, Object> doLogin(Map<String, Object> params)
            throws NoSuchAlgorithmException {
        return memberDAO.doLogin(params);
    }

    @Override
    public Map<String, Object> chkDuplicateId(HashMap<String, Object> params) {

        return memberDAO.chkDuplicateId(params);
    }

    @Override
    public Map<String, Object> doCertification(HashMap<String, Object> params) {
        return memberDAO.doCertification(params);
    }

    @Override
    public Map<String, Object> doSignUp(HashMap<String, Object> params) {
        return memberDAO.doSignUp(params);
    }
}
