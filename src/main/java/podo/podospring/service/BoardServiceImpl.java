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
    public HashMap<String, Object> getBoardList(HashMap<String, Object> params) {
        return boardDAO.getBoardList(params);
    }

    @Override
    public HashMap<String, Object> getBoardDetail(HashMap<String, Object> params) {
        return boardDAO.getBoardDetail(params);
    }

    @Override
    public void writeBoard(HashMap<String, Object> params) {
        boardDAO.writeBoard(params);
    }


}
