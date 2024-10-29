<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/ex.css" rel="stylesheet">
</head>
<body>
	<c:set var="n1" value="${param.n1 }"/>
	<c:set var="n2" value="${param.n2 }"/>
	<c:set var="result" value="${param.result }"/>
	<h2>
		${n1 } * ${n2 } = ${result }은(는) 
		<c:if test="${n1*n2 eq result }">
			정답
		</c:if>
		<c:if test="${n1*n2 != result }">
			오답
		</c:if>
	</h2>
</body>
</html>