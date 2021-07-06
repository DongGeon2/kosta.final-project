package org.kosta.myproject.controller;

import org.kosta.myproject.model.vo.MemberVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping(value={"/","home"})
	public String home() {
		// db, model 과 연동 
		// tiles-config.xml 에 정의된 definition name인 home.tiles를 이용해
		// view를 제공 
		return "home.tiles";
	}
	@RequestMapping("restaurant")
	public String restaurant(Model model) {
		MemberVO mvo = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("mvo", mvo);
		return "restaurant.tiles";
	}
	
	@RequestMapping("user/recommend")
	public String recommend() {
		return "recommend.tiles";
	}
	@RequestMapping("login")
	public String login() {
		return "login.tiles";
	}
	@RequestMapping("mypage")
	public String mypage() {
		return "mypage.tiles";
	}
	
	@RequestMapping("board")
	public String board() {
		return "board.tiles";
	}
	
	@RequestMapping("boardpost")
	public String boardpost() {
		return "boardpost.tiles";
	}
	
	@RequestMapping("findRestaurantByNameOk")
	public String findRestaurantByNameOk() {
		return "findRestaurantByNameOk.tiles";
	}

	@RequestMapping("restaurantjinsol")
	public String restaurantjinsol() {
		return "restaurantjinsol.tiles";
	}
}







