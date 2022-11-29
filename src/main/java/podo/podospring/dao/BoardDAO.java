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

    public HashMap<String, Object> writeBoard(HashMap<String, Object> params) {

        //TODO 트랜젝션 시작
        int errNum = 0;
        if ("I".equals((String)params.get( "actionFlag"))) {
            int idx = selectCnt("board.idx", params);
            params.put("idx",idx);
            int ReCnt2 = insert("board.writeBoardQuery2", params);
            if (ReCnt2 < 1) {
                errNum = errNum +1;
            }
            int ReCnt3 = insert("board.writeBoardQuery3", params);
            if (ReCnt3 < 1) {
                errNum = errNum +1;
            }
        } else if ("U".equals((String)params.get("actionFlag"))) {
            params.get("idx");
            int ReCnt4 = update("board.updateQuery1",params);
            if (ReCnt4 < 1) {
                errNum = errNum +1;
            }
            if (null != params.get("fileName1") || null != params.get("fileName2") || null != params.get("fileName3")) {
                int ReCnt5 = update("board.updateQuery2",params);
                if (ReCnt5 < 1) {
                    errNum = errNum +1;
                }
            }
        }

        if (errNum > 0) {
            //TODO 트랜잭션 롤백
            params.put("resultCode", "9999");
            params.put("resultMessage", "오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
        } else {
            //TODO 트랜잭션 커밋
            params.put("resultCode", "0000");
        }
        return params;
    }//writeBoard

    public HashMap<String, Object> doDelete(HashMap<String, Object> params) {
        update("board.doDelete",params);
        params.put("resultCode","0000");
        return params;
    }

    public HashMap<String, Object> getJoinList(HashMap<String, Object> params) {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<HashMap<String, Object>> getJoinList = selectList("board.getJoinList", params);
        resultMap.put("rows",getJoinList);
        int totalCnt = selectCnt("board.joinTotalCnt", params);
        resultMap.put("totalCnt",totalCnt);
        resultMap.put("resultCode","0000");

        return resultMap;
    }

    public HashMap<String, Object> getReplyList(HashMap<String, Object> params) {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        List<HashMap<String, Object>> getReplyList = selectList("board.getReplyList", params);
        resultMap.put("rows",getReplyList);
        resultMap.put("resultCode","0000");
        return resultMap;
    }

    public HashMap<String, Object> doDeleteReply(HashMap<String, Object> params) {
        update("board.doDeleteReply", params);
        params.put("resultCode","0000");
        return params;
    }
}
