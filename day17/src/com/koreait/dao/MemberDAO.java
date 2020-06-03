package com.koreait.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mybatis.config.SqlMapConfig;

public class MemberDAO {
	
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public MemberDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	public int login(String id, String pw) {
		sqlsession = sessionf.openSession();
		HashMap<String, String> data = new HashMap<>();
		data.put("id", id);
		data.put("pw", pw);
		
		if((Integer)sqlsession.selectOne("Member.login", data) != 0) return 1;
		else return 0;
	}

	public boolean checkId(String id) {
		sqlsession = sessionf.openSession();
		HashMap<String, String> data = new HashMap<>();
		data.put("id", id);
		int temp = (Integer)sqlsession.selectOne("Member.checkId", data);
		if(temp == 1) return true;
		else return false;
	}
	
	public int join(String id, String name, String pw, String gender, 
			String zipcode, String address, String address_detail, 
			String address_etc, String hp, String[] hobbys) {
		
		sqlsession = sessionf.openSession();
		HashMap<String, String> data = new HashMap<>();
		data.put("id", id);
		data.put("name", name);
		data.put("pw", pw);
		data.put("gender", gender);
		data.put("zipcode", zipcode);
		data.put("address", address);
		data.put("address_detail", address_detail);
		data.put("address_etc", address_etc);
		data.put("hp", hp);
		String hobby_str ="";
		for(String hobby: hobbys) {
			hobby_str += hobby+",";
		}
		//hobby_str.substring(0, hobby_str.length()-1);
		data.put("hobby", hobby_str);
		
		int temp = (Integer)sqlsession.insert("Member.join", data);
		if(temp == 1) return 1;
		else return 0;
	}
}
