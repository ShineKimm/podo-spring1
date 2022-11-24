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

    @Override
    public HashMap<String, Object> changeReservation(HashMap<String, Object> params) {
        return reservationDAO.changeReservation(params);
    }

    @Override
    public HashMap<String, Object> doReservation(HashMap<String, Object> params) {
        return reservationDAO.doReservation(params);
    }

    @Override
    public HashMap<String, Object> getReservationList(HashMap<String, Object> params) {
        return reservationDAO.getReservationList(params);
    }

    @Override
    public HashMap<String, Object> blDeleteReservation(HashMap<String, Object> params) {
        return reservationDAO.blDeleteReservation(params);
    }

    @Override
    public HashMap<String, Object> cancelReservation(HashMap<String, Object> params) {
        return reservationDAO.cancelReservation(params);
    }
}
