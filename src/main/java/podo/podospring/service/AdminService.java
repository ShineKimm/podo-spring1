package podo.podospring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

public interface AdminService {

    Map<String, Object> adminDoLogin(HashMap<String, Object> params, HttpSession session);

    HashMap<String, Object> getMainData(HashMap<String, Object> params);

    HashMap<String, Object> getMessage(HashMap<String, Object> params);
}
