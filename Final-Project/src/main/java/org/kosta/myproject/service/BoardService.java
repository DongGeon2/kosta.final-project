package org.kosta.myproject.service;

import java.util.ArrayList;

import org.kosta.myproject.model.vo.BoardVO;
import org.kosta.myproject.model.vo.CommentVO;
import org.kosta.myproject.model.vo.PagingBean;

public interface BoardService {
	
	void posting(BoardVO boardVO);

	public BoardVO getDetailPostByNo(String boardNo);

	int getTotalCount();

	ArrayList<BoardVO> postList(PagingBean pagingBean);

	void deletePosting(String boardNo);
	
	void postComment(CommentVO commentVO);
	
	int getTotalCommentCount(String boardNo);
	
	ArrayList<CommentVO> getCommentList(PagingBean pagingBean, String boardNo);
	
	public boolean plusHits(String boardNo);
}