package org.kosta.myproject.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.kosta.myproject.model.mapper.RestaurantMapper;
import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.springframework.stereotype.Service;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	@Resource
	private RestaurantMapper restaurantMapper;

	@Override
	public int getTotalCount() {
		return restaurantMapper.getTotalCount();
	}
	
	@Override
	public ArrayList<RestaurantVO> getList(PagingBean pagingBean){
		int getStartRowNumber = pagingBean.getStartRowNumber();
		int getEndRowNumber = pagingBean.getEndRowNumber();
		return restaurantMapper.getReataurantList(getStartRowNumber, getEndRowNumber);
	}
}
