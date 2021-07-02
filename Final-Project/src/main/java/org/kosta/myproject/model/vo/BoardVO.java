package org.kosta.myproject.model.vo;

public class BoardVO {
	private String boardNo;
	private String boardTitle;
	private String boardContent;
	private UserVO userVO;
	private int hits;
	private String boardRegdate;
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardVO(String boardNo, String boardTitle, String boardContent, UserVO userVO, int hits,
			String boardRegdate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.userVO = userVO;
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
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
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
				+ ", userVO=" + userVO + ", hits=" + hits + ", boardRegdate=" + boardRegdate + "]";
	}
	
}
