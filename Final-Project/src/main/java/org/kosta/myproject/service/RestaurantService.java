package org.kosta.myproject.service;

import java.util.ArrayList;
import java.util.List;

import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.RestaurantVO;

public interface RestaurantService {
	
	/** 검색 **/
	List<RestaurantVO> findRestaurantByName(String resName, PagingBean pagingBean);

	/** 메인바검색 **/
	List<RestaurantVO> findRestaurantByMainBar(String foodType, String resLoc, PagingBean pagingBean);

	/** 추천상세 **/
	int getTotalCount();

	/** 추천상세 **/
	ArrayList<RestaurantVO> getRestaurantList(PagingBean pagingBean);
	
	/** 식당상세 **/
	RestaurantVO findRestaurantByResNo(String resNo);
	
	/** 식당등록 **/
	void registerResForm(RestaurantVO rvo);

	int getTotalSearchCount(String resName);

	int getTotalSearchMainBarCount(String foodType, String resLoc);

	ArrayList<RestaurantVO> getRestaurantListHome();

	void deleteRestaurant(String resNo);

}
