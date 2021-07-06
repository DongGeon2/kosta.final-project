package org.kosta.myproject;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.ReservationVO;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.service.ReservationService;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.context.SecurityContextHolder;

@SpringBootTest
class FinalProjectApplicationTests {
	@Resource
	ReservationService reservationService;
	@Test
	void contextLoads() {
		MemberVO mvo = new MemberVO();
		RestaurantVO resVO = new RestaurantVO();
		resVO.setResNo("1");
		mvo.setId("java");
		ReservationVO revVO = new ReservationVO();
		revVO.setRevTime("11");
		revVO.setHeadCount(3);
		revVO.setMemberVO(mvo);
		revVO.setRestaurantVO(resVO);
		reservationService.registerReservation(revVO);
	}
	/* tettstets */
}
