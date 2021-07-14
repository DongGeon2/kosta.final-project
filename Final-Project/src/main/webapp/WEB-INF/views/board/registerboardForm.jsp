<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('ckeditor', {
			width : '100%',
			height : '300px',
		});
	});
</script>

<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">Post</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="index.html">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span> Post</li>
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->

<section class="w3l-w3l-contacts-12 py-5">

	<div class="waviy text-center mb-md-5 mb-4">
		<span style="-i: 1">P</span> <span style="-i: 2">o</span> <span
			style="-i: 3">s</span> <span style="-i: 4">t</span>
	</div>



	<form method="post" action="${pageContext.request.contextPath}/posting"
		id="form" name="form" class="main-input" enctype="multipart/form-data">
		<sec:csrfInput />

		<div class="row">
			<div class="col-sm-offset-3 col-sm-6 top-inputs ">
				<input type="text" placeholder="Title" name="title" id="w3lName"
					required="required">
			</div>
		</div>

		<br> <br>
		<div align="center">
			<textarea name="content" id="ckeditor"></textarea>
			<br> <br>

			<div class="inputArea">
				<input id="filename" name="uploadImg" type="file" /> <input
					type="submit" style='background-color: #fd614a; color: #fff;'
					value="등록" />
			</div>
		</div>
	</form>

</section>








