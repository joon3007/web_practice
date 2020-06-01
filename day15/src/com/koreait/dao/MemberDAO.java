package com.koreait.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.management.RuntimeErrorException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {

	Connection conn;
	PreparedStatement pstm;
	DataSource dataSource;
	InitialContext context;
	ResultSet rs;

	public int login(String id, String pw) {
		if (checkId(id)) {
			try {
				context = new InitialContext(null);
				dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
				conn = dataSource.getConnection();
				String query = "SELECT count(*) from member where id =? and pw=?";
				pstm = conn.prepareStatement(query);
				pstm.setString(1, id);
				pstm.setString(2, pw);
				rs = pstm.executeQuery();
				while (rs.next()) {
					if (rs.getInt(1) == 1) {
						return 1;
					}
				}
			} catch (NamingException e) {
			} catch (SQLException sqle) {
			} catch (Exception e2) {
			} finally {
				try {
					if (conn != null)
						conn.close();
					if (pstm != null)
						pstm.close();
					if (rs != null)
						rs.close();
				} catch (SQLException sqle) {
				}
			}
		}
		return 0;
	}

	public boolean checkId(String id) {
		// 아이디가 존재하면 참 없으면 거짓
		try {
			context = new InitialContext(null);
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
			conn = dataSource.getConnection();

			String query = "SELECT count(*) from member where id = ?";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, id);
			rs = pstm.executeQuery();
			while (rs.next()) {
				if (rs.getInt(1) > 0)
					return true;
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstm != null)
					pstm.close();
				if (rs != null)
					rs.close();
			} catch (SQLException sqle) {
			}
		}
		return false;
	}
	
	public int join(String id, String name, String pw, String gender, 
			String zipcode, String address, String address_detail, 
			String address_etc, String hp, String[] hobbys) {
		
		try {
			context = new InitialContext(null);
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
			conn = dataSource.getConnection();
			String query = "insert into \"MEMBER\" values(?,?,?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, id);
			pstm.setString(2, name);
			pstm.setString(3, pw);
			pstm.setString(4, gender);
			pstm.setString(5, zipcode);
			pstm.setString(6, address);
			pstm.setString(7, address_detail);
			pstm.setString(8, address_etc);
			pstm.setString(9, hp);
			String hobby_str = "";
			for(String data: hobbys) {
				hobby_str += data+", ";
			}
			hobby_str = hobby_str.substring(0, hobby_str.length()-2);
			pstm.setString(10, hobby_str);
			int result = pstm.executeUpdate();
			if(result != 0) {
				return 1;
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstm != null)
					pstm.close();
				if (rs != null)
					rs.close();
			} catch (SQLException sqle) {
			}
		}
		return 0;
	}
}
