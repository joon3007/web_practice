package com.koreait.beans;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:Orcl";
			String user = "hr";
			String pw = "1234";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,user,pw);
			
		}catch(ClassNotFoundException cne) {
			System.out.println("드라이버 로딩실패");
		}catch(SQLException sqle) {
			System.out.println("DB접속 오류");
		}catch(Exception e) {
			System.out.println("알수없는 오류");
		}
		return conn;
	}
}
