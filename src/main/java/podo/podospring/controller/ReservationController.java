package podo.podospring.controller;

import java.util.HashMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import podo.podospring.service.ReservationService;

@Controller
public class ReservationController {

    private ReservationService reservationService;

    public ReservationController(ReservationService reservationService) {
        this.reservationService = reservationService;
    }

    @ResponseBody
    @RequestMapping("/getCalendar")
    public HashMap<String, Object> getCalendar(@RequestParam HashMap<String, Object> params) {

        HashMap<String, Object> result = reservationService.getCalendar(params);

        return result;
    }

    @ResponseBody
    @RequestMapping("/getTeeList")
    public HashMap<String, Object> getTeeList(@RequestParam HashMap<String, Object> params) {

        params.put("coDiv",params.get("coDiv"));
        params.put("sDate",params.get("date"));
        params.put("sCos",params.get("cos"));
        params.put("msNum",params.get("msNum"));

        HashMap<String, Object> result = reservationService.getTeeList(params);

        return result;
    }
}
