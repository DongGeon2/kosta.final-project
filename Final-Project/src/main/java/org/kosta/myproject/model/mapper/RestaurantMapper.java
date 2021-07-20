package org.kosta.myproject.model.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.vo.RestaurantVO;
@Mapper
public interface RestaurantMapper {

	int getTotalCount();

	ArrayList<RestaurantVO> getReataurantList(int getStartRowNumber, int getEndRowNumber);

	List<RestaurantVO> findRestaurantByName(String resName, int getStartRowNumber, int getEndRowNumber);

	List<RestaurantVO> findRestaurantByMainBar(String foodType, String resLoc, int getStartRowNumber, int getEndRowNumber);
	
	public int getTotalList();
	
	public ArrayList<RestaurantVO> getRestaurantList(int getStartRowNumber, int getEndRowNumber);

	RestaurantVO findRestaurantByResNo(String resNo);
	
	void registerResForm(RestaurantVO rvo);

	public int getTotalSearchList(String resName);

	public int getTotalSearchMainBarList(String foodType, String resLoc);

	ArrayList<RestaurantVO> getRestaurantListHome();

	void deleteRestaurant(String resNo);

	ArrayList<RestaurantVO> getHomeRestaurantList();

}







