package org.kosta.myproject.model.vo;

public class ReviewVO {
	private String reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private String reviewRegdate;
	private int resGrade;
	private UserVO userVO;
	private RestaurantVO restaurantVO;
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewVO(String reviewNo, String reviewTitle, String reviewContent, String reviewRegdate, int resGrade,
			UserVO userVO, RestaurantVO restaurantVO) {
		super();
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewRegdate = reviewRegdate;
		this.resGrade = resGrade;
		this.userVO = userVO;
		this.restaurantVO = restaurantVO;
	}
	public String getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewRegdate() {
		return reviewRegdate;
	}
	public void setReviewRegdate(String reviewRegdate) {
		this.reviewRegdate = reviewRegdate;
	}
	public int getResGrade() {
		return resGrade;
	}
	public void setResGrade(int resGrade) {
		this.resGrade = resGrade;
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
		return "ReviewVO [reviewNo=" + reviewNo + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent
				+ ", reviewRegdate=" + reviewRegdate + ", resGrade=" + resGrade + ", userVO=" + userVO
				+ ", restaurantVO=" + restaurantVO + "]";
	}
	
}
