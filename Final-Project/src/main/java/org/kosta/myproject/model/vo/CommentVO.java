package org.kosta.myproject.model.vo;

public class CommentVO {
	private String comNo;
	private String comContent;
	private String comRegdate;
	private UserVO userVO;
	private BoardVO boardVO;
	public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentVO(String comNo, String comContent, String comRegdate, UserVO userVO, BoardVO boardVO) {
		super();
		this.comNo = comNo;
		this.comContent = comContent;
		this.comRegdate = comRegdate;
		this.userVO = userVO;
		this.boardVO = boardVO;
	}
	public String getComNo() {
		return comNo;
	}
	public void setComNo(String comNo) {
		this.comNo = comNo;
	}
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
	public String getComRegdate() {
		return comRegdate;
	}
	public void setComRegdate(String comRegdate) {
		this.comRegdate = comRegdate;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public BoardVO getBoardVO() {
		return boardVO;
	}
	public void setBoardVO(BoardVO boardVO) {
		this.boardVO = boardVO;
	}
	@Override
	public String toString() {
		return "CommentVO [comNo=" + comNo + ", comContent=" + comContent + ", comRegdate=" + comRegdate + ", userVO="
				+ userVO + ", boardVO=" + boardVO + "]";
	}
	
}
