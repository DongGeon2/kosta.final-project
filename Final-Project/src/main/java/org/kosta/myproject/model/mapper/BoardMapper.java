package org.kosta.myproject.model.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.vo.BoardVO;
import org.kosta.myproject.model.vo.CommentVO;

@Mapper
public interface BoardMapper {

	void posting(BoardVO boardVO);

	BoardVO getDetailPostByNo(String boardNo);

	public int getTotalList();
	
	public ArrayList<BoardVO> postList(int getStartRowNumber, int getEndRowNumber);

	void deletePosting(String boardNo);
	
	void postComment(CommentVO commentVO);
	
	/* 게시판댓글 */
	int getTotalCommentCount(String boardNo);
	
	public ArrayList<CommentVO> getCommentList(int getStartRowNumber, int getEndRowNumber,String boardNo);

	public boolean plusHits(String boardNo);

	List<BoardVO> getPostById(String id);
	
	void deleteCommentByNo(String boardNo, String commentNo);
}
