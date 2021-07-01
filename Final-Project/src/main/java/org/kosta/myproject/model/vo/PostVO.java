package org.kosta.myproject.model.vo;

public class PostVO {
	private String no;
	private String title;
	private String content;
	private StarMemberVO smVO;
	public PostVO() {
		super();
	}
	public PostVO(String no, String title, String content, StarMemberVO smVO) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.smVO = smVO;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
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
	public StarMemberVO getSmVO() {
		return smVO;
	}
	public void setSmVO(StarMemberVO smVO) {
		this.smVO = smVO;
	}
	@Override
	public String toString() {
		return "PostVO [no=" + no + ", title=" + title + ", content=" + content + ", smVO=" + smVO + "]";
	}
	
	
}
