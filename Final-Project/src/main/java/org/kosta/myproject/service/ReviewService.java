package org.kosta.myproject.service;

import java.util.List;

import org.kosta.myproject.model.vo.ReviewVO;

public interface ReviewService {

	void registerReview(ReviewVO reviewVO);

	List<ReviewVO> getAllReview();
	
}