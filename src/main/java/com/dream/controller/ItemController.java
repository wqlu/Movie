package com.dream.controller;

import com.dream.common.EUDataGridResult;
import com.dream.po.Movie;
import com.dream.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ItemController {

    @Autowired
    private ItemService itemService;

    @RequestMapping("/item/{movieid}")
    @ResponseBody
    public Movie getMovieById(@PathVariable Integer movieid) {
        Movie movie = itemService.getMovieById(movieid);
        return movie;
    }

    @RequestMapping("/item/list")
    @ResponseBody
    public EUDataGridResult getMovieList(Integer page, Integer rows) {
        EUDataGridResult result = itemService.getMovieList(page, rows);
        return result;
    }

}
