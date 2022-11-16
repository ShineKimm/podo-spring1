package podo.podospring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AdminService {

    List<HashMap<String, Object>> doLogin(Map<String, Object> params);
}
