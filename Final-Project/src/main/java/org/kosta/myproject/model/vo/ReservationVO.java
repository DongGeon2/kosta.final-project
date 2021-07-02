package org.kosta.myproject.model.vo;

public class ReservationVO {
	private String revNo;
	private String revTime;
	private int headCount;
	private UserVO userVO;
	private RestaurantVO restaurantVO;
	public ReservationVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationVO(String revNo, String revTime, int headCount, UserVO userVO, RestaurantVO restaurantVO) {
		super();
		this.revNo = revNo;
		this.revTime = revTime;
		this.headCount = headCount;
		this.userVO = userVO;
		this.restaurantVO = restaurantVO;
	}
	public String getRevNo() {
		return revNo;
	}
	public void setRevNo(String revNo) {
		this.revNo = revNo;
	}
	public String getRevTime() {
		return revTime;
	}
	public void setRevTime(String revTime) {
		this.revTime = revTime;
	}
	public int getHeadCount() {
		return headCount;
	}
	public void setHeadCount(int headCount) {
		this.headCount = headCount;
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
		return "ReservationVO [revNo=" + revNo + ", revTime=" + revTime + ", headCount=" + headCount + ", userVO="
				+ userVO + ", restaurantVO=" + restaurantVO + "]";
	}
	
}
