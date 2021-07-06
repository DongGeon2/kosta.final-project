package org.kosta.myproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.service.RestaurantService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RestaurantController {
	@Resource
	private RestaurantService restaurantService;
	
	/**검색**/
	@RequestMapping("user/findRestaurantByName")
	public String findRestaurantByName(String resName,Model model) {		
		RestaurantVO vo = restaurantService.findRestaurantByName(resName);
		//System.out.println(vo);
		if (vo == null)
			return "findRestaurantByName_fail";
		else {
			model.addAttribute("restaurantVO",vo);
			return "findRestaurantByName_ok" ;
		}
	}
	/**검색**/
	
	
	/**메인바검색**/
	@RequestMapping("user/findRestaurantByMainBar")
	public String findRestaurantByMainBar(String foodType, String resLoc, Model model) {		
		List<RestaurantVO> list = restaurantService.findRestaurantByMainBar(foodType, resLoc);
		System.out.println(list);
		if (list == null)
			return "findRestaurantByMainBar_fail";
		else {
			model.addAttribute("restaurantVOList",list);
			return "restaurantjinsol" ;
		}
	}
	/**메인바검색**/	
	
	
	/**추천상세**/
	@RequestMapping("user/recommend")
	public String recommend(Model model,String pageNo) {
		int totalPostcount = restaurantService.getTotalCount();
		PagingBean pagingBean = null;
		
		if (pageNo == null) {
			pagingBean = new PagingBean(totalPostcount);
		} else {
			pagingBean = new PagingBean(totalPostcount, Integer.parseInt(pageNo));
		}
		model.addAttribute("pagingBean", pagingBean);
		ArrayList<RestaurantVO> restaurantList = restaurantService.getRestaurantList(pagingBean);
		model.addAttribute("restaurantList", restaurantList);
		return "recommend.tiles";
	}
	
	@RequestMapping("user/countPage")
	public String countPage(Model model,String pageNo) {
		int totalPostcount = restaurantService.getTotalCount();
		PagingBean pagingBean = null;
		
		if (pageNo == null) {
			pagingBean = new PagingBean(totalPostcount);
		} else {
			pagingBean = new PagingBean(totalPostcount, Integer.parseInt(pageNo));
		}
		model.addAttribute("pagingBean", pagingBean);
		ArrayList<RestaurantVO> restaurantList = restaurantService.getRestaurantList(pagingBean);
		model.addAttribute("restaurantList", restaurantList);
		return "recommend.tiles";
	}
	/**추천상세**/
}







