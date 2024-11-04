<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String conPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="<%=conPath %>/css/ex.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		String name = request.getParameter("name");
		String numStr = request.getParameter("num");
	%>
	<fieldset>
		<legend>입력</legend>
		<form action="">
			<p>이름 <input type="text" name="name" value="<%=name==null? "" : name.trim()%>"></p>
			<p>숫자 <input type="number" name="num" min="1" value="<%=numStr%>"></p>
			<input type="submit" value="누적">
		</form>
	</fieldset>
	<%
		if(numStr!=null && !numStr.equals("")){
			int num = Integer.parseInt(numStr);
			int tot = 0; // 1부터 num까지 누적할 변수
			for(int i=1 ; i<=num ; i++){
				tot += i;
			}
			out.println("<h2>1부터 " + num + "까지 누적합은 " + tot + "입니다</h2>");
		}
	%>
</body>
</html>