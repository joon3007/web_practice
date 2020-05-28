package com.koreait.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstm;
	ResultSet rs;
	
	MemberBean member;
	
	public ArrayList<MemberBean> select(String name) {
		String query ="SELECT * FROM MEMBER WHERE NAME=?";
		ArrayList<MemberBean> result = new ArrayList<>();
		SimpleDateFormat sdf = new SimpleDateFormat();
		try {
			conn = DBConnection.getConnection();
			pstm = conn.prepareStatement(query);
			pstm.setString(1, name);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				member = new MemberBean();
				member.setNum(rs.getInt(1));
				member.setName(rs.getString(2));
				member.setBirthday(sdf.format(rs.getDate(3)));
				result.add(member);
			}
		}catch (SQLException sqle) {
			System.out.println("쿼리오류 : (select)");
		}catch (Exception e) {
			System.out.println("알 수 없는 오류");
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstm != null) {
					pstm.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}
		}
		return result;
	}
}
