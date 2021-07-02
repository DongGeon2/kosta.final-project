package org.kosta.myproject.model.vo;

public class BoardVO {
	private String boardNo;
	private String boardTitle;
	private String boardContent;
	private MemberVO memberVO;
	private int hits;
	private String boardRegdate;
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardVO(String boardNo, String boardTitle, String boardContent, MemberVO memberVO, int hits,
			String boardRegdate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.memberVO = memberVO;
		this.hits = hits;
		this.boardRegdate = boardRegdate;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getBoardRegdate() {
		return boardRegdate;
	}
	public void setBoardRegdate(String boardRegdate) {
		this.boardRegdate = boardRegdate;
	}
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", memberVO=" + memberVO + ", hits=" + hits + ", boardRegdate=" + boardRegdate + "]";
	}

}
