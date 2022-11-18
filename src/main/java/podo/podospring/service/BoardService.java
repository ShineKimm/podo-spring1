package podo.podospring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardService {


    public HashMap<String, Object> getBoardList(HashMap<String, Object> params);

    HashMap<String, Object> getBoardDetail(HashMap<String, Object> params);

    void writeBoard(HashMap<String, Object> params);
}
