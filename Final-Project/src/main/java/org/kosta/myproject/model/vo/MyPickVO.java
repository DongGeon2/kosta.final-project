package org.kosta.myproject.model.vo;

public class MyPickVO {
	private String myRegdate;
	private UserVO userVO;
	private RestaurantVO restaurantVO;
	public MyPickVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyPickVO(String myRegdate, UserVO userVO, RestaurantVO restaurantVO) {
		super();
		this.myRegdate = myRegdate;
		this.userVO = userVO;
		this.restaurantVO = restaurantVO;
	}
	public String getMyRegdate() {
		return myRegdate;
	}
	public void setMyRegdate(String myRegdate) {
		this.myRegdate = myRegdate;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public RestaurantVO getRestaurantVO() {
		return restaurantVO;
	}
	public void setRestaurantVO(RestaurantVO restaurantVO) {
		this.restaurantVO = restaurantVO;
	}
	@Override
	public String toString() {
		return "MyPickVO [myRegdate=" + myRegdate + ", userVO=" + userVO + ", restaurantVO=" + restaurantVO + "]";
	}
	
}
