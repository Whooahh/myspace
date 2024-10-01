package com.lec.ex3insert;

import java.sql.*;
import java.util.Scanner;


// 사용자에게 부서번호, 부서명, 부서위치를 입력받아 insert
public class InsertDeptConfirm {
	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Scanner scanner = new Scanner(System.in);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		System.out.print("입력할 부서 번호는? : ");
		int deptno = scanner.nextInt();
		// deptno 중복체크
		String confrimSql = "SELECT COUNT (*) CNT FROM DEPT WHERE DEPTNO=" +deptno;
		
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(confrimSql);
			rs.next();
			int cnt = rs.getInt(1); // 첫번째 열 출력
			if(cnt==0) {
				//insert 수행
				System.out.print("입력할 부서명은? : ");
				String dname = scanner.next();
				System.out.print("입력할 부서 위치는? : ");
				String loc = scanner.next();
				String insertSql = String.format("INSERT INTO DEPT VALUES (%d, '%s', '%s')", deptno, dname, loc);
				int result = stmt.executeUpdate(insertSql);
				if(result>0) {
					System.out.println("입력 성공");
				}
			}else {
				System.out.println("중복 된 부서 번호는 입력이 불가합니다.");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try { // 7. 연결해제
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
