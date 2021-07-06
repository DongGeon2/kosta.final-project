package org.kosta.myproject.service;

import java.util.ArrayList;
import java.util.List;

import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.RestaurantVO;

public interface RestaurantService {
	
	/** 검색 **/
	RestaurantVO findRestaurantByName(String resName);

	/** 메인바검색 **/
	List<RestaurantVO> findRestaurantByMainBar(String foodType, String resLoc);

	/** 추천상세 **/
	int getTotalCount();

	/** 추천상세 **/
	ArrayList<RestaurantVO> getRestaurantList(PagingBean pagingBean);



}