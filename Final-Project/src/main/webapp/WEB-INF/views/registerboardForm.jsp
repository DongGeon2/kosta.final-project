<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('ckeditor', {
			width : '70%',
			height : '200px',
		});
	});
</script>

<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">Events</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="index.html">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>Events</li>
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->

<form method="post"
	action="${pageContext.request.contextPath}/member/posting"
	id="form" name="form" enctype="multipart/form-data">
	<sec:csrfInput />
	<div align="center">
		<h3>게시판등록화면</h3>
		
		<div class="top-inputs d-grid">
			<input type="text" placeholder="Title" name="title" id="w3lName"
				required="required">
		</div>
		
		<textarea name="content" id="ckeditor"></textarea>
		<br>
		<br>

		<div class="inputArea">
			<input id="filename" name="uploadImg" type="file" /> <input
				type="submit" value="등록" />
		</div>


	</div>


</form>






