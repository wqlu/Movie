package com.dream.service;

import com.dream.common.EUDataGridResult;
import com.dream.po.Movie;

public interface ItemService {

    Movie getMovieById(int movieid);
    EUDataGridResult getMovieList(int page, int rows);
}
