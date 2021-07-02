package org.kosta.myproject.model.service;

import java.util.ArrayList;

import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.RestaurantVO;

public interface RestaurantService {

	public int getTotalCount();

	public ArrayList<RestaurantVO> getList(PagingBean pagingBean);

}