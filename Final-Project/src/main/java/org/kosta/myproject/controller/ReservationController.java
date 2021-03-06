package org.kosta.myproject.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.ReservationVO;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.service.RecordService;
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
	@Resource
	private RecordService recordService;
	
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
		
		/** ????????? ????????? ??????????????? ??????????????? ?????? ?????? **/
		List<ReservationVO> reservationList = reservationService.getReservationByIdAndResNo(id,resNo);
		/** ?????????????????? ??????????????? ????????? ??????????????? ????????? if??? ??????**/
		if(!reservationList.isEmpty()) {
			for(int i=0; i<reservationList.size(); i++) {
				if(reservationList.get(i).getRevTime().equals(revTime)) {
					System.out.println("???????????? ????????? ???????????? ?????????????????? ????????? ????????? ??????.");
					return "redirect:registerReservationFail?id="+id+"&revTime="+revTime;
				}
			}
		}
		
		/** ???????????? ????????? ???????????? ????????? ????????? ?????? ???????????? ?????? ?????? **/
		List<ReservationVO> reservationDayList = reservationService.getReservationListByDay(revTime,resNo);
		for(int i=0; i<reservationDayList.size(); i++) {
			System.out.println("??????:"+revTime+" , " +reservationDayList.get(i).getRevTime());
			System.out.println("??????:"+hour+" , " +reservationDayList.get(i).getRevHour());
			if(reservationDayList.get(i).getRevTime().equals(revTime) && reservationDayList.get(i).getRevHour().equals(hour)) {
				System.out.println("????????????");
				return "redirect:registerReservationFail2?id="+id+"&revTime="+revTime+"&hour="+hour;
			}
		}
		
		/** recordService??? ??????????????? ????????? ???????????? ???????????? ?????? ?????? ????????? **/
		recordService.registerRecordMember(id,revTime,resNo);
		reservationService.registerReservation(revVO);
		System.out.println("????????????"+revVO);
		return "redirect:registerReservationResult?memberId=" + id + "&resNo=" + resVO.getResNo() + "&revTime="
				+ revVO.getRevTime() + "&headCount=" + revVO.getHeadCount() + "&hour=" + revVO.getRevHour();
	}
	
	
	/** ?????? ????????? **/
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
		model.addAttribute("restaurantDetailLoc", reservationService.findRestaurantDetailLoc(resNo));
		model.addAttribute("reservation", reservationVO);
		return "reservation/reservation-result.tiles";
	}

	/** ???????????? ????????? ????????? ????????? ?????? ???????????? ?????? ?????? page **/
	@RequestMapping("registerReservationFail")
	public String registerReservationFail(String id, String revTime, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("revTime", revTime);
		return "reservation/reservation-fail";
	}
	
	/** ???????????? ????????? ?????? ????????? ????????? ????????? ???????????? ????????? ?????? page **/
	@RequestMapping("registerReservationFail2")
	public String registerReservationFail2(String id, String revTime, String hour, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("revTime", revTime);
		model.addAttribute("hour", hour);
		return "reservation/reservation-fail2";
	}
	
	@RequestMapping("/deleteReservation")
	public String deleteReservation(String revNo, String revTime, String id, String resNo) {
		reservationService.deleteReservation(revNo);
		recordService.deleteRecord(revTime, id, resNo);
		/* return "redirect:deleteReservationRecord"; */
		return "redirect:myOrder";
	}
	/*
	 * @RequestMapping("/deleteReservationRecord") public String
	 * deleteReservationRecord(String record_no) {
	 * reservationService.deleteReservationRecord(record_no); return
	 * "myOrder.tiles"; }
	 */
}