package com.koreait.app.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.mybatis.config.SqlMapConfig;

public class MemberDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public MemberDAO() {
		sqlsession = sessionf.openSession();
	}
	
	public boolean join(MemberBean member) {
		boolean check = false;
		if(sqlsession.insert("Member.join", member) == 1) {
			check = true;
		}
		return check;
	}
}
