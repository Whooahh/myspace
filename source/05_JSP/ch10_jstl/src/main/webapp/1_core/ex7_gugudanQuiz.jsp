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
	<!-- 1. ex6_gugudanResult.jsp 에서 정답/오답 출력 -->
	<!-- 2. ex7_gugudanQuiz.jsp 한 파일에서 에서 정답/오답까지 출력 -->
	<form action="">
		<p>
			<input type="text" name="n1" readonly="readonly" size="1"
						value="<%=(int)(Math.random()*9+1)%>">
			<b>*</b>
			<input type="text" name="n2" readonly="readonly" size="1"
						value="<%=(int)(Math.random()*9)+1 %>">
			<b>=</b>
			<input type="number" name="result" placeholder="정답입력">
		</p>
		<p>
			<input type="submit" value="확인">
		</p>
	</form>
	<c:set var="n1" value="${param.n1 }"/>
	<c:set var="n2" value="${param.n2 }"/>
	<c:set var="result" value="${param.result }"/>
	<c:if test="${not empty result }">
		<c:if test="${n1*n2 eq result }">
			<h2>${n1 } * ${n2 } = ${result }은(는) 정답</h2>
		</c:if>
		<c:if test="${n1*n2 != result }">
			<h2>${n1 } * ${n2 } = ${result }은(는) 오답</h2>
		</c:if>
	</c:if>
</body>
</html>









