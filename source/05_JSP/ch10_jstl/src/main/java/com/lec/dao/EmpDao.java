package com.lec.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.dto.Emp;

public class EmpDao {
	//싱글톤
	private static EmpDao INSTANCE = new EmpDao();
	public static EmpDao getInstance() {
		return INSTANCE;
	}
	private EmpDao() {}
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	// 전체 EmpList return
	public ArrayList<Emp> getEmpList(){
		ArrayList<Emp> dtos = new ArrayList<Emp>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql ="SELECT * FROM EMP";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				String mgr= rs.getString("mgr");
				Timestamp hiredate= rs.getTimestamp("hiredate");
				int sal= rs.getInt("sal");
				int comm= rs.getInt("comm");
				int deptno= rs.getInt("deptno");
				dtos.add(new Emp(empno, ename, job, mgr, hiredate, sal, comm, deptno));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}
	// 매개변수로 검색할 이름과 직책으로 empList return
	public ArrayList<Emp> getEmpList(String schName, String schJob){
		ArrayList<Emp> dtos = new ArrayList<Emp>();
		ArrayList<Emp> dtos = new ArrayList<Emp>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM EMP WHERE ENAME LIKE '%'||UPPER(TRIM(?))||'%' AND JOB LIKE '%'|| TRIM(UPPER(?)) || '%'";
		return dtos;
	}

}
