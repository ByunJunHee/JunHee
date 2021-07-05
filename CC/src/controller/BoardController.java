package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.PageMaker;
import domain.SearchCriteria;
import service.BoardDao;
import service.BoardVo;
import service.CmBoardDao;
import service.CmBoardVo;

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
			
			String page = request.getParameter("page");
			if (page == null) page= "1";
			int page2 = Integer.parseInt(page);
			System.out.println("page2"+page2);
			
			
			String keyword = request.getParameter("keyword");	//키워드 검색을 위해		
			if(keyword == null) keyword = "";
				

			
			SearchCriteria scri = new SearchCriteria();   //서치크리테리아에 키워드와 페이지를 담아논다
			scri.setKeyword(keyword);
			scri.setPage(page2);
			System.out.println("scri"+scri);
			
						
			CmBoardDao bd = new CmBoardDao();
			int cnt= bd.boardTotalCount(keyword);  //전체 리스트 갯수를 구한다
			System.out.println("cnt"+cnt);
			
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);  //페이지메이커에 서치크리테리아는 먼저 담는다
			pm.setTotalCount(cnt);			//전체갯수를 담은후에 페이지 네비게이션에 시작과 끝, 이전과 다음 페이지를 정한다
			
			
			System.out.println("pm"+pm);
			
			ArrayList<CmBoardVo> alist  =  bd.boardSelectAll(page2, keyword);
						
			request.setAttribute("alist", alist);	
			request.setAttribute("pm", pm);		
			
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
			
		}else if(str.equals("/Board/CmBoardWriteAction.do")) {
			//값을 넘겨받는다
			String b_title = request.getParameter("b_title");
			String b_contents = request.getParameter("b_contents");
			
			
			System.out.println("b_title->"+b_title);
			System.out.println("b_contents->"+b_contents);
			
			
			
			CmBoardDao rd = new CmBoardDao();
			int value = rd.boardInsert(b_title, b_contents);
			System.out.println("value:"+value);
			
			if(value >0) {
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard.do");	
			}else{
				response.sendRedirect(request.getContextPath()+"/Board/CmBoardwrite.do");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
