package podo.podospring.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Service;
import podo.podospring.common.dao.AbstractDAO;

@Service
public class SessionManagerService extends AbstractDAO {
    @SuppressWarnings("unchecked")
    public List<HashMap<String, Object>> sessionConfirm(HashMap<String, Object> params) {
        List<HashMap<String, Object>> list = selectList("session.sessionConfirm", params);
        return list;
    }
}
