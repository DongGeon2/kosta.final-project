package org.kosta.myproject.model.vo;

public class CommentVO {
	private String commentNo;
	private String commentContent;
	private String commentTime;
	private MemberVO memberVO;
	private BoardVO boardVO;
	public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentVO(String commentNo, String commentContent, String commentTime, MemberVO memberVO, BoardVO boardVO) {
		super();
		this.commentNo = commentNo;
		this.commentContent = commentContent;
		this.commentTime = commentTime;
		this.memberVO = memberVO;
		this.boardVO = boardVO;
	}
	public String getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(String commentNo) {
		this.commentNo = commentNo;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(String commentTime) {
		this.commentTime = commentTime;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public BoardVO getBoardVO() {
		return boardVO;
	}
	public void setBoardVO(BoardVO boardVO) {
		this.boardVO = boardVO;
	}
	@Override
	public String toString() {
		return "CommentVO [commentNo=" + commentNo + ", commentContent=" + commentContent + ", commentTime="
				+ commentTime + ", memberVO=" + memberVO + ", boardVO=" + boardVO + "]";
	}

	
}
