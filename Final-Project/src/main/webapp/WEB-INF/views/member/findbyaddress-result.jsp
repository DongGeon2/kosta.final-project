<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
${param.address}에 사는 회원명단 <br><br>
<c:forEach items="${memberList}" var="member">
	${member.id} ${member.name}<br>
</c:forEach>