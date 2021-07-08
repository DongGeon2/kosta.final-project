package org.kosta.myproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.service.RestaurantService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RestaurantController {
	@Resource
	private RestaurantService restaurantService;

	/** 검색 **/
	@RequestMapping("user/findRestaurantByName")
	public String findRestaurantByName(String resName, Model model) {
		List<RestaurantVO> list = restaurantService.findRestaurantByName(resName);
		System.out.println(list);
		if (list == null)
			return "restaurant/findRestaurantByName_fail.tiles";
		else {
			model.addAttribute("restaurantVOList", list);
			return "restaurant/findRestaurantByName_ok.tiles";
		}
	}

	/** 검색 **/

	/** 메인바검색 **/
	@RequestMapping("user/findRestaurantByMainBar")
	public String findRestaurantByMainBar(String foodType, String resLoc, Model model) {
		List<RestaurantVO> list = restaurantService.findRestaurantByMainBar(foodType, resLoc);
		System.out.println(list);
		if (list == null)
			return "restaurant/findRestaurantByMainBar_fail.tiles";
		else {
			model.addAttribute("restaurantVOList", list);
			return "restaurant/findRestaurantByMainBar_ok.tiles";
		}
	}

	/** 메인바검색 **/

	/** 추천상세 **/
	@RequestMapping("user/recommend")
	public String recommend(Model model, String pageNo) {
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
	public String countPage(Model model, String pageNo) {
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

	/** 추천상세 **/

	/** 사장 식당 등록 **/
	@RequestMapping("restaurant/registerRestaurantForm")
	public String registerResForm() {
		return "restaurant/registerRestaurantForm.tiles";
	}
	
	@PostMapping("restaurant/registerRestaurant")
	public String registerRestaurant(RestaurantVO rvo) {
		System.out.println("하나두울셋");
		MemberVO mvo = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		rvo.setMemberVO(mvo);
		System.out.println("ResVO:"+rvo+"인증정보 확인:"+mvo);
		rvo.setMemberVO(mvo);
		restaurantService.registerResForm(rvo);
		return "redirect:registerRes";
	}
	
	@RequestMapping("restaurant/registerRes")
	public String registerRes() {
		return "restaurant/registerResResult";
	}
	/** 사장 식당 등록 **/
}
