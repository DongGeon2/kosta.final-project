<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	alert("${param.resName} 에 해당하는 식당은 없습니다!^^");
	location.href="${pageContext.request.contextPath}/home";
</script>