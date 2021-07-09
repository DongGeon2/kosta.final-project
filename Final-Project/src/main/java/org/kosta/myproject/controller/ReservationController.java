package org.kosta.myproject.controller;

import javax.annotation.Resource;

import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.ReservationVO;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.service.ReservationService;
import org.kosta.myproject.service.RestaurantService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {
	@Resource
	private ReservationService reservationService;
	@Resource
	private RestaurantService restaurantService;
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping("/doReservation")
	public String doReservation(Model model, String resName, String resNo) {
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("resName", resName);
		model.addAttribute("resNo", resNo);
		model.addAttribute("memberVO", pvo);
		return "reservation/reservation-form.tiles";
	}
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/doReservation2")
	public String doReservation2(String id, String revTime, int headCount, String resNo, Model model) {
		MemberVO mvo = new MemberVO();
		RestaurantVO resVO = new RestaurantVO();
		resVO.setResNo(resNo);
		mvo.setId(id);
		ReservationVO revVO = new ReservationVO();
		revVO.setRevTime(revTime);
		revVO.setHeadCount(headCount);
		revVO.setMemberVO(mvo);
		revVO.setRestaurantVO(resVO);
		System.out.println("예약등록"+revVO);
		reservationService.registerReservation(revVO);
		return "redirect:registerReservationResult?memberId=" + id + "&resNo=" + resVO.getResNo() + "&revTime="
				+ revVO.getRevTime() + "&headCount=" + revVO.getHeadCount();
	}
	
	@RequestMapping("/registerReservationResult")
	public String registerReservationResult(String memberId, String resNo, String revTime, int headCount, Model model) {
		RestaurantVO restaurantVO = new RestaurantVO();
		MemberVO memberVO = new MemberVO();
		memberVO.setId(memberId);
		restaurantVO.setResNo(resNo);
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setHeadCount(headCount);
		reservationVO.setRevTime(revTime);
		reservationVO.setMemberVO(memberVO);
		reservationVO.setRestaurantVO(restaurantVO);
		model.addAttribute("reservation", reservationVO);
		return "reservation/reservation-result.tiles";
	}

}
