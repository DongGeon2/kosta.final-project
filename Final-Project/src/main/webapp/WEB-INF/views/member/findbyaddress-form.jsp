<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<form action="${pageContext.request.contextPath}/findMemberByAddress">
<select name="address" required="required">
<option value="">-주소-</option>
<c:forEach items="${addressList}" var="address">
	<option value="${address}">${address}</option>
</c:forEach>
</select>
<input type="submit" value="검색">
</form>