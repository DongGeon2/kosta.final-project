<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
 
<script type="text/javascript">
 	$(document).ready(function(){
		var checkResultId="";		
		$("#regForm").submit(function(){				
			if(checkResultId==""){
				alert("아이디 중복확인을 하세요");
				return false;
			}		
		});
		$("#regForm :input[name=id]").keyup(function(){
			var id=$(this).val().trim();
			if(id.length<4 || id.length>10){
				$("#idCheckView").html("아이디는 4자이상 10자 이하여야 함!").css(
						"background","pink");
				checkResultId="";
				return;
			}
			// spring security 적용시 ajax post 방식은 아래와 같이 beforeSend property에서 csrf 값을 셋팅해야 함 
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/user/idcheckAjax",				
				data:"id="+id,	
				beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
				success:function(data){						
					if(data=="fail"){
					$("#idCheckView").html(id+" 사용불가!").css("background","red");
						checkResultId="";
					}else{						
						$("#idCheckView").html(id+" 사용가능!").css(
								"background","yellow");		
						checkResultId=id;
					}					
				}//callback			
			});//ajax
		});//keyup
	});//ready 
</script> 
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
				<span style="-i: 1">회</span> <span style="-i: 2">원</span> <span
					style="-i: 3">가</span> <span style="-i: 4">입</span>
			</div>
			<!-- fireworks effect -->
			<div class="pyro">
				<div class="before"></div>
				<div class="after"></div>
			</div>
			<div class="contacts12-main">
 
				<script type="text/javascript">
                	$(document).ready(function(){
                		var checkResultId="";		
                		$("#regForm").submit(function(){				
                			if(checkResultId==""){
                				alert("아이디 중복확인을 하세요");
                				return false;
                			}		
                		});
                		$("#regForm :input[name=id]").keyup(function(){
                			var id=$(this).val().trim();
                			if(id.length<4 || id.length>10){
                				//$("#idCheckView").html("아이디는 4자이상 10자 이하여야 함!").css("background","pink");
                				$("#idCheckBtn").val("아이디는 4~10 글자");
                				checkResultId="";
                				return;
                			}else{
                				$("#idCheckBtn").val("중복확인");
                			}
                			$("#idCheckBtn").off('click').on('click',function(){
	                			$.ajax({
	                				type:"post",
	                				url:"${pageContext.request.contextPath}/user/idcheckAjax",				
	                				data:"id="+id,	
	                				beforeSend : function(xhr){  
	                                    xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	                                },
	                				success:function(data){						
	                					if(data=="fail"){
	                						//$("#idCheckView").html(id+" 사용불가!").css("background","red");
	                						alert(id+" 사용불가!");
	                						checkResultId="";
	                					}else{						
	                						//$("#idCheckView").html(id+" 사용가능!").css("background","yellow");		
	                						alert(id+" 사용가능!^^");
	                						checkResultId=id;
	                					}					
	                				}//callback			
	                			});//ajax
                			});//click
                		});//keyup
                	});//ready 
             	
                	</script>
				<form
					action="${pageContext.request.contextPath}/user/registerMember"
					id="regForm" method="post" class="main-input">
					<sec:csrfInput />
					<div class="col-sm-offset-3 col-sm-6 top-inputs">
						<input type="text" placeholder="id" name="id" id="w3lName"
							required="required">
					</div>
					<div class="col-sm-2  top-inputs d-grid">
						<input type="button"
							class="btn btn-style" id="idCheckBtn" value="중복확인">
						<!-- <button type="button" class="btn btn-style" id="idCheckBtn2" value="중복확인2"></button> -->

					</div>
					<div class="col-sm-offset-3 col-sm-6 top-inputs">
						<input type="password" name="password" placeholder="password"
							id="w3lSender" required="required">
					</div>
					<div class="col-sm-offset-3 col-sm-6 top-inputs">
						<input type="text" placeholder="Name" name="name" id="w3lName"
							required="required">
					</div>
					<div class="col-sm-offset-3 col-sm-6 top-inputs">
						<input type="email" placeholder="email" name="email" id="w3lName"
							required="required">
					</div>
					<div class="col-sm-offset-3 col-sm-6 top-inputs">
						<input type="text" placeholder="tel" name="tel" id="w3lName"
							required="required">
					</div>
					<div class="col-sm-offset-3 col-sm-6 top-inputs">
						<button type="submit" class="btn btn-style">회원가입</button>
					</div>
				</form>
			</div>
		</div>
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
