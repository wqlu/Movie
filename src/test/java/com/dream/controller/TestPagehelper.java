package com.dream.controller;

import com.dream.mapper.MovieMapper;
import com.dream.po.Movie;
import com.dream.po.MovieExample;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TestPagehelper {

    @Test
    public void testPageHelper() {
        // 创建一个Spring容器
        // note： 参数加载配置文件
        String configLocations = "classpath:spring/applicationContext-*.xml";
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext(configLocations);
        // 从容器中获取Mapper代理对象那个
        MovieMapper mapper = applicationContext.getBean(MovieMapper.class);
        // 执行查询，并且分页
        MovieExample example = new MovieExample();
        // 分页
        PageHelper.startPage(1, 10);
        List<Movie> list = mapper.selectByExample(example);

        for (Movie movie : list) {
            System.out.println(movie.getMoviename());
        }
        // 取分页信息
        PageInfo<Movie> pageInfo = new PageInfo<>(list);
        long total = pageInfo.getTotal();
        System.out.println("total: " + total);

    }
}