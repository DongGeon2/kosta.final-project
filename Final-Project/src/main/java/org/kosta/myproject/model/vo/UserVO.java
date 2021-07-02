package org.kosta.myproject.model.vo;

public class UserVO {
	private String id;
	private String password;
	private String name;
	private String tel;
	private int isEnabled;
	private String userEmail;
	public UserVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserVO(String id, String password, String name, String tel, int isEnabled, String userEmail) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.tel = tel;
		this.isEnabled = isEnabled;
		this.userEmail = userEmail;
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
	public int getIsEnabled() {
		return isEnabled;
	}
	public void setIsEnabled(int isEnabled) {
		this.isEnabled = isEnabled;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", tel=" + tel + ", isEnabled="
				+ isEnabled + ", userEmail=" + userEmail + "]";
	}
	
}
