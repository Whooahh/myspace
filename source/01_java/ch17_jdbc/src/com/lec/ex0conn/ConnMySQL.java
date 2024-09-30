package com.lec.ex0conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// 오라클 연동 : (1) 드라이버 로드 (jdk-17에서부터 생략가능) 2) DB연결
public class ConnMySQL {
	public static void main(String[] args) {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/dev_user?severTimezone=UTC";
		Connection conn = null;
		
		try {
			Class.forName(driver); // (1) 드라이버 로드
			System.out.println("드라이버 로드 성공");
			conn = DriverManager.getConnection(url, "root", "mysql");
			System.out.println("MySQL 연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage() + "드라이버 오류");
		} catch (SQLException e) {
			System.out.println("e.getMessage()");
		} finally {
			try {
				
				if (conn != null) conn.close();
			}catch (SQLException e) {
				System.out.println(e.getMessage());	
			}
		}
		
	}
}
