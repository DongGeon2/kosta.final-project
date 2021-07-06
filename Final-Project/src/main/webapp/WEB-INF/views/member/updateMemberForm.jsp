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
			<div class="waviy text-center mb-md-5 mb-4">
				<span style="--i: 1">E</span> 
				<span style="--i: 2">d</span> 
				<span style="--i: 3">i</span> 
				<span style="--i: 4">t</span>
				<span style="--i: 5"></span> 
				<span style="--i: 6">m</span> 
				<span style="--i: 7">y</span> 
				<span style="--i: 8"></span>
				<span style="--i: 9">p</span> 
				<span style="--i: 10">r</span> 
				<span style="--i: 11">o</span> 
				<span style="--i: 12">f</span>
				<span style="--i: 13">i</span> 
				<span style="--i: 14">l</span> 
				<span style="--i: 15">e</span> 
			</div>
			<!-- fireworks effect -->
			<div class="pyro">
				<div class="before"></div>
				<div class="after"></div>
			</div>
			<div class="contacts12-main">
			 <sec:authorize access="hasRole('ROLE_MEMBER')">
	<form method="post" action="${pageContext.request.contextPath}/updateMemberAction"
					id="updateForm" method="post" class="main-input">
					<sec:csrfInput />
					<div class="col-sm-offset-3 col-sm-6 top-inputs">
						<input type="text"  name="id" id="w3lName"
							required="required" value="<sec:authentication property="principal.id"/>" readonly>
					</div>
					<div class="col-sm-offset-3 col-sm-6 top-inputs">
						<input type="password" name="password" placeholder="password"
							id="w3lSender" required="required">
					</div>
					<div class="col-sm-offset-3 col-sm-6 top-inputs">
						<input type="text" value="<sec:authentication property="principal.name"/>"  name="name" id="w3lName"
							required="required">
					</div>
					<div class="col-sm-offset-3 col-sm-6 top-inputs">
						<input type="email" value="<sec:authentication property="principal.email"/>"  name="email" id="w3lName"
							required="required">
					</div>
					<div class="col-sm-offset-3 col-sm-6 top-inputs">
						<input type="text"value="<sec:authentication property="principal.tel"/>"  name="tel" id="w3lName"
							required="required">
					</div>
					<div class="col-sm-offset-3 col-sm-6 top-inputs">
						<button type="submit" class="btn btn-style">수정완료</button>
					</div>
				</form>
				</sec:authorize>
</div>
</div>
</div>
</section>