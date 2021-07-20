<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">Contact
				Us</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="index.html">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span> Contact Us</li>
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->

<!-- contact -->


<section class="w3l-w3l-contacts-12 py-5">

	<div class="contact-top py-md-5 py-4">
		<div class="container">
			<div class="waviy text-center mb-md-5 mb-4">
				<span style="-i: 1">L</span> <span style="-i: 2">O</span> <span
					style="-i: 3">G</span> <span style="-i: 4">I</span> <span
					style="-i: 5">N</span>

			</div>
			<!-- fireworks effect -->
			<div class="pyro">
				<div class="before"></div>
				<div class="after"></div>
			</div>
			<!-- <div class="contacts12-main">
				 <div class="row">
				<div class="col-sm-3">1</div>
				<div class="col-sm-6">2</div>
				<div class="col-sm-4">3</div>
			</div>  -->
			<form action="${pageContext.request.contextPath}/login" class="main-input" method="post" id="loginForm">
				<%-- csrf 토큰 --%>
				<sec:csrfInput />
				<div class="row">
					<div class="col-sm-offset-3 col-sm-6 top-inputs ">
						<input type="text" placeholder="ID" name="id" id="w3lName"
							required="required">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-offset-3 col-sm-6 top-inputs ">
						<input type="password" placeholder="Password" name="password"
							id="w3lName" required="required">
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-2  top-inputs d-grid float-left"
						id="jangwrapper">
						<button type="submit" class="btn btn-style">로그인</button>

					</div>
					<div class="top-inputs d-grid" id="jangwrapper">
					<button type="submit" class="btn btn-style" onClick="location.href='${pageContext.request.contextPath}/registerForm'">
					회원가입	</button>
						<!-- style="color:white" -->
<%-- ${pageContext.request.contextPath}/ --%>
     			</div>
				</div>
			</form>
		</div>
	</div>


</section>
<!-- contact map -->
<section class="w3l-contacts-1">
	<div id="resPosition" style="width: 100%; height: 600px;"></div>
</section>
<!-- //contact -->
<script>
	var mapContainer = document.getElementById('resPosition'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.338, 127.109), // 지도의 중심좌표
		level : 4
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);

	//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	//마커가 표시될 위치입니다 
	var markerPosition = new kakao.maps.LatLng(37.338849, 127.109344);

	//마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map);
	//아래 코드는 인포윈도우를 지도에서 제거합니다
</script>
