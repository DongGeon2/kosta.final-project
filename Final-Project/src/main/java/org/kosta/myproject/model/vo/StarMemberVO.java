package org.kosta.myproject.model.vo;

public class StarMemberVO {
	private String id;
	private String name;
	public StarMemberVO() {
		super();
	}
	public StarMemberVO(String id, String name) {
		super();
		this.id = id;
		this.name = name;
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
	@Override
	public String toString() {
		return "StarMemberVO [id=" + id + ", name=" + name + "]";
	}
	
	
}
