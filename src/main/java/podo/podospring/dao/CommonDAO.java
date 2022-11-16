package podo.podospring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import podo.podospring.common.dao.AbstractDAO;

@Repository
public class CommonDAO extends AbstractDAO {

    public List<Map<String, Object>> getCommonCode(HashMap<String, Object> params) {
    List<Map<String, Object>> resultList= selectList("common.getCommonCode", params);
        if (resultList != null || resultList.size() != 0) {
            resultList.get(0).put("resultCode","0000");
        }
        return resultList;
    }
}
