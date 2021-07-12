package org.kosta.myproject;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.ReservationVO;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.service.MemberService;
import org.kosta.myproject.service.ReservationService;
import org.kosta.myproject.service.RestaurantService;
import org.kosta.myproject.service.ReviewService;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class FinalProjectApplicationTests {
	@Resource
	ReviewService reviewService;
	@Resource
	RestaurantService restaurantService;
	@Resource
	ReservationService reservationService;
	@Resource
	MemberService memberService;
	@Test
	void contextLoads() {
		/*
		 * MemberVO mvo = new MemberVO(); RestaurantVO resVO = new RestaurantVO();
		 * resVO.setResNo("4"); mvo.setId("java"); ReservationVO revVO = new
		 * ReservationVO(); revVO.setRevTime("1123"); revVO.setHeadCount(9);
		 * revVO.setMemberVO(mvo); revVO.setRestaurantVO(resVO);
		 * System.out.println("예약등록"+revVO);
		 * reservationService.registerReservation(revVO); System.out.println("완료");
		 */
		System.out.println(memberService.ownerCancel("KDG"));
	}
	/* tettstets */
}
