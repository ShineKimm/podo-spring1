package podo.podospring.service;

import java.util.HashMap;

public interface BoardService {


    public HashMap<String, Object> getBoardList(HashMap<String, Object> params);

    HashMap<String, Object> getBoardDetail(HashMap<String, Object> params);

    HashMap<String, Object> writeBoard(HashMap<String, Object> params);

    HashMap<String, Object> doDelete(HashMap<String, Object> params);

    HashMap<String, Object> getJoinList(HashMap<String, Object> params);

    HashMap<String, Object> getReplyList(HashMap<String, Object> params);

    HashMap<String, Object> doDeleteReply(HashMap<String, Object> params);

    HashMap<String, Object> writeReply(HashMap<String, Object> params);

    HashMap<String, Object> getJoinCalendar(HashMap<String, Object> params);

    HashMap<String, Object> boardHonor(HashMap<String, Object> params);
}
