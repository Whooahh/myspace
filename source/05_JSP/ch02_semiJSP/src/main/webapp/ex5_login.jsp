<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="ex5_loginPro.jsp" method="post">
	<table>
		<tr>
			<th>이름</th> <td><input type="text" name="name"></td>
			</tr>
		<tr>
			<th>아이디</th> <td><input type="text" name="id"></td>
			</tr>
		<tr>
			<th>패스워드</th> <td><input type="password" name="pw"></td>
			</tr>
		<tr>
			<th colspan="2"><input type="submit" value="로그인"></th>
	</table>
</form>
</body>
</html>