package podo.podospring.service;

import java.util.HashMap;

public interface ReservationService {

    HashMap<String, Object> getCalendar(HashMap<String, Object> params);

    HashMap<String, Object> getTeeList(HashMap<String, Object> params);
}
