<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% // ex5_loginPro.jsp?name=hong&id=aaa&pw=1
	String name = request.getParameter("name");
	String id   = request.getParameter("id");
	String pw   = request.getParameter("pw");
%>
	<h2>아이디는 <%=id %>이고, </h2>
	<h2>비밀번호는 <%=pw %>입니다</h2>
	<h2><%=name %>님 반갑습니다</h2>
</body>
</html>













