package org.kosta.myproject.model.vo;

public class StarMemberVO {
	private String id;
	private String name;
	private String content;
	private String timePosted;
	public StarMemberVO() {
		super();
	}
	public StarMemberVO(String id, String name, String content, String timePosted) {
		super();
		this.id = id;
		this.name = name;
		this.content = content;
		this.timePosted = timePosted;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTimePosted() {
		return timePosted;
	}
	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}
	@Override
	public String toString() {
		return "StarMemberVO [id=" + id + ", name=" + name + ", content=" + content + ", timePosted=" + timePosted
				+ "]";
	}
	
}
