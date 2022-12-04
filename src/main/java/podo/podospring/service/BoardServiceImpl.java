package podo.podospring.service;

import java.util.HashMap;
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
    public HashMap<String, Object> writeBoard(HashMap<String, Object> params) {
        return boardDAO.writeBoard(params);
    }

    @Override
    public HashMap<String, Object> doDelete(HashMap<String, Object> params) {
        return boardDAO.doDelete(params);
    }

    @Override
    public HashMap<String, Object> getJoinList(HashMap<String, Object> params) {
        return boardDAO.getJoinList(params);
    }

    @Override
    public HashMap<String, Object> getReplyList(HashMap<String, Object> params) {
        return boardDAO.getReplyList(params);
    }

    @Override
    public HashMap<String, Object> doDeleteReply(HashMap<String, Object> params) {
        return boardDAO.doDeleteReply(params);
    }

    @Override
    public HashMap<String, Object> writeReply(HashMap<String, Object> params) {
        return boardDAO.writeReply(params);
    }

    @Override
    public HashMap<String, Object> getJoinCalendar(HashMap<String, Object> params) {
        return boardDAO.getJoinCalendar(params);
    }

    @Override
    public HashMap<String, Object> boardHonor(HashMap<String, Object> params) {
        return boardDAO.boardHonor(params);
    }


}
