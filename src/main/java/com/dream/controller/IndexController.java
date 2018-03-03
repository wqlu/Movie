package com.dream.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by ZXL on 2018/3/1.
 */

@Controller
public class IndexController {

    @RequestMapping("/")
    public String showIndex(){

        return "login";
    }

    // 其他页面
    @RequestMapping("{page}")
    public String showpage(@PathVariable String page) {
        return page;
    }

}
