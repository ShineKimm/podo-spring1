package podo.podospring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import podo.podospring.common.dao.AbstractDAO;

@Repository
public class AdminDAO extends AbstractDAO {

    @SuppressWarnings("unchecked")
    public List<HashMap<String, Object>> AdminDoLogin(Map<String, Object> params) {
        List<HashMap<String, Object>> list = selectList("admin.AdminDoLogin", params);
        return list;
    }
}
