package org.kosta.myproject.model.mapper;

import java.util.ArrayList;

import org.kosta.myproject.model.vo.RestaurantVO;

public interface RestaurantMapper {

	int getTotalCount();

	ArrayList<RestaurantVO> getReataurantList(int getStartRowNumber, int getEndRowNumber);

}
