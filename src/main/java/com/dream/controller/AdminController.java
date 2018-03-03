package com.dream.controller;

import com.dream.common.E3Result;
import com.dream.service.AdminService;
import org.apache.ibatis.reflection.ExceptionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    // 用户登录
    @RequestMapping("/index")
    public String adminLogin(String adminname, String adminpassword ) {
        try {
            E3Result result = adminService.adminLogin(adminname, adminpassword);
            if (200 == result.getStatus()) {
                return "index";
            } else {
                return "error";
            }
        } catch (Exception e) {

            return e.getMessage();
        }
    }
}
