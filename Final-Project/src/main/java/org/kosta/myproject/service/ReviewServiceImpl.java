package org.kosta.myproject.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.mapper.ReviewMapper;
import org.kosta.myproject.model.vo.ReviewVO;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Resource
	private ReviewMapper reviewMapper;

	@Override
	public void registerReview(ReviewVO reviewVO) {
		reviewMapper.registerReview(reviewVO);
	}

	@Override
	public List<ReviewVO> getAllReviewByResNo(String resNo) {
		return reviewMapper.getAllReviewByResNo(resNo);
	}
}
