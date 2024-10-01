
package com.lec.ex2selectWhere;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
// 사용자에게 원하는 부서번호를 입력받아 부서 정보 출력
public class Ex1_selectWhereDeptno {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs   = null;
		Scanner sc = new Scanner(System.in);
		System.out.print("원하는 부서번호는? ");
		int deptno = sc.nextInt();
		sc.close();
		String sql = "SELECT * FROM DEPT WHERE DEPTNO=" + deptno;
		try {
			// Class.forName(driver); 1. 드라이버 로드 (jdk17에서 생략 가능)
			conn = DriverManager.getConnection(url, "scott", "tiger"); // 2. DB연결
			stmt = conn.createStatement(); // 3. SQL문 전송 객체
			rs   = stmt.executeQuery(sql); // 4+5. SQL전송 + 결과받기
			if(rs.next()) { // 6. 원하는 로직
				String dname = rs.getString("dname");
				String loc   = rs.getString("loc");
				System.out.println(deptno + "번 부서정보는 다음과 같습니다");
				System.out.println("부서명 : " + dname);
				System.out.println("지역 : " + loc);
			}else {
				System.out.println("해당 부서가 존재하지 않습니다");
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

