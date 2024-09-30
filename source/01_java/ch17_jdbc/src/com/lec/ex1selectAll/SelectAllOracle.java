package com.lec.ex1selectAll;

import java.sql.*;

public class SelectAllOracle {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "SELECT * FROM EMP";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver); // 1. 드라이버 로드
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement(); // 3. SQL 전송
			rs =stmt.executeQuery(sql); // 4+5 SQL 전송 + SQL 결과 받기
			// 6. 원하는 로직 수행
			if (rs.next()) {
				System.out.println("사번\t이름\t직책\t사번\t상사사번\t입사일\t급여\t상여\t부서번호");
				do {
					int empno = rs.getInt(1); // 첫번째 필드
					String ename = rs.getString("ename"); // sql 결과의 title에 ename인 값
					String job = rs.getNString("job");
					String mgr = rs.getString("mgr");
					//String hiredate = rs.getString("hiredate");
					Date hiredate = rs.getDate("hiredate"); // java.sql.Date
					//Timestamp hiredate1 = rs.getTimestamp("hiredate");
					int sal = rs.getInt("sal");
					int comm = rs.getInt("comm");
					int deptno = rs.getInt("deptno");
					System.out.printf("%d\t %s\t %s\t %s\t %TF\t %d\t %d\t %d\n", 
							empno,ename, job, mgr, hiredate, sal, comm, deptno);
				}while(rs.next());
			}else {
				System.out.println("등록된 사원 정보가 없습니다");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
