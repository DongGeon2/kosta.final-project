package org.kosta.myproject.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.service.MemberService;
import org.kosta.myproject.service.RestaurantService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@Resource
	MemberService memberService;
	@Resource
	private RestaurantService restaurantService;
	
	@RequestMapping(value = { "/", "home" })
	public String home(Model model) {
		// db, model 과 연동
		// tiles-config.xml 에 정의된 definition name인 home.tiles를 이용해
		// view를 제공
		ArrayList<RestaurantVO> restaurantList = restaurantService.getHomeRestaurantList();
		model.addAttribute("restaurantList", restaurantList);
		
		return "home.tiles";
	}
	
	@Secured("ROLE_ADMIN")
	//@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping("/admin/member_admin")
	public String memberadmin(Model model) {
		model.addAttribute("list", memberService.selectAuthority());
		return "admin/member_admin.tiles";
	}
	
	@RequestMapping("restaurant")
	public String restaurant() {
		return "restaurant/restaurant.tiles";
	}
	

	
	@RequestMapping("login")
	public String login() {
		return "login.tiles";
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("mypage")
	public String mypage() {
		return "member/mypage.tiles";
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
	@Secured("ROLE_OWNER")
	@RequestMapping("/owner")
	public String owner() {
		return "owner.tiles";
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping("/admin")
	public String admin2() {
		return "admin.tiles";
	}
	//@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Secured("ROLE_ADMIN")
	@RequestMapping("/admin/admin_page")
	public String admin() {
		return "admin/admin_page.tiles";
	}
	

	
	@RequestMapping("/user/test")
	public String test() {
		return "test";
	}

}
