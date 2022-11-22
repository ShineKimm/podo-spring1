package podo.podospring.service;

import java.util.HashMap;
import org.springframework.stereotype.Service;
import podo.podospring.dao.ReservationDAO;

@Service
public class ReservationServiceImpl implements ReservationService{
    ReservationDAO reservationDAO;

    public ReservationServiceImpl(ReservationDAO reservationDAO) {
        this.reservationDAO = reservationDAO;
    }

    @Override
    public HashMap<String, Object> getCalendar(HashMap<String, Object> params) {
        return reservationDAO.getCalendar(params);
    }

    @Override
    public HashMap<String, Object> getTeeList(HashMap<String, Object> params) {
        return reservationDAO.getTeeList(params);
    }
}
