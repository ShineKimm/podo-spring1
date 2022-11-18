package podo.podospring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import podo.podospring.common.dao.AbstractDAO;

@Repository
public class CommonDAO extends AbstractDAO {
    public Map<String, Object> getCommonCode(HashMap<String, Object> params) {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("resultCode","9999");
        resultMap.put("resultMessage","");

        List<Map<String, Object>> resultList = selectList("common.getCommonCode", params);
        resultMap.put("rows",resultList);

        if (resultList != null || resultList.size() != 0) {
            resultMap.put("resultCode","0000");
        }
        return resultMap;
    }
}