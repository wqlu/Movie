package com.dream.service.impl;


import com.dream.common.EUDataGridResult;
import com.dream.mapper.MovieMapper;
import com.dream.po.Movie;
import com.dream.po.MovieExample;
import com.dream.service.ItemService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private MovieMapper movieMapper;

    // 通过电影id查询电影
    public Movie getMovieById(int movieid) {
        MovieExample example = new MovieExample();
        MovieExample.Criteria criteria= example.createCriteria();
        criteria.andMovieidEqualTo(movieid);
        List<Movie> list = movieMapper.selectByExample(example);
        if (list != null && list.size() > 0) {
            Movie movie = list.get(0);
            return movie;
        }
        return null;
    }

    // 获取电影列表
    public EUDataGridResult getMovieList(int page, int rows) {
        // 查询列表
        MovieExample example = new MovieExample();
        // 分页处理
        PageHelper.startPage(page, rows);
        List<Movie> list = movieMapper.selectByExample(example);
        // 创建一个返回值类，要用EUD类
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        // 取出记录的总条数
        PageInfo<Movie> pageInfo = new PageInfo<Movie>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }
}
