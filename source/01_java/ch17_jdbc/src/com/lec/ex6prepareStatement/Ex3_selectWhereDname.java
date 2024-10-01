package com.lec.ex6prepareStatement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

// com.lec.ex2selectWhere.Ex2 + Ex3_selectWhereDname 같은 기능
// 부서명을 입력받아 해당 부서정보를 출력하고 해당부서 사원정보 출력
public class Ex3_selectWhereDname {
	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Scanner scanner = new Scanner(System.in);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String deptSql = "SELECT * FROM DEPT WHERE UPPER(DNAME)=UPPER(?)";
		String empSql = "SELECT EMPNO, ENAME, SAL FROM EMP E, DEPT D WHERE DNAME = UPPER(?) AND E.DEPTNO=D.DEPTNO ORDER BY SAL";
		
		try {
			conn = DriverManager.getConnection(url, "scott", "tiger");
			pstmt = conn.prepareStatement(deptSql);
			System.out.print("부서명를 입력하세요 : ");
			String dname = scanner.next();
			pstmt.setString(1, dname);
			rs = pstmt.executeQuery();
			System.out.println(dname + "검색함");
			if(rs.next()) {
				System.out.println("원하는 부서이름 : " + rs.getString("dname"));
				System.out.println("사원의 부서위치 : " + rs.getString("loc"));
				rs.close();
				pstmt.close();
				
				pstmt = conn.prepareStatement(empSql);
				pstmt.setString(1, dname);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					System.out.println("사번\t이름\t급여");
					do {
						int empno = rs.getInt("empno");
						String ename = rs.getString("ename");
						int sal = rs.getInt("sal");
						System.out.println(empno + "\t" + ename + "\t" + sal + "\t");
					} while(rs.next());
				}else {
					System.out.println(dname + "부서의 사원의 정보가 없습니다");
				}
			}else {
				System.out.println(dname + "의 부서의 사원의 정보가 없습니다");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try { // 7. 연결해제
				
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
