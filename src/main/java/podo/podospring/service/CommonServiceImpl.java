package podo.podospring.service;

import java.util.HashMap;
import java.util.Map;
import org.springframework.stereotype.Service;
import podo.podospring.dao.CommonDAO;

@Service
public class CommonServiceImpl implements CommonService {
    CommonDAO commonDAO;

    public CommonServiceImpl(CommonDAO commonDAO) {
        this.commonDAO = commonDAO;
    }

    @Override
    public Map<String, Object> getCommonCode(HashMap<String, Object> params) {

        return commonDAO.getCommonCode(params);
    }
}
