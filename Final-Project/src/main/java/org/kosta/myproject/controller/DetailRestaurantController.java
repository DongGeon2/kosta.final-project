package org.kosta.myproject.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.vo.MemberVO;
import org.kosta.myproject.model.vo.MyPickVO;
import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.RestaurantVO;
import org.kosta.myproject.model.vo.ReviewVO;
import org.kosta.myproject.service.MyPickService;
import org.kosta.myproject.service.ReservationService;
import org.kosta.myproject.service.RestaurantService;
import org.kosta.myproject.service.ReviewService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DetailRestaurantController {
	@Resource
	private ReservationService reservationService;
	@Resource
	private RestaurantService restaurantService;
	@Resource
	private ReviewService reviewService;
	@Resource
	private MyPickService myPickService;

	@RequestMapping("/detailRestaurant")
	public String detailRestaurant(Model model, String resNo, String pageNo) {

		/** 회원이 로그인 했는지 안했는지 먼저 판단하고 로그인 했으면 if문 아래로 쭉 실행 **/
		Authentication aut = SecurityContextHolder.getContext().getAuthentication();
		if (!aut.getName().equals("anonymousUser")) {
			MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			model.addAttribute("mvo", mvo);
			/**마이픽 체크**/
	         String id=mvo.getId();
	          boolean flag=false;
	            if(id!=null) { //로그인 했을 시 마이픽 리스트 불러오기
	            List<MyPickVO> myPickList=myPickService.findMyPickListById(id);
	               for (int i = 0; i < myPickList.size(); i++) {//로그인한 id에 마이픽 리스트가 있을시 채워진 별표 표시를 위해 true반환
	                  if(myPickList.get(i).getRestaurantVO().getResNo().equals(resNo))
	                     flag=true;
	               }
	            }
	            model.addAttribute("flag",flag);
		}
		/** 어떤식당에서 예약할껀지 알기위해 해주는거 **/
		RestaurantVO restaurantVO = restaurantService.findRestaurantByResNo(resNo);
		model.addAttribute("restaurantVO", restaurantVO);
						 
		/** 별점 평균 **/
		String avg = reviewService.getAvgStar(resNo);
		if(avg==null || avg=="") {
			model.addAttribute("avgReviewGrade", 0);
			return "restaurant/detailRestaurant.tiles";
		}
		double resultAvgStar = Double.parseDouble(avg);
		resultAvgStar = Math.round(resultAvgStar * 10) / 10.0;
		model.addAttribute("avgReviewGrade", resultAvgStar);
		System.out.println("리뷰 평점:" + resultAvgStar);
		
		/** 리뷰 목록 및 페이징 **/
		int totalReviewCount = reviewService.getTotalReviewCount(resNo);
		PagingBean pagingBean = null;

		if (pageNo == null) {
			pagingBean = new PagingBean(totalReviewCount);
		} else {
			pagingBean = new PagingBean(totalReviewCount, Integer.parseInt(pageNo));
		}
		model.addAttribute("pagingBean", pagingBean);
		model.addAttribute("totalReviewCount", totalReviewCount);
		List<ReviewVO> getAllReview = reviewService.getAllReviewList(pagingBean, resNo);
		model.addAttribute("reviewList", getAllReview);

		for (int i = 0; i < getAllReview.size(); i++) {
			System.out.println("리뷰 리스트:" + getAllReview.get(i));
		}
		return "restaurant/detailRestaurant.tiles";
	}
}