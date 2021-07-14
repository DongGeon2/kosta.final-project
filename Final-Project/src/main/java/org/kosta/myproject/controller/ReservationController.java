package org.kosta.myproject.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.ReservationVO;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.service.ReservationService;
import org.kosta.myproject.service.RestaurantService;
import org.springframework.security.access.annotation.Secured;
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
	//@PreAuthorize("hasRole('ROLE_MEMBER')")
	@Secured("ROLE_MEMBER")
	@RequestMapping("/doReservation")
	public String doReservation(Model model, String resName, String resNo, String startTime, String endTime) {
		MemberVO pvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("resName", resName);
		model.addAttribute("resNo", resNo);
		System.out.println("");
		System.out.println(resNo);
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		model.addAttribute("memberVO", pvo);
		return "reservation/reservation-form.tiles";
	}
	//@PreAuthorize("hasRole('ROLE_MEMBER')")
	@Secured("ROLE_MEMBER")
	@PostMapping("/doReservation2")
	public String doReservation2(String id, String revTime, int headCount, String resNo, String hour) {
		MemberVO mvo = new MemberVO();
		RestaurantVO resVO = new RestaurantVO();
		resVO.setResNo(resNo);
		mvo.setId(id);
		ReservationVO revVO = new ReservationVO();
		revVO.setRevTime(revTime);
		revVO.setRevHour(hour);
		revVO.setHeadCount(headCount);
		revVO.setMemberVO(mvo);
		revVO.setRestaurantVO(resVO);
		
		/** 동일한날 동일한 시간에 예약 돼있으면 예약 안됨 **/
		List<ReservationVO> reservationDayList = reservationService.getReservationListByDay(revTime,resNo);
		for(int i=0; i<reservationDayList.size(); i++) {
			System.out.println("날짜:"+revTime+" , " +reservationDayList.get(i).getRevTime());
			System.out.println("시간:"+hour+" , " +reservationDayList.get(i).getRevHour());
			if(reservationDayList.get(i).getRevTime().equals(revTime) && reservationDayList.get(i).getRevHour().equals(hour)) {
				System.out.println("예약실패");
				return "redirect:registerReservationFail";
			}
		}
		
		System.out.println("예약등록"+revVO);
		reservationService.registerReservation(revVO);
		return "redirect:registerReservationResult?memberId=" + id + "&resNo=" + resVO.getResNo() + "&revTime="
				+ revVO.getRevTime() + "&headCount=" + revVO.getHeadCount() + "&hour=" + revVO.getRevHour();
	}
	
	
	/** 예약 성공시 **/
	@RequestMapping("/registerReservationResult")
	public String registerReservationResult(String memberId, String resNo, String revTime, String hour, int headCount, Model model) {
		RestaurantVO restaurantVO = new RestaurantVO();
		MemberVO memberVO = new MemberVO();
		memberVO.setId(memberId);
		restaurantVO.setResNo(resNo);
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setHeadCount(headCount);
		reservationVO.setRevTime(revTime);
		reservationVO.setRevHour(hour);
		reservationVO.setMemberVO(memberVO);
		reservationVO.setRestaurantVO(restaurantVO);
		model.addAttribute("reservation", reservationVO);
		return "reservation/reservation-result.tiles";
	}

	/** 예약 실패시 **/
	@RequestMapping("registerReservationFail")
	public String registerReservationFail() {
		return "home.tiles";
	}
}