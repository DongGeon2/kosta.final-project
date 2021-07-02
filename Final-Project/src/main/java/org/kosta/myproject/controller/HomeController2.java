package org.kosta.myproject.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.kosta.myproject.model.service.RestaurantService;
import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.PostVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController2 {
	@Resource
	RestaurantService postService;

	@RequestMapping(value = { "/", "home" })
	public String home() {
		// db, model 과 연동
		// tiles-config.xml 에 정의된 definition name인 home.tiles를 이용해
		// view를 제공
		return "home.tiles";
	}

	@RequestMapping("about")
	public String about(Model model, String pageNo) {
		int totalPostcount = postService.getTotalCount();

		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalPostcount);
		} else {
			pagingBean = new PagingBean(totalPostcount, Integer.parseInt(pageNo));
		}
		model.addAttribute("pagingBean", pagingBean);
		ArrayList<PostVO> list = postService.getList(pagingBean);
		model.addAttribute("list", list);
		return "about.tiles";
	}

	@RequestMapping("event")
	public String event() {
		return "event.tiles";
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
	 * 동건 singlePage Test
	 */
	@RequestMapping("single")
	public String single() {
		return "single.tiles";
	}

	@RequestMapping("register")
	public String register() {
		return "register.tiles";
	}

	@RequestMapping("login")
	public String contact() {
		return "login.tiles";
	}
}
