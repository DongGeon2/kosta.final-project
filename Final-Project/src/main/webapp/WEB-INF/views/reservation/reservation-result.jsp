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

<section class="w3l-text-6" style="background-color: #fdffff;">
	<div class="text-6-mian bottom-space py-5">
		<div class="container py-md-5 py-4">
							<!-- fireworks effect -->
                            <div class="pyro">
                                <div class="before"></div>
                                <div class="after"></div>
                            </div>
                            <!-- first text effect -->
			<div class="waviy text-center mb-sm-5 mb-4 pb-lg-4">
				<span style="-i: 1">R</span> <span style="-i: 2">e</span> <span
					style="-i: 3">s</span> <span style="-i: 4">u</span> <span
					style="-i: 5">l</span> <span style="-i: 6">t</span>
			</div>
			<div>
				<br>
				<!-- 사장카드 -->
				<div class="Yrow top-cont-grid align-items-center">
					<div class="col-lg-4 col-md-6 item">
						<div class="col-lg-1"></div>
						<div class="card">

							<div class="card-body blog-details" style="font-size: 15px;">
								<div align=center>
								<span class="label-blue" style="font-size: 13px; text-align: center;">예약자 정보확인</span><br><br>
								</div>
								<div class="card-header p-0 position-relative">
								<a href="/detailRestaurant?resNo=${restaurant.resNo}">
									<img class="card-img-bottom d-block radius-image-full"
									src="/ResUpload/예약확인.png" alt="Card image cap">
								</a>
								</div><br>
								<span class="label-blue">No.
									${reservation.restaurantVO.resNo }</span><br>
								<div class="author align-items-center mt-3 mb-1">
									<img src="assets/images/사장.png" alt=""
										class="img-fluid rounded-circle" />
										
									<ul class="blog-meta">
										<li class="meta-item blog-lesson">회원아이디: <span
											class="meta-value">${reservation.memberVO.id }</span>
										</li>
										<li class="meta-item blog-lesson">예약날짜: <span
											class="meta-value">${reservation.revTime }</span>
										</li>
										<li class="meta-item blog-lesson">인원수: <span
											class="meta-value">${reservation.headCount }</span>
										</li>

									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 사장카드 -->
				<div id="resPosition" style="width: 60%; height: 500px;"></div>
			</div>
		</div>
	</div>
</section>

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

	var iwContent = '<div style="padding:5px;">잘못된 주소입니다.<br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>',
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
	geocoder
			.addressSearch(
					'${restaurantDetailLoc}',
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
										content : '<div style="padding:5px;">환영합니다!<br><a href="https://map.kakao.com/link/map/가게이름,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/가게이름 ,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
</script>