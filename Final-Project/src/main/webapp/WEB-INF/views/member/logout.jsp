<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<sec:authorize access="isAuthenticated()">
	<script type="text/javascript">
		$(document).ready(function() {
			$("#logoutAction").click(function() {                        
			  $("#logoutForm").submit();
			});
		});
		location.href="${pageContext.request.contextPath}/home";
	</script>
	<form id="logoutForm"
		action="${pageContext.request.contextPath}/logout" method="post" style="display: none">
	</form>
		<li class="nav-item"><a class="nav-link" href="#" id="logoutAction">Logout</a></li>
	<sec:csrfInput />
</sec:authorize>

