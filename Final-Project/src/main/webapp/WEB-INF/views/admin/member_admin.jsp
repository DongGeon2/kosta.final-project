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
				<span style="-i: 1">회</span> <span style="-i: 2">원</span> <span
					style="-i: 3">관</span> <span style="-i: 4">리</span>
			</div>
			<!-- fireworks effect -->
			<div class="pyro">
				<div class="before"></div>
				<div class="after"></div>
			</div>
			
	<div class="container-fluid">	
	<nav class="navbar navbar-expand-lg stroke">	
	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
	<ul class="navbar-nav ml-lg-auto">
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
					</div>
					</ul>
					</nav>
					</div>	
					</div>
					
					
				
	</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//ajaxSetup(): 실행될 AJAX 요청에 대한 기본 속석 ㅇ정의 
		$.ajaxSetup({
			beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },

			success:function(result){
				alert(result);
			},
			
			error:function (jqXHR){
				alert("jqXHR status code:"+jqXHR.status+" message:"+jqXHR.responseText);
			}
		});//setup
		$("#createBtn").click(function(){	
			//alert(1);
			 $.ajax({
				type:"post",
				url:"/authority",
				data:$("#createAuthForm").serialize(),
				
			}).done(function(){ // done - success 와 동일
				$("#createAuthForm")[0].reset();
			});//ajax
		});//click	
		$("#deleteBtn").click(function(){			
			$.ajax({
				type:"delete",
				url:"/authority/"+$("#deleteAuth").val()
			});//ajax
		});//click		
	});
</script>
	 <input type="button" value="권한추가하기" id="createBtn"><br>
	<form id="createAuthForm">
	<sec:csrfInput />
	
		 <input type="text" class="yejin" placeholder="아이디" name="id" id="w3lName" required="">
		<select name="authority" class="yejin_ResSearch yejin" id="exampleFormControlSelect1">
                                <option value="ROLE_OWNER">사장님</option>
                                <option value="ROLE_ADMIN">관리자</option>
                                </select>
	</form>
<br>
	<input type="button" value="권한삭제하기" id="deleteBtn">
	<input type="text" id="deleteAuth">

	<div class="container">	
  <h2>회원명단</h2>         
  <table class="table">
    <thead>
      <tr>
        <th>회원 아이디</th>
        <th>권한 상태</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="list" items="${list }">
      <tr>
        <td><a href="/member_authority_detail?id=${list.id }" >${list.id }</a></td>
    
        <td>${list.authority }</td>     
      </tr>
      </c:forEach>
    </tbody>	
  </table>
</div>
	
				
</section>
<!-- contact map -->
<%--   <section class="w3l-contacts-1">
        <div class="contacts">
            <div class="contacts-content">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d158858.47340002653!2d-0.24168120642536509!3d51.52855824164916!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d8a00baf21de75%3A0x52963a5addd52a99!2sLondon%2C+UK!5e0!3m2!1sen!2sin!4v1562822037850!5m2!1sen!2sin"
                    width="100%" height="650" frameborder="0" style="border:0" allowfullscreen></iframe>
                <div class="contact-info">
                    <h3>Get in touch with us</h3>
                    <p class="mb-4">If you have any questions about the site or need support, please fill out the form
                        above, and we
                        will
                        respond to your request as quickly as possible.</p>
                    <a href="#link" class="btn btn-style-2 btn-style">Read More</a>
                </div>
                <address>
                    <h4>London</h4>
                    <a href="mailto:hello@w3layouts.com">Email: hello@w3layouts.com</a>
                    <a href="tel:8-800-999-800">Tel: 8-800-999-800</a>
                </address>
            </div>
        </div>
    </section> --%>
<!-- //contact -->
