package podo.podospring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import podo.podospring.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{

    BoardDAO boardDAO;

    @Autowired
    public BoardServiceImpl(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

    @Override
    public List<HashMap<String, Object>> getBoardList(Map<String, Object> params) {
        return boardDAO.getBoardList(params);
    }


    @Override
    public List<HashMap<String, Object>> boardList(Map<String, Object> params) {
        return boardDAO.boardList(params);
    }
}
