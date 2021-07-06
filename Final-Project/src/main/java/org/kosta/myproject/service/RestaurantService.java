package org.kosta.myproject.service;

import java.util.List;

import org.kosta.myproject.model.vo.RestaurantVO;

public interface RestaurantService {
	
	/** 검색 **/
	RestaurantVO findRestaurantByName(String resName);

	/** 메인바검색 **/
	List<RestaurantVO> findRestaurantByMainBar(String foodType, String resLoc);

	


}
