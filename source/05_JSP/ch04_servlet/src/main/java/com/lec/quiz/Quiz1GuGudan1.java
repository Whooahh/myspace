package com.lec.quiz;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import org.apache.catalina.tribes.util.Arrays;

@WebServlet("/quiz1GuGudan1")
public class Quiz1GuGudan1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] su = request.getParameterValues("su");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(su!=null) {
			out.println("<table>");
			out.println("<tr>");
			for(int j=0 ; j<su.length ; j++) {
				out.printf("<th style='padding:10px;'>%s단</th>", su[j]);
			}
			out.println("</tr>");
			for(int i=1 ; i<=9 ; i++) {
				out.println("<tr>");
				for(int j=0 ; j<su.length ; j++) {
					int dansu = Integer.parseInt(su[j]);
					out.printf("<th>%d * %d = %d</th>", dansu, i, dansu*i);
				}
				out.println("<tr>");
			}
			out.println("</table>");
		}else {
			out.println("<h4>선택된 구구단이 없습니다</h4>");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}