package com.koreait.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.board.dao.BoardBean;
import com.koreait.app.board.dao.BoardDAO;
import com.koreait.app.board.dao.FilesDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		BoardDAO b_dao = new BoardDAO();
		BoardBean bean = new BoardBean();
		FilesDAO f_dao = new FilesDAO();
		
		//resquest.getServletContext().getRealPath("/")+"/upload/";
		String saveFolder = "C:\\Users\\kimys\\OneDrive\\문서\\wep3\\workspace\\day20\\WebContent\\app\\upload";
		int fileSize = 5 * 1024 * 1024; //5m
		
		//http://servlets.com/cos/ : 파일업로드 라이브러리
		try {
			MultipartRequest multi = null;			
			multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", 
					new DefaultFileRenamePolicy());
			bean.setBoard_title(multi.getParameter("board_title"));
			bean.setBoard_contents(multi.getParameter("board_contents"));
			bean.setBoard_member_id(multi.getParameter("member_id"));
			
			b_dao.insertBoard(bean);
			f_dao.insertFiles(multi, b_dao.getBoardSeq());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return forward;
	}

}
