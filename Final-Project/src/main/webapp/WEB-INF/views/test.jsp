<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ratingStar.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
	$("#s1").click(function(){
		$(".fa-star").css("color","black");
		$("#s1").css("color","#F05522");
		$("input").attr("value", "1");
	});
	$("#s2").click(function(){
		$(".fa-star").css("color","black");
		$("#s1,#s2").css("color","#F05522");
	});
	$("#s3").click(function(){
		$(".fa-star").css("color","black");
		$("#s1,#s2,#s3").css("color","#F05522");
	});
	$("#s4").click(function(){
		$(".fa-star").css("color","black");
		$("#s1,#s2,#s3,#s4").css("color","#F05522");
		
	});
	$("#s5").click(function(){
		$(".fa-star").css("color","black");
		$(".fa-star").css("color","#F05522");
	});
});
</script>
<div class="rating">
	<span class="fa fa-star fa-2x" id="s1" ><input type="hidden" name="star1"></span>
	<span class="fa fa-star fa-2x" id="s2"><input type="hidden" name="star2"></span>
	<span class="fa fa-star fa-2x" id="s3"><input type="hidden" name="star3"></span>
	<span class="fa fa-star fa-2x" id="s4"><input type="hidden" name="star4"></span>
	<span class="fa fa-star fa-2x" id="s5"><input type="hidden" name="star5"></span>
</div>
</html>