package com.koreait.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.member.dao.MemberBean;
import com.koreait.app.member.dao.MemberDAO;

public class MemberJoinOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		MemberDAO m_dao = new MemberDAO();
		MemberBean member = new MemberBean();

		member.setMember_id(request.getParameter("member_id"));
		member.setMember_pw(request.getParameter("member_pw"));
		member.setMember_name(request.getParameter("member_name"));
		member.setMember_age(Integer.parseInt(request.getParameter("member_age")));
		member.setMember_gender(request.getParameter("member_gender"));
		member.setMember_email(request.getParameter("member_email"));
		member.setMember_zipcode(request.getParameter("member_zipcode"));
		member.setMember_address(request.getParameter("member_address"));
		member.setMember_address_detail(request.getParameter("member_address_detail"));
		member.setMember_address_etc(request.getParameter("member_address_etc"));
		System.out.println(member.getMember_id());
		
		boolean check = m_dao.join(member);
		System.out.println(check);
		if(!check) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.println("<script>");
			out.println("alert('회원가입 실패, 다시 시도해 주세요.');");
			out.println("</script>");
			out.close();
		}
		//Redirect : setPath를 사용할경우 이전 root경로도 없어지기 때문에
		//반드시 request.getContextPath경로를 붙여준다.
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/app/member/loginForm.jsp");
		return forward;
	}

}
