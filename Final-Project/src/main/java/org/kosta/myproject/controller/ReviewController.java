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
		System.out.println(id);
		System.out.println(pvo);
		if(id==null || id=="") {
			return "redirect:reviewFail2";
		}
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
		reviewVO.setReviewImage("???????????????");
		
		for(int i=0; i<reviewGrade.size(); i++) {
			if(reviewGrade.get(i)!=null & reviewGrade.get(i)!="") {
				grade = reviewGrade.get(i);
			}
		}
		reviewVO.setReviewGrade(grade);
		reviewVO.setReviewContent(message);
		reviewVO.setReviewTitle(title);
		
		/** ?????? ????????? ??????????????? ???????????? ?????? ????????? ?????? ?????? ?????? ?????? **/
		List<RecordVO> recordList = recordService.findRecordByIdAndResNo(memberId,resNo);
		/** ????????? ????????? ????????? if??? ?????? **/
		if(!recordList.isEmpty()) {
			for(int i=0; i<recordList.size(); i++) {
				/** ?????????????????? **/
				if(recordList.get(i).getRecordCheck().equals("1")) {
					reviewService.registerReview(reviewVO);
					String recordTime = recordList.get(i).getRecordTime();
					recordService.updateCheck(memberId,recordTime,resNo);
					return "redirect:/detailRestaurant?resNo=" + resNo;
				}
			}
		}
		
		/** ????????? ????????? ????????? **/
		return "redirect:reviewFail?id="+id;
		//detailRestaurant
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("reviewFail")
	public String reviewFail(String id, Model model) {
		model.addAttribute("id", id);
		return "restaurant/review-fail";
	}

	@Secured("ROLE_MEMBER")
	@RequestMapping("reviewFail2")
	public String reviewFail2() {
		return "restaurant/review-fail2";
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
