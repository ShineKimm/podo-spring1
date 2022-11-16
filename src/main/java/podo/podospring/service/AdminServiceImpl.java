package podo.podospring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    public List<HashMap<String, Object>> doLogin(Map<String, Object> params) {
        return adminDao.AdminDoLogin(params);
    }
}
