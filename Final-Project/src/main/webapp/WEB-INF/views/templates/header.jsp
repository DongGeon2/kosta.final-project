<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--header-->
<header id="site-header" class="fixed-top">
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg stroke">
			<a class="navbar-brand d-flex align-items-center"
				href="${pageContext.request.contextPath}/home"> <img
				src="${pageContext.request.contextPath}/assets/images/Koshelin_logo.png"
				alt="Your logo" title="Your logo" style="height: 300px;" />
			</a>
			<button class="navbar-toggler  collapsed bg-gradient" type="button"
				data-toggle="collapse" data-target="#navbarTogglerDemo02"
				aria-controls="navbarTogglerDemo02" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon fa icon-expand fa-bars"></span> <span
					class="navbar-toggler-icon fa icon-close fa-times"></span>
			</button>
			<script type="text/javascript">
				$(document).ready(
						function() {
							$("#navbarTogglerDemo02 :li[class=nav-item]")
									.click(function() {
										$(this).addClass("active");
									})
						})
			</script>

			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav ml-lg-auto">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/restaurant ">restaurant</a></li>
               <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/recommend">recommend</a></li>
               <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/owner">사장권한</a></li>
               <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/admin">관리자권한</a></li>
               <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/test">test</a></li>
               <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/test2">test2</a></li>
					<sec:authorize access="isAuthenticated()==false">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/login">Login</a></li>
						<sec:csrfInput />
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<div class="nav-item nav-link">
							<sec:authentication property="principal.name" />
							님
						</div>
						<script
							src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
						<script type="text/javascript">
							$(document).ready(function() {
								$("#logoutAction").click(function() {
									$("#logoutForm").submit();
								});
							});
						</script>
						<li class="nav-item"><a class="nav-link" href="mypage">mypage</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							id="logoutAction">Logout</a></li>
						<form id="logoutForm"
							action="${pageContext.request.contextPath}/logout" method="post"
							style="display: none">
							<sec:csrfInput />
						</form>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="nav-item"><a class="nav-link" href="admin/mypage">Admin</a></li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_OWNER')">
							<li class="nav-item">
								<a class="nav-link" href="restaurant/registerRestaurantForm">register</a>
							</li>
						</sec:authorize>
					</sec:authorize>

					<!-- 
					<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav ml-lg-auto">
					
					<sec:authorize access="isAuthenticated()==false">
						<li class="nav-item"><a class="nav-link" href="home">Home
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="restaurant ">restaurant</a></li>
						<li class="nav-item"><a class="nav-link" href="recommend">recommend</a></li>
						<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
						<sec:csrfInput />
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li class="nav-item"><a class="nav-link" href="home">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="restaurant ">restaurant</a></li>
					<li class="nav-item"><a class="nav-link" href="recommend">recommend</a></li>
						<div class="nav-item nav-link">
							<sec:authentication property="principal.name" />님
						</div>
						<script
							src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
						<script type="text/javascript">
		                  $(document).ready(function() {
		                     $("#logoutAction").click(function() {                        
		                        $("#logoutForm").submit();
		                     });
		                  });
		                  </script>
						<li class="nav-item"><a class="nav-link" href="mypage">mypage</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							id="logoutAction">Logout</a></li>
						<form id="logoutForm"
							action="${pageContext.request.contextPath}/logout" method="post"
							style="display: none">
							<sec:csrfInput />
						</form>
					</sec:authorize>
		                  -->
					<!-- search button -->
					<div class="search-right ml-lg-3">
						<form
							action="${pageContext.request.contextPath}/user/findRestaurantByName"
							method="GET" class="search-box position-relative">
							<div class="input-search">
								<input type="search" placeholder="Enter Keyword" name="resName"
									required="required" autofocus="" class="search-popup">
							</div>
							<button type="submit" class="btn search-btn">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
						</form>
					</div>
					<!-- //search button -->
				</ul>
			</div>
		</nav>
	</div>
</header>
<!--//header-->