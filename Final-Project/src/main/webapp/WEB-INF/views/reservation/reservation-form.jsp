<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<head>
	<meta charset="utf-8">
	<!-- title이 null인 경우는 무시된다 -->
	<title>예약하기</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<%--   <link rel="stylesheet"  type="text/css" 
	href="${pageContext.request.contextPath}/resources/css/home2.css" > --%>
	<!-- google-fonts -->
	<link href="//fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
	<link href="//fonts.googleapis.com/css2?family=Sail&display=swap" rel="stylesheet">
	<!-- //google-fonts -->
	<!-- Template CSS Style link -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style-liberty.css">
	
	<!-- 날짜 -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<!-- 시간 -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	
<style>
.ui-datepicker{ font-size: 25px; width: 300px; }
.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 20px; }
.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 20px; }
</style>

</head>

<script type="text/javascript">
	const config = {
			dateFormat:'yy-mm-dd',
			/* showOn:"button",
			buttonText:"날짜 선택", */
			prevText: '이전 달',
			nextText: '다음 달',
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNames: ['일','월','화','수','목','금','토'],
			dayNamesShort: ['일','월','화','수','목','금','토'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			yearSuffix: '년',
			changeMonth: true,
	        changeYear: true,
	       /*  showButtonPanel: true,
	        currentText: '오늘 날짜' */
	}

	$(function(){
		$("input[name=revTime]").datepicker(config);
	});
</script>

<script type="text/javascript">

var startTime = '${startTime}'
var endTime = '${endTime}'

$(document).ready(function(){
	$(".time").timepicker({
		 timeFormat: 'h:mm p',
		 interval: 60,
		 minTime: startTime,
		 maxTime: endTime,
		 defaultTime: startTime,
		 startTime: startTime,
		 dynamic: false,
		 dropdown: true,
		 scrollbar: true
	});
});
</script>
<section class="w3l-blog-single">
	<div class="single blog py-5">
		<div class="container py-md-5 py-4">

			<div class="testi-top mt-5 pt-4">
				<h3 class="post-content-title">Reservation</h3>
				<div class="form-commets mt-4">
					
					<form action="doReservation2" method="post">
						<sec:csrfInput />
						<div class="media-form">
							<input type="hidden" name="id" value="${memberVO.id}"> 
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

