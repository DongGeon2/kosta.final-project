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
<title>예약 결과</title>
</head>
<body>
<div class="container">
<h3>${reservation.memberVO.id }</h3>
<h3>${reservation.restaurantVO.resNo }</h3>
<h3>${reservation.revTime }</h3>
<h3>${reservation.revHour}</h3>
<h3>${reservation.headCount }</h3>
</div>
</body>
</html>