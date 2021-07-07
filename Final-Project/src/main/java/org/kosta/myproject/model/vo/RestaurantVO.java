package org.kosta.myproject.model.vo;

public class RestaurantVO {
	private String resNo;
	private String resName;
	private String resLoc;
	private String resImage;
	private String resInfo;
	private String resTel;
	private String startTime;
	private String endTime;
	private MemberVO memberVO;
	private String foodType;
	public RestaurantVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RestaurantVO(String resNo, String resName, String resLoc, String resImage, String resInfo, String resTel,
			String startTime, String endTime, MemberVO memberVO, String foodType) {
		super();
		this.resNo = resNo;
		this.resName = resName;
		this.resLoc = resLoc;
		this.resImage = resImage;
		this.resInfo = resInfo;
		this.resTel = resTel;
		this.startTime = startTime;
		this.endTime = endTime;
		this.memberVO = memberVO;
		this.foodType = foodType;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	public String getResNo() {
		return resNo;
	}
	public void setResNo(String resNo) {
		this.resNo = resNo;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getResLoc() {
		return resLoc;
	}
	public void setResLoc(String resLoc) {
		this.resLoc = resLoc;
	}
	public String getResImage() {
		return resImage;
	}
	public void setResImage(String resImage) {
		this.resImage = resImage;
	}
	public String getResInfo() {
		return resInfo;
	}
	public void setResInfo(String resInfo) {
		this.resInfo = resInfo;
	}
	public String getResTel() {
		return resTel;
	}
	public void setResTel(String resTel) {
		this.resTel = resTel;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getFoodType() {
		return foodType;
	}
	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}

	@Override
	public String toString() {
		return "RestaurantVO [resNo=" + resNo + ", resName=" + resName + ", resLoc=" + resLoc + ", resImage=" + resImage
				+ ", resInfo=" + resInfo + ", resTel=" + resTel + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", memberVO=" + memberVO + ", foodType=" + foodType + "]";
	}
}
