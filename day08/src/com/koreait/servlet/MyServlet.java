package com.koreait.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.calculater.Calc;

/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body><p>결과 : ");
		Calc calc = new Calc();
		String opers = "+-*/";
		String[] temp = null;
		boolean check = false;
		String input = request.getParameter("input");
		for(int i = 0; i < opers.length(); i++) {
			for(int j = 0; j < input.length(); j++) {
				if(input.charAt(j) == opers.charAt(i)) {
					try {
						check = true;
						temp = input.split("\\"+opers.charAt(i));
						switch(i) {
						case 0:
							out.println(calc.add(Integer.parseInt(temp[0]), Integer.parseInt(temp[1])));
							break;
						case 1:
							out.println(calc.sub(Integer.parseInt(temp[0]), Integer.parseInt(temp[1])));
							break;
						case 2:
							out.println(calc.mul(Integer.parseInt(temp[0]), Integer.parseInt(temp[1])));
							break;
						case 3:
							try {
								out.println(calc.div(Integer.parseInt(temp[0]), Integer.parseInt(temp[1])));
							} catch (ArithmeticException e) {
								out.println("0으로 나눌수 없습니다.");
							}
							break;
						default:
						}
					} catch (Exception e) {
						out.println("정수만 입력해 주세요.");
					}
					break;
				}
			}
		}
		if(!check) {
			out.println("연산자를 찾지 못했습니다.");
		}
		
//		out.println("<html><body><h1>서블릿으로 만든 페이지</h1>");
		
		//out.println("<a href=\"intro\">JSP로 만는 페이지</a>");
		out.println("<br><a href=\"intro\">다시 계산하기</a>");
		out.println("</p></body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
