package podo.podospring.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Repository;
import podo.podospring.common.dao.AbstractDAO;

@Repository
public class ReservationDAO extends AbstractDAO {

    public HashMap<String, Object> getCalendar(HashMap<String, Object> params) {

        String nowDate = (String)selectOne("reservation.nowDate",params);

        HashMap<String, Object> resultMap = (HashMap<String, Object>)selectOne("reservation.getCalendarQuery1",params);
        params.put("minDay",resultMap.get("MINDAY"));
        params.put("maxDay",resultMap.get("MAXDAY"));

        List<HashMap<String, Object>> resultList = selectList("reservation.getCalendarQuery2",params);
        resultMap.put("rows",resultList);
        resultMap.put("resultCode","0000");

        return resultMap;
    }

    public HashMap<String, Object> getTeeList(HashMap<String, Object> params) {
        HashMap<String, Object> resultMap = (HashMap<String, Object>)selectOne("reservation.getCalendarQuery1",params);
        return resultMap;
    }
}
