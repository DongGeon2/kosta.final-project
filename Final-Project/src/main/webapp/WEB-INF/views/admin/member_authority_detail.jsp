<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold text-white mb-sm-3 mb-2">Register</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="index.html">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span> RegisterForm</li>
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
				<span style="--i: 1">회</span> 
				<span style="--i: 2">원</span> 
				<span style="--i: 3">관</span> 
				<span style="--i: 4">리</span>
			</div>
			<!-- fireworks effect -->
			<div class="pyro">
				<div class="before"></div>
				<div class="after"></div>
			</div>
			<table class="table">
				<c:forEach var="lista" items="${memberStatus }">
				<thead>
					<tr>
						<th>${lista.id }권한 상태</th>
					</tr>
				</thead>
				<tbody>	
					<tr>
						<td>${lista.authority}</td>
					</tr>
				</c:forEach>
				<tr>
				<td>
				<div class="col-sm-offset-3 col-sm-6 top-inputs">
				<input type="button" value="사장권한주기" id="AuthCreateBtn" class="btn btn-style">
				</div>
				</td>
				<td>
				<div class="col-sm-offset-3 col-sm-6 top-inputs">
				<input type="button" value="사장권한취소" id="AuthDeleteBtn" class="btn btn-style">
				</div>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
				<script type="text/javascript">
							$(document).ready(function() {
								$.ajaxSetup({
									success:function(result){					
										alert(result);
									},
									error: function (jqXHR) {
						                alert("jqXHR status code:"+jqXHR.status+" message:"+jqXHR.responseText);
						            }
								});//ajaxSetup
								$("#testDeleteBtn").click(function(){			
									//alert(1);
									 $.ajax({
										type:"delete",
										url:"authority/"+${"#id"}.val()
									});//ajax 
								});//click		
							});
						</script>
						
					<input type="button" value="사장권한취소" id="testDeleteBtn">
				</td>
				</tr>
				
				</tbody>
			</table>
	
		</div>
	</div>
</section>