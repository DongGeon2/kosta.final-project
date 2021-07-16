<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">About
				Us</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="index.html">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>About Us</li>
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->
<body>
<div align="center" >
	<h1>식당예약정보</h1><br>
	<div class="container">
		<h3>회원아이디: ${reservation.memberVO.id }</h3>
		<h3>예약번호: ${reservation.restaurantVO.resNo }</h3>
		<h3>예약날짜: ${reservation.revTime }</h3>
		<h3>인원수: ${reservation.headCount }</h3>
		
	</div>
	<br><br>
	<div id="resPosition" style="width: 30%; height: 400px;"></div>
</div>

<script>
	var mapContainer = document.getElementById('resPosition'), // 지도를 표시할 div 
		mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
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
	var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);

	//마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	var iwContent = '<div style="padding:5px;">${reservation.restaurantVO.resNo}<br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>',
	// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

	//인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		position : iwPosition,
		content : iwContent
	});

	//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);
	//아래 코드는 인포윈도우를 지도에서 제거합니다
	//infowindow.close();  

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	//${restaurant.resDetailloc}
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${restaurantDetailLoc}',
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="padding:5px;">식당이름<br><a href="https://map.kakao.com/link/map/가게이름,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/가게이름 ,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
</script>