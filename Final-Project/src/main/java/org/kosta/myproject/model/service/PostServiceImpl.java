package org.kosta.myproject.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.kosta.myproject.model.mapper.MemberMapper;
import org.kosta.myproject.model.vo.PagingBean;
import org.kosta.myproject.model.vo.PostVO;
import org.springframework.stereotype.Service;

@Service
public class PostServiceImpl implements PostService {
	@Resource
	private MemberMapper memberMapper;

	@Override
	public int getTotalCount() {
		return memberMapper.getTotalCount();
	}
	
	@Override
	public ArrayList<PostVO> getList(PagingBean pagingBean){
		System.out.println("totalCount:"+pagingBean.getTotalPostCount());
		
		int getStartRowNumber = pagingBean.getStartRowNumber();
		int getEndRowNumber = pagingBean.getEndRowNumber();
		System.out.println(getStartRowNumber+" "+getEndRowNumber+" "+pagingBean.getStartPageOfPageGroup()+" "+pagingBean.getEndPageOfPageGroup());
		return memberMapper.getPostingList(getStartRowNumber, getEndRowNumber);
	}
}
