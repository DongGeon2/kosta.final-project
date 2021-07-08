package org.kosta.myproject;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.service.RestaurantService;
import org.kosta.myproject.service.ReviewService;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class FinalProjectApplicationTests {
	@Resource
	ReviewService reviewService;
	@Resource
	RestaurantService restaurantService;
	
	@Test
	void contextLoads() {
		RestaurantVO restaurantVO = restaurantService.findRestaurantByResNo("4");
		System.out.println(restaurantVO);
	}
	/* tettstets */
}
