package org.kosta.myproject.model.vo;

public class MyPickVO {
	private String pickNo;
	private MemberVO memberVO;
	private RestaurantVO restaurantVO;

	public MyPickVO() {
		super();

	}
	public MyPickVO(String pickNo, MemberVO memberVO, RestaurantVO restaurantVO) {
		super();
		this.pickNo = pickNo;
		this.memberVO = memberVO;
		this.restaurantVO = restaurantVO;
	}

	public String getPickNo() {
		return pickNo;
	}

	public void setPickNo(String pickNo) {
		this.pickNo = pickNo;
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
		return "MyPickVO [pickNo=" + pickNo + ", memberVO=" + memberVO + ", restaurantVO=" + restaurantVO + "]";
	}

}