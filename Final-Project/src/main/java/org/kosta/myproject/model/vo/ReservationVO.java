package org.kosta.myproject.model.vo;

public class ReservationVO {
	private String revNo;
	private String revTime;
	private int headCount;
	private MemberVO memberVO;
	private RestaurantVO restaurantVO;
	public ReservationVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReservationVO(String revNo, String revTime, int headCount, RestaurantVO restaurantVO) {
		super();
		this.revNo = revNo;
		this.revTime = revTime;
		this.headCount = headCount;
		this.restaurantVO = restaurantVO;
	}

	public ReservationVO(String revNo, String revTime, int headCount, MemberVO memberVO, RestaurantVO restaurantVO) {
		super();
		this.revNo = revNo;
		this.revTime = revTime;
		this.headCount = headCount;
		this.memberVO = memberVO;
		this.restaurantVO = restaurantVO;
	}
	
	public ReservationVO(String revNo, MemberVO memberVO, RestaurantVO restaurantVO) {
		super();
		this.revNo = revNo;
		this.memberVO = memberVO;
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
		return "ReservationVO [revNo=" + revNo + ", revTime=" + revTime + ", headCount=" + headCount + ", memberVO="
				+ memberVO + ", restaurantVO=" + restaurantVO + "]";
	}

	
}
