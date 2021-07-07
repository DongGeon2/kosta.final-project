package org.kosta.myproject.model.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.vo.RestaurantVO;
@Mapper
public interface RestaurantMapper {

	int getTotalCount();

	ArrayList<RestaurantVO> getReataurantList(int getStartRowNumber, int getEndRowNumber);

	RestaurantVO findRestaurantByName(String resName);

	List<RestaurantVO> findRestaurantByMainBar(String foodType, String resLoc);
	
	public int getTotalList();
	
	public ArrayList<RestaurantVO> getRestaurantList(int getStartRowNumber, int getEndRowNumber);

	RestaurantVO findRestaurantByResNo(String resNo);

}







