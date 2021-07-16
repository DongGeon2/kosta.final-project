package org.kosta.myproject.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.mapper.RestaurantMapper;
import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.springframework.stereotype.Service;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	@Resource
	private RestaurantMapper restaurantMapper;
	/*
	 *  비밀번호 암호화처리를 위한 객체를 주입받는다
	 *  spring boot : org.kosta.config.security.WebSecurityConfig 에 @Bean 설정 되어 있음 
	 *  spring legacy: spring-security.xml 에서 bean 설정이 되어 있음 
	 */
	
/** 검색 **/
	@Override
	public List<RestaurantVO> findRestaurantByName(String resName, PagingBean pagingBean) {
		int getStartRowNumber = pagingBean.getStartRowNumber();
		int getEndRowNumber = pagingBean.getEndRowNumber();
		return restaurantMapper.findRestaurantByName(resName,getStartRowNumber, getEndRowNumber);
	}
/** 검색 **/

/** 메인바검색 **/
	@Override
	public List<RestaurantVO> findRestaurantByMainBar(String foodType, String resLoc, PagingBean pagingBean) {
		int getStartRowNumber = pagingBean.getStartRowNumber();
		int getEndRowNumber = pagingBean.getEndRowNumber();
		return restaurantMapper.findRestaurantByMainBar(foodType, resLoc, getStartRowNumber, getEndRowNumber);
	}
/** 메인바검색 **/
	
/** 추천상세 **/	
	@Override
	public int getTotalCount() {
		return restaurantMapper.getTotalList();
	}

	@Override
	public ArrayList<RestaurantVO> getRestaurantList(PagingBean pagingBean) {
		int getStartRowNumber = pagingBean.getStartRowNumber();
		int getEndRowNumber = pagingBean.getEndRowNumber();
		return restaurantMapper.getRestaurantList(getStartRowNumber, getEndRowNumber);
	}
/** 추천상세 **/

	/** 식당상세 **/
	@Override
	public RestaurantVO findRestaurantByResNo(String resNo) {
		return restaurantMapper.findRestaurantByResNo(resNo);
	}

	@Override
	public void registerResForm(RestaurantVO rvo) {
		restaurantMapper.registerResForm(rvo);
	}

	@Override
	public int getTotalSearchCount(String resName) {
		return restaurantMapper.getTotalSearchList(resName);
	}

	@Override
	public int getTotalSearchMainBarCount(String foodType, String resLoc) {
		return restaurantMapper.getTotalSearchMainBarList(foodType, resLoc);	
		}

	@Override
	public ArrayList<RestaurantVO> getRestaurantListHome() {
		return restaurantMapper.getRestaurantListHome();
	}

	@Override
	public void deleteRestaurant(String resNo) {
		 restaurantMapper.deleteRestaurant(resNo);
	}
}
