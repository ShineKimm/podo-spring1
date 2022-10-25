package podo.podospring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface SampleService {
	
	public List<HashMap<String, Object>> selectTest(Map<String, Object> params);
	
}
