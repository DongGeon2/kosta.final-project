package org.kosta.myproject.model.vo;

public class AuthorityVO {
	private String authName;
	private MemberVO memberVO;
	public AuthorityVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AuthorityVO(String authName, MemberVO memberVO) {
		super();
		this.authName = authName;
		this.memberVO = memberVO;
	}
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}
	public MemberVO getUserVO() {
		return memberVO;
	}
	public void setUserVO(MemberVO userVO) {
		this.memberVO = userVO;
	}
	@Override
	public String toString() {
		return "AuthorityVO [authName=" + authName + ", userVO=" + memberVO + "]";
	}
	
	
}
