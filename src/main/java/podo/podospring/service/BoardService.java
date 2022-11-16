package podo.podospring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardService {


    public List<HashMap<String, Object>> getBoardList(Map<String, Object> params);

}
