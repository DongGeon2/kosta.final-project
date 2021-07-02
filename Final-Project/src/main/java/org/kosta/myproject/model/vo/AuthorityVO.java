package org.kosta.myproject.model.vo;

public class AuthorityVO {
	private String authName;
	private UserVO userVO;
	public AuthorityVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AuthorityVO(String authName, UserVO userVO) {
		super();
		this.authName = authName;
		this.userVO = userVO;
	}
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	@Override
	public String toString() {
		return "AuthorityVO [authName=" + authName + ", userVO=" + userVO + "]";
	}
	
	
}
