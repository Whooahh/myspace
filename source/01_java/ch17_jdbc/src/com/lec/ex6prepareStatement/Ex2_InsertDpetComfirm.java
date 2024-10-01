package com.lec.ex6prepareStatement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Ex2_InsertDpetComfirm {
	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Scanner scanner = new Scanner(System.in);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String confirmSql ="SELECT COUNT (*) CNT FROM DEPT WHERE DEPTNO=?";
		String insertSql = "INSERT INTO DEPT VALUES (?, UPPER(?), UPPER(?))";
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(confirmSql);
			System.out.print("입력할 부서번호");
			int deptno = scanner.nextInt();
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");
			if(cnt !=0) {
				System.out.println("중복된 부서번호는 입력이 불가합니다.");
			}else {
				rs.close();
				pstmt.close();
				pstmt = conn.prepareStatement(insertSql);
				pstmt.setInt(1, deptno);
				System.out.print("부서명은? : ");
				pstmt.setString(2, scanner.next());
				System.out.print("부서 위치는? : ");
				pstmt.setString(3, scanner.next());
				int result = pstmt.executeUpdate();
				System.out.println(result>0? "입력 성공" : "입력 실패");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try { // 7. 연결해제
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
