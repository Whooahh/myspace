<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이 파일은 ex1_hello.jsp파일입니다 (JSP파일은 HTML안에 JAVA가 들어있는 파일)</h1>
	<h4>jsp파일은 html안에 java가 들어있는 파일</h4>
	<h5>cf. 서블릿파일은 java안에 html에 들어있는 파일</h5>
	<%
	int total = 0;
	for (int cnt=1 ; cnt<=100 ; cnt++){
		total += cnt;
	}
	%>
	<h1>1부터 100까지의 누적 합은 <%=total %> 입니다</h1>
</body>
</html>