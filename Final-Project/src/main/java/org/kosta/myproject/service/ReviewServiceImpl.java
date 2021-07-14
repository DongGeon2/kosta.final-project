package org.kosta.myproject.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.mapper.ReviewMapper;
import org.kosta.myproject.model.vo.PagingBean;
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

	@Override
	public List<ReviewVO> getAllReviewList(PagingBean pagingBean, String resNo) {
		int getStartRowNumber = pagingBean.getStartRowNumber();
		int getEndRowNumber = pagingBean.getEndRowNumber();
		return reviewMapper.getAllReviewList(getStartRowNumber,getEndRowNumber, resNo);
	}

	@Override
	public int getTotalReviewCount(String resNo) {
		return reviewMapper.getTotalReviewCount(resNo);
	}

	@Override
	public String getAvgStar(String resNo) {
		return reviewMapper.getAvgStar(resNo);
	}
	
	@Override
	public List<ReviewVO> getReviewById(String id) {
		return reviewMapper.getReviewById(id);
	}
}
