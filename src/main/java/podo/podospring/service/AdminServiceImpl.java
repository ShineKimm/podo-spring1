package podo.podospring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import podo.podospring.dao.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{

    AdminDAO adminDao;

    @Autowired
    public AdminServiceImpl(AdminDAO adminDao) {
        this.adminDao = adminDao;
    }

    @Override
    public Map<String, Object> adminDoLogin(HashMap<String, Object> params, HttpSession session) {
        return adminDao.AdminDoLogin(params,session);
    }

    @Override
    public HashMap<String, Object> getMainData(HashMap<String, Object> params) {
        return adminDao.getMainData(params);
    }

    @Override
    public HashMap<String, Object> getMessage(HashMap<String, Object> params) {
        return adminDao.getMessage(params);
    }
}
