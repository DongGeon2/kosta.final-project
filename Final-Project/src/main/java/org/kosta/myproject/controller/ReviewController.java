package org.kosta.myproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.model.vo.ReviewVO;
import org.kosta.myproject.service.ReviewService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReviewController {
	@Resource
	private ReviewService reviewService;

	@Secured("ROLE_MEMBER")
	@PostMapping("/registerReview")
	public String registerReview(String message, String id, String title, String resNo, String star1, String star2, String star3, String star4, String star5) {
		ArrayList<String> reviewGrade = new ArrayList<String>();
		reviewGrade.add(star1);
		reviewGrade.add(star2);
		reviewGrade.add(star3);
		reviewGrade.add(star4);
		reviewGrade.add(star5);
		String grade = null;
		
		ReviewVO reviewVO = new ReviewVO();
		MemberVO memberVO = new MemberVO();
		RestaurantVO restaurantVO = new RestaurantVO();
		restaurantVO.setResNo(resNo);
		memberVO.setId(id);
		reviewVO.setMemberVO(memberVO);
		reviewVO.setRestaurantVO(restaurantVO);
		reviewVO.setReviewImage("이미지경로");
		
		for(int i=0; i<reviewGrade.size(); i++) {
			if(reviewGrade.get(i)!=null & reviewGrade.get(i)!="") {
				grade = reviewGrade.get(i);
			}
		}
		reviewVO.setReviewGrade(grade);
		reviewVO.setReviewContent(message);
		reviewVO.setReviewTitle(title);
		reviewService.registerReview(reviewVO);
		return "redirect:/detailRestaurant?resNo=" + resNo;
		//detailRestaurant
	}
	
	/*
	 * @Secured("ROLE_MEMBER")
	 * @RequestMapping("/resultReview") public String resultReview(Model model,
	 * String resNo) { List<ReviewVO> reviewList =
	 * reviewService.getAllReviewByResNo(resNo); model.addAttribute("reviewList",
	 * reviewList); System.out.println(reviewList); return "detailRestaurant.tiles";
	 * }
	 */
}
