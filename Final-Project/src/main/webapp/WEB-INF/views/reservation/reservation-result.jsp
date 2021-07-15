<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title>예약 결과</title>
</head>

<div class="container">
<h3>${reservation.memberVO.id }</h3>
<h3>${reservation.restaurantVO.resNo }</h3>
<h3>${reservation.revTime }</h3>
<h3>${reservation.revHour}</h3>
<h3>${reservation.headCount }</h3>
</div>

<section class="w3l-blog-single">
	<div class="single blog py-5">
		<div class="container py-md-5 py-4">

			<div class="testi-top mt-5 pt-4">
				<h3 class="post-content-title">Reservation</h3>
				<div class="form-commets mt-4">
					
					<form action="doReservation2" method="post">
						<sec:csrfInput />
						<div class="media-form">
							<span>sdfsdfs</span>
							<input type="hidden" name="resNo" value="${resNo}"> 
							<input type="text" value="${memberVO.id}" readonly="readonly">
							<input type="text" value="${resName}" readonly="readonly">
							<input type="text" name="headCount"	required="required" placeholder="인원수">
							<input type="text" name="revTime" autocomplete="off" readonly="readonly" required="required" placeholder="날짜선택 클릭">
							<input type="text" class="time" name="hour" readonly="readonly">
						</div>
						<button class="btn btn-primary btn-style" type="submit" style="margin:auto; display: block;">예약하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
</html>