package org.kosta.myproject.model.vo;

public class RecordVO {
	private String recordNo;
	private String recordCheck;
	private String recordTime;
	private MemberVO memberVO;
	private RestaurantVO restaurantVO;
	public RecordVO() {
		super();
	}
	public RecordVO(String recordNo, String recordCheck, String recordTime, MemberVO memberVO,
			RestaurantVO restaurantVO) {
		super();
		this.recordNo = recordNo;
		this.recordCheck = recordCheck;
		this.recordTime = recordTime;
		this.memberVO = memberVO;
		this.restaurantVO = restaurantVO;
	}
	public String getRecordNo() {
		return recordNo;
	}
	public void setRecordNo(String recordNo) {
		this.recordNo = recordNo;
	}
	public String getRecordCheck() {
		return recordCheck;
	}
	public void setRecordCheck(String recordCheck) {
		this.recordCheck = recordCheck;
	}
	public String getRecordTime() {
		return recordTime;
	}
	public void setRecordTime(String recordTime) {
		this.recordTime = recordTime;
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
		return "RecordVO [recordNo=" + recordNo + ", recordCheck=" + recordCheck + ", recordTime=" + recordTime
				+ ", memberVO=" + memberVO + ", restaurantVO=" + restaurantVO + "]";
	}
	
}
