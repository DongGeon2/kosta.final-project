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
	<div class="contacts">
		<div class="contacts-content">
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d158858.47340002653!2d-0.24168120642536509!3d51.52855824164916!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d8a00baf21de75%3A0x52963a5addd52a99!2sLondon%2C+UK!5e0!3m2!1sen!2sin!4v1562822037850!5m2!1sen!2sin"
				width="100%" height="650" frameborder="0" style="border: 0"
				allowfullscreen></iframe>
			<div class="contact-info">
				<h3>Get in touch with us</h3>
				<p class="mb-4">If you have any questions about the site or need
					support, please fill out the form above, and we will respond to
					your request as quickly as possible.</p>
				<a href="#link" class="btn btn-style-2 btn-style">Read More</a>
			</div>
			<address>
				<h4>London</h4>
				<a href="mailto:hello@w3layouts.com">Email: hello@w3layouts.com</a>
				<a href="tel:8-800-999-800">Tel: 8-800-999-800</a>
			</address>
		</div>
	</div>
</section>
<!-- //contact -->
