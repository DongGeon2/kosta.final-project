package org.kosta.myproject.controller;

import org.kosta.myproject.model.vo.MemberVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping(value = { "/", "home" })
	public String home() {
		// db, model 과 연동
		// tiles-config.xml 에 정의된 definition name인 home.tiles를 이용해
		// view를 제공
		return "home.tiles";
	}
	
	@RequestMapping("user/restaurant")
	public String restaurant() {
		return "restaurant/restaurant.tiles";
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

	/*
	 * 로그인 하였으나 권한이 없는 요청을 하였을 경우 보여지는 페이지를 지정 <security:access-denied-handler
	 * error-page="/accessDeniedView"/>
	 */
	@RequestMapping("accessDeniedView")
	public String accessDeniedView() {
		return "auth/accessDeniedView";
	}
	//@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping("/owner")
	public String owner() {
		return "owner.tiles";
	}
}
