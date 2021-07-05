<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--header-->
<header id="site-header" class="fixed-top">
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg stroke">
			<a class="navbar-brand d-flex align-items-center" href="home"> 
					<img src="assets/images/Koshelin_logo.png" alt="Your logo"
					title="Your logo" style="height: 300px;" />
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
					<li class="nav-item"><a class="nav-link" href="home">Home
							<span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="restaurant ">restaurant</a></li>
					<li class="nav-item"><a class="nav-link" href="recommend">recommend</a></li>
					<li class="nav-item"><a class="nav-link" href="login">login</a></li>
					<li class="nav-item"><a class="nav-link" href="mypage">mypage</a></li>
					<!-- search button -->
					<div class="search-right ml-lg-3">
						<form action="error.html" method="GET"
							class="search-box position-relative">
							<div class="input-search">
								<input type="search" placeholder="Enter Keyword" name="search"
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