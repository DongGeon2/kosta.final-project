package org.kosta.myproject.model.vo;

public class CommentVO {
	private String comNo;
	private String comContent;
	private String comRegdate;
	private MemberVO memberVO;
	private BoardVO boardVO;
	public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentVO(String comNo, String comContent, String comRegdate, MemberVO memberVO, BoardVO boardVO) {
		super();
		this.comNo = comNo;
		this.comContent = comContent;
		this.comRegdate = comRegdate;
		this.memberVO = memberVO;
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
		return "CommentVO [comNo=" + comNo + ", comContent=" + comContent + ", comRegdate=" + comRegdate + ", memberVO="
				+ memberVO + ", boardVO=" + boardVO + "]";
	}

	
}
