<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <!-- title이 null인 경우는 무시된다 -->
  <title><tiles:insertAttribute name="title" ignore="true" /></title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<%--   <link rel="stylesheet"  type="text/css" 
href="${pageContext.request.contextPath}/resources/css/home2.css" > --%>
     <!-- google-fonts -->
    <link href="//fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400;500;600;700&display=swap"
        rel="stylesheet">
    <link href="//fonts.googleapis.com/css2?family=Sail&display=swap" rel="stylesheet">
    <!-- //google-fonts -->
    <!-- Template CSS Style link -->
    <link rel="stylesheet"   href="${pageContext.request.contextPath}/assets/css/style-liberty.css">
</head>

<section class="w3l-blog-single">
<div class="single blog py-5">
	<div class="container py-md-5 py-4">
		
		<div class="testi-top mt-5 pt-4">
        	<h3 class="post-content-title">Reservation</h3>
            <div class="form-commets mt-4">
            	<!-- ----------------------------리뷰 작성 폼---------------------------- -->
            	<form action="doReservation2" method="post">
            	<sec:csrfInput />
                	<div class="media-form">
                		<input type="hidden" name="id" value="${memberVO.id}">
                        <input type="text" value="${memberVO.id}" readonly="readonly">
                        <input type="text" name="resNo" required="required" placeholder="식당번호">
                        <input type="text" name="revTime" required="required" placeholder="예약날짜">
                        <input type="text" name="headCount" required="required" placeholder="인원수">
                        <button class="btn btn-primary btn-style" type="submit">예약하기</button>
					</div>
                    <!-- <div class="text-right"></div> -->
				</form>
            </div>
		</div>
		</div>
	</div>
</section>

</html>