<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">My
				page</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="index.html">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>My Review</li>
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->

<div class="container">
	<table class="table">
		<thead class="thead-light">
			<tr class="text-center">
				<th scope="col">Restaurant</th>
				<th scope="col">Review title</th>
				<th scope="col">My ID</th>
				<th scope="col">Register Date</th>
			</tr>
		</thead>
		<tbody>
			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<sec:csrfInput />
				<c:forEach items="${requestScope.reviewVO}" var="rvo">
					<tr class="text-center">
						<th scope="row"><span class="label-blue">${rvo.restaurantVO.res_name}</span>
						</th>
						<td>
							<%--  <a href="${pageContext.request.contextPath}/member/getDetailPostByNo?boardNo=${rvo.boardNo}"> --%>
							<span class="label-blue">${rvo.review_title}</span> <!--  </a> -->
						</td>
						<td><span class="label-blue">${rvo.memberVO.id}</span></td>
						<td><span class="label-blue">${rvo.review_regdate}</span></td>
					</tr>
				</c:forEach>
			</sec:authorize>
		</tbody>
	</table>
	<div class="row">
		<div class="col-auto mr-auto"></div>
		<div class="col-auto">
			<a class="btn btn-primary" role="button"
				href="/member/registerboardForm">글쓰기</a>
		</div>
	</div>
	<!-- pagination -->
	<c:set var="pb" value="${requestScope.pagingBean}"></c:set>
	<div class="pagination-style text-center mt-5 pt-5">
		<ul>
			<!-- 이전 그룹일때 -->
			<c:if test="${pb.previousPageGroup }">
				<li><a
					href="/member/postList?pageNo=${pb.startPageOfPageGroup-1 }"
					class="not-allowed"> <span class="fa fa-angle-double-left"
						aria-hidden="true"></span>
				</a></li>
			</c:if>

			<c:forEach var="page" begin="${pb.startPageOfPageGroup}"
				end="${pb.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pb.nowPage==page }">
						<li><a class="active" href="/member/postList?pageNo=${page }">${page }</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/member/postList?pageNo=${page }">${page }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 다음 그룹일때 -->
			<c:if test="${pb.nextPageGroup }">
				<li><a
					href="/member/postList?pageNo=${pb.endPageOfPageGroup+1 }"> <span
						class="fa fa-angle-double-right" aria-hidden="true"></span>
				</a></li>
			</c:if>
		</ul>
	</div>
	<!-- //pagination -->
</div>


