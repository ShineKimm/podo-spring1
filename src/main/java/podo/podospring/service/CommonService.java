package podo.podospring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;

public interface CommonService {

    List<Map<String, Object>> getCommonCode(HashMap<String, Object> params);
}
