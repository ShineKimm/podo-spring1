package podo.podospring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import podo.podospring.common.dao.AbstractDAO;

@Repository
public class BoardDAO extends AbstractDAO {

    @SuppressWarnings("unchecked")
    public HashMap<String, Object> getBoardList(HashMap<String, Object> params) {
        // TODO: 2022-11-17 파일 업로드 추가해야함

        params.put("resultCode", "0000");
        params.put("resultMessage", "");


        List<HashMap<String, Object>> bordList = selectList("board.query1", params);
        int totalCnt = selectCnt("board.query2", params);

        if (bordList != null) {
            params.put("rows",bordList);
            params.put("totalCnt",totalCnt);
            params.put("resultCode", "0000");
        }

        return params;
    }

    @SuppressWarnings("unchecked")
    public HashMap<String, Object> getBoardDetail(HashMap<String, Object> params) {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        List<HashMap<String, Object>> getBoardDetail = selectList("board.getBoardDetail", params);
        update("board.ReCnt", params);

        if (getBoardDetail.size() > 0) {
            resultMap.put("rows", getBoardDetail);
            resultMap.put("resultCode", "0000");
        }
        return resultMap;
    }

    public void writeBoard(HashMap<String, Object> params) {

    }
}
