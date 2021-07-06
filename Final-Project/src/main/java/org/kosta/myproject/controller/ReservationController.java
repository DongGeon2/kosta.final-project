package org.kosta.myproject.controller;

import javax.annotation.Resource;

import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.ReservationVO;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.service.ReservationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {
	@Resource
	private ReservationService reservationService;

	@RequestMapping("/user/doReservation")
	public String doReservation() {
		return "reservation-form";
	}

	@PostMapping("/user/doReservation2")
	public String doReservation2(String revTime, int headCount, String id, String resNo, Model model) {
		MemberVO mvo = new MemberVO();
		RestaurantVO resVO = new RestaurantVO();
		resVO.setResNo(resNo);
		mvo.setId(id);
		ReservationVO revVO = new ReservationVO();
		revVO.setRevTime(revTime);
		revVO.setHeadCount(headCount);
		revVO.setMemberVO(mvo);
		revVO.setRestaurantVO(resVO);
		reservationService.registerReservation(revVO);
		return "redirect:registerReservationResult";
	}

	@RequestMapping("registerReservationResult")
	public String registerReservationResult() {
		return "reservation-result.tiles";
	}

}
