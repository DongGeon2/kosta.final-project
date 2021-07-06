package org.kosta.myproject.controller;

import org.springframework.stereotype.Controller;
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
	@RequestMapping("user/restaurant")
	public String restaurant() {
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

}







