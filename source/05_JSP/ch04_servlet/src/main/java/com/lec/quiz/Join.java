package com.lec.quiz;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
@WebServlet("/join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달받은 파라미터 변수에 받기
		String hiddenParam 	= request.getParameter("hiddenParam");
		String name     = request.getParameter("name");
		String id		= request.getParameter("id");
		String pw		= request.getParameter("pw");
		String birth 	= request.getParameter("birth"); // 파라미터 값은 무조건 문자열 전달
		String[] hobby 	= request.getParameterValues("hobby");
		String gender 	= request.getParameter("gender");
		String email   	= request.getParameter("email");
		String[] mailSend = request.getParameterValues("mailSend");
		// 브라우저 창에 출력하기
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<link href='css/join.css' rel='stylesheet'>");
		out.println("</head>");
		out.println("<body>");
		out.println("<div id='joinForm_wrap'>");
		out.println("<div id='join_title'>회원가입정보</div>");
		out.println("<h2>이름 : " + name + "</h2>");
		out.println("<h2>아이디 : " + id + "</h2>");
		out.println("<h2>비번 : ");
		for(int i=0 ; i<pw.length() ; i++) {
			out.print("*");
		}
		out.println("</h2>");
		out.println("<h2>생년월일 : "+(birth.equals("")? "-":birth)+"</h2>");
		out.println("<h2>취미 : ");
		for(int i=0 ; i<hobby.length ; i++)
			if(i==hobby.length-1)
				out.print(hobby[i]);
			else
				out.print(hobby[i]+", ");
		out.println("</h2>");
		out.println("<h2>성별 : "+gender+"</h2>");
		out.println("<h2>이메일 : "+(email.equals("") ? "-":email)+"</h2>");
		out.println("<h2>메일수신동의 : ");
		for(String send : mailSend) {
			out.print(send + " ");
		}
		out.println("</h2>");
		out.println("</div>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}