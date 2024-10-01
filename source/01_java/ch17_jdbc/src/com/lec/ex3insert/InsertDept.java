package com.lec.ex3insert;

import java.util.Scanner;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

// 사용자에게 부서번호, 부서명, 부서위치를 입력받아 insert
public class InsertDept {
	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Scanner scanner = new Scanner(System.in);
		Connection conn = null;
		Statement stmt = null;
		System.out.print("입력할 부서 번호는? : ");
		int deptno = scanner.nextInt();
		System.out.print("입력할 부서명은? : ");
		String dname = scanner.next();
		System.out.print("입력할 부서 위치는? : ");
		String loc = scanner.next();
		String sql = String.format("INSERT INTO DEPT VALUES (%d, '%s', '%s')", deptno, dname, loc);
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt  = conn.createStatement();
			int result = stmt.executeUpdate(sql);
			System.out.println(result>0? "입력성공" : "입력실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage() +  "SQL문 오류 또는 중복된 부서번호 입니다.");
		}finally {
			try { // 7. 연결해제
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
	}
}
}
