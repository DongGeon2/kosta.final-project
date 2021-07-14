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

<div class="container">
	<table class="table">
		<thead class="thead-light">
			<tr class="text-center">
				<th scope="col">Reservation No</th>
				<th scope="col">Restaurant</th>
				<th scope="col">HeadCount</th>
				<th scope="col">Reservation Time</th>
			</tr>
		</thead>
		<tbody>
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<sec:csrfInput />
				<c:forEach items="${requestScope.reservation}" var="rvo">
					<tr class="text-center">
						<th scope="row"><span class="label-blue">${rvo.revNo}</span>
						<span hidden="" id="resNo">${rvo.restaurantVO.resNo}</span>
						<span hidden="" id="id">${rvo.memberVO.id}</span>
						</th>
						<td>
							<%-- <a href="${pageContext.request.contextPath}/member/getDetailPostByNo?boardNo=${rvo.boardNo}">  --%>
							<span class="label-blue">${rvo.restaurantVO.resName}</span>
							<!-- 	</a> -->
						</td>
						<td><span class="label-blue">${rvo.headCount}</span></td>
						<td><span class="label-blue">${rvo.revTime}</span></td>
					</tr>
				</c:forEach>
			</sec:authorize>
		</tbody>
	</table>
</div>

<%-- <form action="${pageContext.request.contextPath}/findReservationById">
	<c:forEach items="${requestScope.reservation}" var="rev">
		${rev.restaurantVO.res_no} ${rev.memberVO.id} <br>
	</c:forEach>
</form> --%>