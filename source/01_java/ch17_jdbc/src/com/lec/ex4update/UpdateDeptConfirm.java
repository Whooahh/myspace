package com.lec.ex4update;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class UpdateDeptConfirm {
	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Scanner scanner = new Scanner(System.in);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		System.out.println("수정할 부서 번호는? : ");
		int deptno = scanner.nextInt();
		// 부서번호 존재여부 confirm
		String confirmSql = "SELECT * FROM DEPT WHERE DEPTNO=" + deptno;
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(confirmSql);
			if(rs.next()) {
				System.out.print("수정할 부서명은? : ");
				String dname = scanner.next();
				System.out.print("수정할 부서위치는? : ");
				String loc = scanner.next();
				String updateSql = String.format("UPDATE DEPT "
						+ "    SET DNAME=UPPER('%s'),"
						+ "    LOC = UPPER('%s')"
						+ "    WHERE DEPTNO=%d", dname, loc, deptno);
				int result = stmt.executeUpdate(updateSql);
				if(result>0) {
					System.out.println("수정 성공");
				}
			}else {
				System.out.println(deptno + "번 부서는 유효하지 않은 부서번호 입니다.");
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
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
