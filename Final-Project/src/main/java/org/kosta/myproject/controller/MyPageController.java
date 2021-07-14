package org.kosta.myproject.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.ReservationVO;
import org.kosta.myproject.model.vo.ReviewVO;
import org.kosta.myproject.service.BoardService;
import org.kosta.myproject.service.ReservationService;
import org.kosta.myproject.service.RestaurantService;
import org.kosta.myproject.service.ReviewService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	@Resource
	ReviewService reviewService;
	@Resource
	RestaurantService restaurantService;
	@Resource
	ReservationService reservationService;
	@Resource
	BoardService boardService;
	

	@Secured("ROLE_MEMBER")
	@RequestMapping("/myReview")
	public String myReview(Model model, String id) {
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(pvo.getId());
		List<ReviewVO> rvo = reviewService.getReviewById(pvo.getId());
		System.out.println(rvo);
		model.addAttribute("reviewVO", rvo);
		return "member/myReview.tiles";
	}

	@Secured("ROLE_MEMBER")
	@RequestMapping("/myOrder") 
	public String myOrder(Model model) { 
	MemberVO pvo = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	System.out.println(pvo.getId()); 
	List<ReservationVO> rvo=reservationService.findReservationById(pvo.getId());
	//System.out.println(rvo); model.addAttribute("reservation", rvo); 
	return "member/myOrder.tiles"; 
	}
	//id랑 식당번호 없어서 vo 들이 null임 그치만 sql 은 됨 

}
