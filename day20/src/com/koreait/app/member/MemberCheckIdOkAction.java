package com.koreait.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.member.dao.MemberBean;
import com.koreait.app.member.dao.MemberDAO;

public class MemberCheckIdOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		MemberDAO m_dao = new MemberDAO();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		boolean check = false;
		
		String id = request.getParameter("id");
		
		check = m_dao.checkId(id);
		if (check) {
			out.println("not-ok");
		}else {
			out.println("ok");
		}
		out.close();
		return null;
	}

}
