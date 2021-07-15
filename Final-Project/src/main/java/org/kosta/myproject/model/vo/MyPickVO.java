package org.kosta.myproject.model.vo;

public class MyPickVO {
   private String pickNo;
   private String id;
   private RestaurantVO restaurantVO;
   public MyPickVO() {
      super();
      
   }
   public MyPickVO(String pickNo, String id, RestaurantVO restaurantVO) {
      super();
      this.pickNo = pickNo;
      this.id = id;
      this.restaurantVO = restaurantVO;
   }
   public String getPickNo() {
      return pickNo;
   }
   public void setPickNo(String pickNo) {
      this.pickNo = pickNo;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public RestaurantVO getRestaurantVO() {
      return restaurantVO;
   }
   public void setRestaurantVO(RestaurantVO restaurantVO) {
      this.restaurantVO = restaurantVO;
   }
   @Override
   public String toString() {
      return "MyPickVO [pickNo=" + pickNo + ", id=" + id + ", restaurantVO=" + restaurantVO + "]";
   }
   
}