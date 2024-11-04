package com.lec.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.lec.dto.Dept;

public class DeptRepository {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url    = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private String uid    = "scott";
	private String upw    = "tiger";	
	private static DeptRepository INSTANCE;
	public static DeptRepository getInstance() {
		if(INSTANCE == null) {
			INSTANCE = new DeptRepository();
		}
		return INSTANCE;
	}	
	private DeptRepository() {
		try {
			Class.forName(driver); // 1단계
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}
	//SELECT DEPTNO, DNAME FROM DEPT 실행결과 return 함수
	public ArrayList<Dept> deptList(){
		ArrayList<Dept> dtos = new ArrayList<Dept>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String query = "SELECT DEPTNO, DNAME FROM DEPT";
		try {
			conn = DriverManager.getConnection(url, uid, upw);// (2)
			pstmt = conn.prepareStatement(query); // (3)
			rs    = pstmt.executeQuery();// (4)+(5)
			while(rs.next()) {//(6)
				int deptno   = rs.getInt("deptno");
				String dname = rs.getString("dname");
				dtos.add(new Dept(deptno, dname));
			}
//			while(rs.next()) {
//				Dept dept = new Dept();
//				dept.setDeptno(rs.getInt("deptno"));
//				dept.setDname(rs.getString("dname"));
//				dtos.add(dept);
//			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally { // (7)
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
}































