package podo.podospring.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import podo.podospring.dao.SessionManagerDAO;

@Service
public class SessionManagerServiceImpl implements  SessionManagerService{

    SessionManagerDAO sessionManagerDAO;

    public SessionManagerServiceImpl(SessionManagerDAO sessionManagerDAO) {
        this.sessionManagerDAO = sessionManagerDAO;
    }

    @Override
    public List<HashMap<String, Object>> sessionConfirm(HashMap<String, Object> params) {
        return sessionManagerDAO.sessionConfirm(params);
    }
}
