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
<title>예약 폼</title>
</head>
<body>
예약폼이고 정보들 입력 후
<form action="doReservation2" method="post">
time<input type="text" name="revTime"><br>
count<input type="number" name="headCount"><br>
id<input type="text" name="id"><br>
resNo<input type="text" name="resNo" ><br>
<button type="submit" class="btn btn-style mt-0 ml-5">이거 누르면 예약 완료됨</button>
</form>
</body>
</html>