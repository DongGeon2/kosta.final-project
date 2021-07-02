package org.kosta.myproject.model.vo;

public class MyPickVO {
	private String myRegdate;
	private MemberVO memberVO;
	private RestaurantVO restaurantVO;
	public MyPickVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyPickVO(String myRegdate, MemberVO memberVO, RestaurantVO restaurantVO) {
		super();
		this.myRegdate = myRegdate;
		this.memberVO = memberVO;
		this.restaurantVO = restaurantVO;
	}
	public String getMyRegdate() {
		return myRegdate;
	}
	public void setMyRegdate(String myRegdate) {
		this.myRegdate = myRegdate;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public RestaurantVO getRestaurantVO() {
		return restaurantVO;
	}
	public void setRestaurantVO(RestaurantVO restaurantVO) {
		this.restaurantVO = restaurantVO;
	}
	@Override
	public String toString() {
		return "MyPickVO [myRegdate=" + myRegdate + ", memberVO=" + memberVO + ", restaurantVO=" + restaurantVO + "]";
	}

	
}
