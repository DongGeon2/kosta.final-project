package org.kosta.myproject.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.mapper.BoardMapper;
import org.kosta.myproject.model.vo.BoardVO;
import org.kosta.myproject.model.vo.CommentVO;
import org.kosta.myproject.model.vo.PagingBean;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Resource
	private BoardMapper boardMapper;
	
	@Override
	public void posting(BoardVO boardVO) {
		boardMapper.posting(boardVO);
	}

	@Override
	public BoardVO getDetailPostByNo(String boardNo) {
		return boardMapper.getDetailPostByNo(boardNo);
	}

	@Override
	public int getTotalCount() {
		return boardMapper.getTotalList();
	}

	@Override
	public ArrayList<BoardVO> postList(PagingBean pagingBean) {
		int getStartRowNumber = pagingBean.getStartRowNumber();
		int getEndRowNumber = pagingBean.getEndRowNumber();
		return boardMapper.postList(getStartRowNumber, getEndRowNumber);
	}

	@Override
	public void deletePosting(String boardNo) {
		boardMapper.deletePosting(boardNo);
	}

	@Override
	public void postComment(CommentVO commentVO) {
		boardMapper.postComment(commentVO);		
	}

	@Override
	public int getTotalCommentCount(String boardNo) {
		return boardMapper.getTotalCommentCount(boardNo);
	}
	
	@Override
	public ArrayList<CommentVO> getCommentList(PagingBean pagingBean,String boardNo) {
		int getStartRowNumber = pagingBean.getStartRowNumber();
		int getEndRowNumber = pagingBean.getEndRowNumber();
		return boardMapper.getCommentList(getStartRowNumber, getEndRowNumber,boardNo);
	}

	@Override
	public boolean plusHits(String boardNo) {
		return boardMapper.plusHits(boardNo);
	}

	@Override
	public List<BoardVO> getPostById(String id) {
		return boardMapper.getPostById(id);
	}

}
