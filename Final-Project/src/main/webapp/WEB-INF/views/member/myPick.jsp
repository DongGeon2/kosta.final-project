<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
.Yrow {
	display: flex;
	flex-wrap: wrap;
	margin-right: -100px;
	margin-left: 150px;
}
</style>
<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">My
				page</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="index.html">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>My Pick</li>
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->

<section class="w3l-text-6">
	<div class="text-6-mian bottom-space py-5">
		<div class="container py-md-5 py-4">
			<div class="container py-md-5 py-4">
				<div class="waviy text-center mb-md-5 mb-4">
					<span style="--i: 1">M</span> 
					<span style="--i: 2">y</span> 
					<span style="--i: 3"></span> 
					<span style="--i: 4">P</span> 
					<span style="--i: 5">i</span> 
					<span style="--i: 6">c</span> 
					<span style="--i: 7">k</span>
				</div>
				<div class="Yrow top-cont-grid align-items-center">
					<sec:authorize access="hasRole('ROLE_MEMBER')">
						<sec:csrfInput />
						<c:forEach items="${requestScope.myPickVO}" var="pvo">
							<%-- 	<c:forEach items="${restaurantList}" var="restaurant"> --%>
							<div class="col-lg-4 col-md-6 item">
								<div class="col-lg-1"></div>
								<div class="card">
									<div class="card-header p-0 position-relative">
										<a href="/detailRestaurant?resNo=${pvo.restaurantVO.resNo}">
											<img class="card-img-bottom d-block radius-image-full"
											src="/ResUpload/${pvo.restaurantVO.resImage}"
											alt="Card image cap">
										</a>
									</div>
									<div class="card-body blog-details" style="font-size: 15px;">
										<a href="/detailRestaurant?resNo=${pvo.restaurantVO.resNo}">
											<span class="label-blue">${pvo.restaurantVO.resName}</span> <%-- <a href="/user/detailRestaurant?resNo=${restaurant.resNo}" class="blog-desc">
								${restaurant.memberVO.id}<br> --%>
										</a>
										<div class="author align-items-center mt-3 mb-1">
											<img src="assets/images/testi1.jpg" alt=""
												class="img-fluid rounded-circle" />
											<ul class="blog-meta">
												<li><a
													href="/detailRestaurant?resNo=${pvo.restaurantVO.resNo}">
														${pvo.memberVO.name}<br>
												</a></li>

												<li class="meta-item blog-lesson">Location. <span
													class="meta-value">${pvo.restaurantVO.resLoc}</span>
												</li>
												<li class="meta-item blog-lesson">Tel. <span
													class="meta-value">${pvo.memberVO.tel}</span>
												</li>
												<li class="meta-item blog-lesson">
													<!--   <span class="meta-value">게시날짜</span>. <span
                                            class="meta-value ml-2"><span class="fa fa-clock-o"></span> 2021/07/05</span> -->
													<span class="meta-value">Operating Time :
														${pvo.restaurantVO.startTime} ~
														${pvo.restaurantVO.endTime}</span>
												</li>

											</ul>
										</div>
									</div>
								</div>
								<!-- 식당 하나자리 -->
								<br> <br> <br> <br>
							</div>
							<div class="col-lg-1"></div>
						</c:forEach>
					</sec:authorize>
				</div>
				<!-- 식당1 -->

				<!-- pagination -->
				<%-- <c:set var="pb" value="${requestScope.pagingBean}"></c:set>
			<div class="pagination-style text-center mt-5 pt-5">
				<ul>
					<!-- 이전 그룹일때 -->
					<c:if test="${pb.previousPageGroup }">
						<li><a href="countPage?pageNo=${pb.startPageOfPageGroup-1 }"
							class="not-allowed"> <span class="fa fa-angle-double-left"
								aria-hidden="true"></span>
						</a></li>
					</c:if>

					<c:forEach var="page" begin="${pb.startPageOfPageGroup}"
						end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage==page }">
								<li><a class="active" href="countPage?pageNo=${page }">${page }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="countPage?pageNo=${page }">${page }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음 그룹일때 -->
					<c:if test="${pb.nextPageGroup }">
						<li><a href="countPage?pageNo=${pb.endPageOfPageGroup+1 }">
								<span class="fa fa-angle-double-right" aria-hidden="true"></span>
						</a></li>
					</c:if>
				</ul>
			</div> --%>
				<!-- //pagination -->
			</div>
		</div>
	</div>
</section>