package podo.podospring.service;

import java.util.HashMap;
import java.util.List;

public interface SessionManagerService {

    List<HashMap<String, Object>> sessionConfirm(HashMap<String, Object> params);
}
