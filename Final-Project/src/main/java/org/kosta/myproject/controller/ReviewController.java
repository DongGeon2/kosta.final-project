package org.kosta.myproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.RecordVO;
import org.kosta.myproject.model.vo.ReservationVO;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.model.vo.ReviewVO;
import org.kosta.myproject.service.RecordService;
import org.kosta.myproject.service.ReservationService;
import org.kosta.myproject.service.ReviewService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	@Resource
	private ReviewService reviewService;
	@Resource
	private ReservationService reservationService;
	@Resource
	private RecordService recordService;

	@Secured("ROLE_MEMBER")
	@PostMapping("/registerReview")
	public String registerReview(String message, String id, String title, String resNo, String star1, String star2, String star3, String star4, String star5) {
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memberId = pvo.getId();
		
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
		
		/** 리뷰 작성시 식당예약을 한사람은 예약 한번당 리뷰 한개 작성 가능 **/
		List<RecordVO> recordList = recordService.findRecordByIdAndResNo(memberId,resNo);
		/** 예약한 기록이 있다면 if문 실행 **/
		if(!recordList.isEmpty()) {
			for(int i=0; i<recordList.size(); i++) {
				/** 작성가능할때 **/
				if(recordList.get(i).getRecordCheck().equals("1")) {
					reviewService.registerReview(reviewVO);
					String recordTime = recordList.get(i).getRecordTime();
					recordService.updateCheck(memberId,recordTime,resNo);
					return "redirect:/detailRestaurant?resNo=" + resNo;
				}
			}
		}
		
		/** 예약한 기록이 없을때 **/
		return "redirect:reviewFail?id="+id;
		//detailRestaurant
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("reviewFail")
	public String reviewFail(String id, Model model) {
		model.addAttribute("id", id);
		return "restaurant/review-fail";
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
