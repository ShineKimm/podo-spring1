package podo.podospring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import podo.podospring.common.dao.AbstractDAO;

@Repository
public class BoardDAO extends AbstractDAO {

    @SuppressWarnings("unchecked")
    public List<HashMap<String, Object>> boardList(Map<String, Object> params) {
        List<HashMap<String, Object>> list = selectList("board.boardList", params);
        return list;
    }

    public List<HashMap<String, Object>> getBoardList(Map<String, Object> params) {
        List<HashMap<String, Object>> list = selectList("board.getBoardList", params);
        return list;
    }
}
