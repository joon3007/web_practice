package com.koreait.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;

public class MemberLogoutAtion implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		session.invalidate();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/app/board/boardList.jsp");
		return forward;
	}

}
