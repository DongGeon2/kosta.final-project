<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">My
				page</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="index.html">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>My Order</li>
			</ul>
		</div>
	</section>
</div>

<!-- //inner banner -->
<div class="container py-md-5 py-4">
	<div class="waviy text-center mb-md-5 mb-4">
		<span style="--i: 1">M</span> 
		<span style="--i: 2">y</span> 
		<span style="--i: 3"></span> 
		<span style="--i: 4">O</span> 
		<span style="--i: 5">r</span> 
		<span style="--i: 6">d</span> 
		<span style="--i: 7">e</span>
		<span style="--i: 8">r</span>
	</div>
	<!-- fireworks effect -->
	<div class="pyro">
		<div class="before"></div>
		<div class="after"></div>
	</div>	
	<div class="container">
		<table class="table">
			<thead class="thead-light">
				<tr class="text-center">
					<th scope="col">Reservation No</th>
					<th scope="col">Restaurant</th>
					<th scope="col">My Id</th>
					<th scope="col">Reservation Date</th>
					<th scope="col">Reservation Time</th>
					<th scope="col">Check</th>
				</tr>
			</thead>
			<tbody>
				<%-- <sec:authorize access="hasRole('ROLE_MEMBER')">
				<sec:csrfInput /> --%>
				<c:forEach items="${reservationVO}" var="rvo">
					<%--  <input type="hidden" name="resNo" value="${rvo.restaurantVO.resNo }"> --%>
					<tr class="text-center">
						<th scope="row"><span class="label-blue">${rvo.revNo}</span>
						</th>
						<td>
							<a href="${pageContext.request.contextPath}/findRestaurantByName?resName=${rvo.restaurantVO.resName}">
								<span class="label-blue">${rvo.restaurantVO.resName}</span> <!--  </a> -->
						</a>
						</td>
						<td><span class="label-blue">${rvo.memberVO.id}</span></td>
						<td><span class="label-blue">${rvo.revTime}</span></td>
						<td><span class="label-blue">${rvo.revHour}</span>
						<td><a href="${pageContext.request.contextPath}/deleteReservation?revNo=${rvo.revNo}&revTime=${rvo.revTime}&id=${rvo.memberVO.id}&resNo=${rvo.restaurantVO.resNo}">
							<span class="label-blue">삭제</span></a></td>
						
					</tr>
				</c:forEach>
				<%-- 		</sec:authorize> --%>
			</tbody>
		</table>
	</div>
</div>
<%-- <form action="${pageContext.request.contextPath}/findReservationById">
	<c:forEach items="${requestScope.reservation}" var="rev">
		${rev.restaurantVO.res_no} ${rev.memberVO.id} <br>
	</c:forEach>
</form> --%>