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
	@RequestMapping("event")
	public String event() {
		return "event.tiles";
	}
	
	@RequestMapping("contact")
	public String contact() {
		return "contact.tiles";
	}
	@RequestMapping("services")
	public String services() {
		return "services.tiles";
	}
	@RequestMapping("landing-single")
	public String landingServices() {
		return "landing-single.tiles";
	}
	@RequestMapping("mypage")
	public String mypage() {
		return "mypage.tiles";
	}
	@RequestMapping("recommend")
	public String recommend() {
		return "recommend.tiles";
	}
	
	/**
	 * 동건
	 * singlePage Test
	 */
	@RequestMapping("single")
	public String single() {
		return "single.tiles";
	}
}







