package com.koreait.app.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.board.dao.BoardBean;
import com.koreait.app.board.dao.BoardDAO;
import com.koreait.app.member.dao.MemberBean;
import com.koreait.app.member.dao.MemberDAO;

public class BoardListAction implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		BoardDAO b_dao = new BoardDAO();
		BoardBean board = new BoardBean();
		
		//세션사용
		HttpSession session = request.getSession();
		
		String page_num = request.getParameter("page");
		int page = page_num == null ? 1 : Integer.parseInt(page_num);
		int pageSize = 10;
		int total_cnt = b_dao.getBoardCnt();
		
		int endRow = page*10;
		int startRow = endRow - 9;
		
		int startPage = ((page - 1) / pageSize)*pageSize + 1;
		int totalPage = (total_cnt-1) / pageSize +1;
		int endPage = (startPage + 9) <= totalPage ? (startPage + 9) : totalPage;
		
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalCnt", total_cnt);
		request.setAttribute("nowPage", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("boardList", b_dao.getBoardList(startRow, endRow));
		
		forward.setRedirect(false);
		String u_type = (String) session.getAttribute("admin");
		if(u_type == null) {
			forward.setPath("/app/board/boardList.jsp");						
		}else if(u_type.equals("1")){
			forward.setPath("/app/board/boardList_admin.jsp");			
		}else {
			forward.setPath("/app/board/boardList.jsp");			
		}
		return forward;
	}

}
