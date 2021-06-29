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
import service.Cm_BoardDao;
import service.RentDao;
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
			String b_title = request.getParameter("title");
			String b_contents = request.getParameter("contents");
			String b_writer = request.getParameter("writer");
			
			System.out.println("b_title->"+b_title);
			System.out.println("b_contents->"+b_contents);
			System.out.println("b_writer->"+b_writer);
			
			int b_num = 0;
			
			Cm_BoardDao rd = new Cm_BoardDao();
			int value = rd.boardInsert(b_title, b_contents, b_writer);
			System.out.println("value:"+value);
			
			if(value >0) {
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard.do?b_num="+b_num);	
			}else{
				response.sendRedirect(request.getContextPath()+"/Board/CmBoardwrite.do?b_num="+b_num);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
