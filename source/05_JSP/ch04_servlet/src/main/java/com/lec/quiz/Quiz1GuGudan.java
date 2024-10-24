package com.lec.quiz;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/quiz1GuGudan")
public class Quiz1GuGudan extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] su = request.getParameterValues("su");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(su!=null) {
			for(String s: su) {
				int dansu = Integer.parseInt(s);
				out.println("<h4>"+dansu + "단</h4>");
				for(int i=1 ; i<=9 ; i++) {
					out.printf("%d * %d = %d<br>", dansu, i, dansu*i);
				}
			}
		}else {
			out.println("<h4>선택된 구구단이 없습니다</h4>");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}