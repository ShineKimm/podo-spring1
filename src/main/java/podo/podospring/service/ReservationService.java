package podo.podospring.service;

import java.util.HashMap;

public interface ReservationService {

    HashMap<String, Object> getCalendar(HashMap<String, Object> params);

    HashMap<String, Object> getTeeList(HashMap<String, Object> params);

    HashMap<String, Object> changeReservation(HashMap<String, Object> params);

    HashMap<String, Object> doReservation(HashMap<String, Object> params);

    HashMap<String, Object> getReservationList(HashMap<String, Object> params);

    HashMap<String, Object> blDeleteReservation(HashMap<String, Object> params);

    HashMap<String, Object> cancelReservation(HashMap<String, Object> params);
}
