package podo.podospring.controller;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import podo.podospring.service.AdminService;

@Controller
public class AdminController {

    private AdminService adminService;

    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }


    @RequestMapping("/adminDoLogin")
    @ResponseBody
    public List<HashMap<String, Object>> doLogin(@RequestParam HashMap<String, Object> params) {
        List<HashMap<String, Object>> result = adminService.doLogin(params);
        return result;
    }
}
