package podo.podospring.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SessionManager {

    @ResponseBody
    @RequestMapping("/controller/SessionManager")
    public List<HashMap<String, Object>> sessionConfirm(HttpServletRequest request, @RequestParam HashMap<String, Object> params) {
        String resultCode = "9999";
        String resultMessage = "";
//        String method = request.getParameter("method");
//        if (method == "sessionConfirm") {
//            If(request.getSession("MS_NUM") != ""){
//
//            }
//        }
        params.get("method");

        return null;
    }
}
