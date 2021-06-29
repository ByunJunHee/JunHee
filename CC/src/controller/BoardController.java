package controller;

import java.io.IOException;
import java.net.InetAddress;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.PageMaker;
import domain.SearchCriteria;
import service.BoardDao;
import service.BoardVo;

@WebServlet("/BoardController")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String uri = request.getRequestURI();		
		int pnamelength = request.getContextPath().length();
		String str = uri.substring(pnamelength);
		System.out.println("url주소:"+str);
		
		if(str.equals("/Board/CmBoard.do")) {
			
			RequestDispatcher rd =request.getRequestDispatcher("/CmBoard.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Board/CmBoard2.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/CmBoard2.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Board/CmBoard3.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/CmBoard3.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Board/CmBoardWrite.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/CmBoardWrite.jsp");
			rd.forward(request, response);
		}else if(str.equals("/board/boardWriteAction.do")) {
			//값을 넘겨받는다
			String title = request.getParameter("title");
			String contents = request.getParameter("contents");
			String writer = request.getParameter("writer");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
