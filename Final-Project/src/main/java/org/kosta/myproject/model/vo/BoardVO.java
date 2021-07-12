package org.kosta.myproject.model.vo;

public class BoardVO {
	private String boardNo;
	private String title;
	private String content;
	private MemberVO memberVO;
	private int hits;
	private String timePosted;
	private String img;
	public BoardVO() {
		super();
	}
	public BoardVO(String boardNo, String title, String content, MemberVO memberVO, int hits, String timePosted,
			String img) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.memberVO = memberVO;
		this.hits = hits;
		this.timePosted = timePosted;
		this.img = img;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getTimePosted() {
		return timePosted;
	}
	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", memberVO=" + memberVO
				+ ", hits=" + hits + ", timePosted=" + timePosted + ", img=" + img + "]";
	}

}
