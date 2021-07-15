package org.kosta.myproject;

import java.util.List;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.RecordVO;
import org.kosta.myproject.model.vo.ReservationVO;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.service.MemberService;
import org.kosta.myproject.service.RecordService;
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
	@Resource
	RecordService recordService;
	
	@Test
	void contextLoads() {
		
		List<ReservationVO> reservationList = reservationService.getReservationByIdAndResNo("java2","1");
		System.out.println(reservationList);
		System.out.println(reservationList.get(0).getRevTime());
	
	}
	/* tettstets */
}
