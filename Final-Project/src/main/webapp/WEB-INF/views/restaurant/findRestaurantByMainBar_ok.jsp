<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%--   <link rel="stylesheet"  type="text/css" 
href="${pageContext.request.contextPath}/resources/css/home2.css" > --%>
<!-- google-fonts -->
<link
	href="//fonts.googleapis.com/css2?family=Josefin+Sans:wght@100;200;300;400;500;600;700&display=swap"
	rel="stylesheet">
<link href="//fonts.googleapis.com/css2?family=Sail&display=swap"
	rel="stylesheet">
<!-- //google-fonts -->
<!-- Template CSS Style link -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style-liberty.css">
<!-- Js scripts -->
<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">식당추천</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="index.html">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>식당추천</li>
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->

<!-- events section -->
<section class="w3l-text-6">
	<div class="text-6-mian bottom-space py-5">
		<div class="container py-md-5 py-4">
			<div class="waviy text-center mb-sm-5 mb-4 pb-lg-4">
				<span style="-i: 1">R</span> <span style="-i: 2">e</span> <span
					style="-i: 3">c</span> <span style="-i: 4">o</span> <span
					style="-i: 5">m</span> <span style="-i: 6">m</span> <span
					style="-i: 7">e</span> <span style="-i: 8">n</span> <span
					style="-i: 1">d</span>
			</div>
			<!-- fireworks effect -->
			<div class="pyro">
				<div class="before"></div>
				<div class="after"></div>
			</div>
			<div class="row top-cont-grid align-items-center">

				<c:forEach items="${requestScope.restaurantVOList}" var="vo"
					varStatus="status">

					<!-- 식당1 -->
					<div class="row">
						<div class="col-lg-4 col-md-6 item">
							<div class="card">
								<div class="card-header p-0 position-relative">
									<a href="single.html"> <img
										class="card-img-bottom d-block radius-image-full"
										src="assets/images/s1.png" alt="Card image cap">
									</a>
								</div>
								<div class="card-body blog-details">
									<span class="label-blue">${vo.resName}</span> <a
										href="single.html" class="blog-desc">${vo.resInfo} </a>
									<div class="author align-items-center mt-3 mb-1">
										<img src="assets/images/testi1.jpg" alt=""
											class="img-fluid rounded-circle" />
										<ul class="blog-meta">
											<li><a href="single.html">kk</a> </a></li>
											<li class="meta-item blog-lesson"><span
												class="meta-value"> Jan 28 2021 </span>. <span
												class="meta-value ml-2"><span class="fa fa-clock-o"></span>
													1 min</span></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-1"></div>
						<div class="col-lg-6 left-cont mb-lg-0 mb-5">
							<h4>${vo.resName}</h4>
							<div class="d-flex align-items-center mt-3">
								<h6>
									<i class="fa fa-clock-o mr-1" aria-hidden="true"></i> 7:00 pm -
									8:00 pm
								</h6>
								<h6 class="ml-3">
									<i class="fa fa-calendar mr-2" aria-hidden="true"></i>Dec 31
								</h6>
							</div>
							<p class="mt-3 mb-2">${vo.resInfo}</p>
							<a href="single.html" class="btn btn-style mt-4">Restaurant
								Details</a>
						</div>
					</div>
					<br>
					<br>
					<br>
					<!-- 식당1 -->
				</c:forEach>




				<!-- pagination -->
				<c:set var="pb" value="${requestScope.pagingBean}"></c:set>
				<div class="pagination-style text-center mt-5 pt-5">
					<ul>
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
						<c:if test="${pb.nextPageGroup }">
							<li><a href="countPage?pageNo=${pb.endPageOfPageGroup+1 }">
									<span class="fa fa-angle-double-right" aria-hidden="true"></span>
							</a></li>
						</c:if>
					</ul>
				</div>
				<!-- //pagination -->

			</div>
		</div>
	</div>
</section>
<!-- image with text section -->