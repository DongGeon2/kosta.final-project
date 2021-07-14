package org.kosta.myproject;

import java.util.List;

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
		List<ReservationVO> reservationDayList = reservationService.getReservationListByDay("2021-07-13","1");
		for(int i=0; i<reservationDayList.size(); i++) {
			System.out.println(reservationDayList.get(i));
		}
	}
	/* tettstets */
}
