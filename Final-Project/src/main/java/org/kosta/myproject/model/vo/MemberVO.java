package org.kosta.myproject.model.vo;


public class MemberVO {
	private String id;
	private String password;
	private String email;
	private String name;
	private String tel;
	private String enabled;
	public MemberVO() {
		super();
		
	}
	public MemberVO(String id, String password, String email, String name, String tel, String enabled) {
		super();
		this.id = id;
		this.password = password;
		this.email = email;
		this.name = name;
		this.tel = tel;
		this.enabled = enabled;
	}
	public MemberVO(String id, String password, String email, String name, String tel) {
		super();
		this.id = id;
		this.password = password;
		this.email = email;
		this.name = name;
		this.tel = tel;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", email=" + email + ", name=" + name + ", tel=" + tel
				+ ", enabled=" + enabled + "]";
	}
	
	
}
