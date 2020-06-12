package com.koreait.app.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mybatis.config.SqlMapConfig;

public class MemberDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public MemberDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	public boolean join(MemberBean member) {
		boolean check = false;
		if((Integer)sqlsession.insert("Member.join", member) == 1) {
			check = true;
		}
		return check;
	}
	
	public boolean checkId(String id) {
		boolean check = false;
		HashMap<String, String> data = new HashMap<>();
		data.put("member_id", id);
		if((Integer)sqlsession.selectOne("Member.checkId", data) > 0) {
			check = true;
		}else {
			check = false;
		}
		return check;
	}
	
	public Map<String,String> login(String id, String pw) {
		HashMap<String, String> data = new HashMap<>();
		data.put("id", id);
		data.put("pw", pw);
		
		Map<String,String> loginData = sqlsession.selectOne("Member.login", data);
		
		return loginData;
	}
}
