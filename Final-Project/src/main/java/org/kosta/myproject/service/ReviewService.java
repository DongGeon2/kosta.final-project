package org.kosta.myproject.service;

import java.util.List;

import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.ReviewVO;

public interface ReviewService {

	void registerReview(ReviewVO reviewVO);

	List<ReviewVO> getAllReviewByResNo(String resNo);

	List<ReviewVO> getAllReviewList(PagingBean pagingBean, String resNo);

	int getTotalReviewCount(String resNo);
	
}