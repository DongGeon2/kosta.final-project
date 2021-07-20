<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">My page</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="home">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span> Edit My Account </li>
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->
<section class="w3l-w3l-contacts-12 py-5">
	<div class="contact-top py-md-5 py-4">
		<div class="container">
 <h3 align="center"><sec:authentication property="principal.name"/>님 회원정보 수정되었습니다. </h3>
 </div>
 </div>
 </section>