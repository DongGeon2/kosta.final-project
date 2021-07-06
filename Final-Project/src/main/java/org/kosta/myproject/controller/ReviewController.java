package org.kosta.myproject.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.model.vo.ReviewVO;
import org.kosta.myproject.service.ReviewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	@Resource
	private ReviewService reviewService;
	
	@PostMapping("/user/registerReview")
	public String registerReview(String message, String id, String title) {
		ReviewVO reviewVO = new ReviewVO();
		MemberVO memberVO = new MemberVO();
		RestaurantVO restaurantVO = new RestaurantVO();
		restaurantVO.setResNo("3");
		memberVO.setId(id);
		reviewVO.setMemberVO(memberVO);
		reviewVO.setRestaurantVO(restaurantVO);
		reviewVO.setReviewImage("이미지경로");
		reviewVO.setResGrade(3);
		reviewVO.setReviewGrade("4");
		reviewVO.setReviewContent(message);
		reviewVO.setReviewTitle(title);
		reviewService.registerReview(reviewVO);
		return "redirect:resultReview";
	}
	@RequestMapping("resultReview")
	public String resultReview(Model model) {
		List<ReviewVO> reviewList = reviewService.getAllReview();
		model.addAttribute("reviewVO", reviewList);
		System.out.println(reviewList);
		return "restaurant.tiles";
	}
}
