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
		
		if(str.equals("/board/boardWrite.do")) {
			
			RequestDispatcher rd =request.getRequestDispatcher("/boardWrite.jsp");
			rd.forward(request, response);
		}else if(str.equals("/board/boardWriteAction.do")) {
			//값을 넘겨 받는다
			String subject = request.getParameter("subject");
			String contents = request.getParameter("contents");
			String writer = request.getParameter("writer");
			String password = request.getParameter("password");
			
			//메소드를 호출한다.
			//filename은 일단 null처리
			String fileName = null;
			String ip = InetAddress.getLocalHost().getHostAddress();
			
			HttpSession session = request.getSession();
			int midx = 0;
			if(session.getAttribute("midx")== null) {
				midx= 32;
			}else {
				midx = (int)session.getAttribute("midx");
			}
			System.out.println("midx"+midx);
			BoardDao bd = new BoardDao();
			System.out.println("bd"+bd);
			int value = bd.boardInsert(subject, contents, writer, password, fileName, ip, midx);
			System.out.println("value"+value);
			//처리 후 이동한다.
			if(value > 0) {
			response.sendRedirect(request.getContextPath()+"/board/boardList.do");
			}else {
			response.sendRedirect(request.getContextPath()+"/board/boardWrite.do");
			}
		}else if(str.equals("/board/boardList.do")) {
			
			String page = request.getParameter("page");
			if (page== null) page="1";
			int page2 = Integer.parseInt(page);
			System.out.println("page2"+page2);
			
			String keyword = request.getParameter("keyword");	//키워드 검색을 위해
			if(keyword == null)keyword = "";
			
			SearchCriteria scri = new SearchCriteria();		// 써치 크리테리아에 키워드와 페이지를 담아둔다.
			scri.setKeyword(keyword);
			scri.setPage(page2);
			System.out.println("scri"+scri);
			
			BoardDao bd = new BoardDao();
			int cnt = bd.boardTotalCount(keyword);		//전체 리스트 갯구를 구한다
			System.out.println("cnt"+cnt);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);					//페이지페이커에 서치크리테리아를 담는다.
			pm.setTotalCount(cnt);				//전체 갯수를 담은후에 페이지 네비게이션에 시작과 끝, 이전과 다음
			
			
			
			ArrayList<BoardVo> alist = bd.boardSelectAll(page2, keyword);
			
			request.setAttribute("alist", alist);
			request.setAttribute("pm", pm);
			
			RequestDispatcher rd = request.getRequestDispatcher("/boardList.jsp");
			rd.forward(request, response);
			
		}else if (str.equals("/board/boardContents.do")) {
			String bidx = request.getParameter("bidx");
			int bidx2 = Integer.parseInt(bidx);
			
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.boardSelectOne(bidx2);
			bd.boardViewCount(bidx2);
			
			request.setAttribute("bv", bv);
			RequestDispatcher rd = request.getRequestDispatcher("/boardContents.jsp");
			rd.forward(request, response);
		}else if (str.equals("/board/boardModify.do")) {
			
			String bidx = request.getParameter("bidx");
			int bidx2 = Integer.parseInt(bidx);
			
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.boardSelectOne(bidx2);
			
			request.setAttribute("bv", bv);
			RequestDispatcher rd = request.getRequestDispatcher("/boardModify.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/board/boardModifyAction.do")) {
			
			System.out.println("test");
			//1. 값을 넘겨 받는다
			String bidx = request.getParameter("bidx");
			int bidx2 = Integer.parseInt(bidx);
			
			String password = request.getParameter("password");
			String subject = request.getParameter("subject");
			String contents = request.getParameter("contents");
			String writer = request.getParameter("writer");
			
			//2. 처리한다
			BoardDao bd = new BoardDao();
			int value = bd.boardModify(bidx2, password, subject, contents, writer);
			System.out.println("value:"+value);
			
			//3. 이동한다
			if(value >0) {
				response.sendRedirect(request.getContextPath()+"/board/boardContents.do?bidx="+bidx);	
			}else{
				response.sendRedirect(request.getContextPath()+"/board/boardModify.do?bidx="+bidx);
			}
			
		}else if(str.equals("/board/boardDelete.do")) {
			
			String bidx = request.getParameter("bidx");
			int bidx2 = Integer.parseInt(bidx);
			
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.boardSelectOne(bidx2);
			
			request.setAttribute("bv", bv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/boardDelete.jsp");
			rd.forward(request, response);
		}else if(str.equals("/board/boardDeleteAction.do")) {
			
			//1. 값을 넘겨 받는다
			String bidx = request.getParameter("bidx");
			int bidx2 = Integer.parseInt(bidx);
			String password = request.getParameter("password");
			
			//2. 처리한다.
			BoardDao bd = new BoardDao();
			int value = bd.boardDelete(bidx2, password);
			
			//3. 이동한다
			if(value > 0) {
				response.sendRedirect(request.getContextPath()+"/board/boardList.do");
			}else {
				response.sendRedirect(request.getContextPath()+"/board/boardDelete.do?bidx="+bidx);	
			}
		}else if(str.equals("/board/boardReply.do")) {
			String bidx = request.getParameter("bidx");
			String originbidx = request.getParameter("originbidx");			
			String depth = request.getParameter("depth");
			String llevel = request.getParameter("llevel");

			request.setAttribute("bidx", bidx);
			request.setAttribute("originbidx", originbidx);
			request.setAttribute("depth", depth);
			request.setAttribute("llevel", llevel);
			
			RequestDispatcher rd = request.getRequestDispatcher("/boardReply.jsp");
			rd.forward(request, response);
		}else if(str.equals("/board/boardReplyAction.do")) {
			//1.넘어온값
			System.out.println("test");
			int bidx = Integer.parseInt(request.getParameter("bidx"));
			int originbidx = Integer.parseInt(request.getParameter("originbidx"));			
			int depth = Integer.parseInt(request.getParameter("depth"));
			int llevel = Integer.parseInt(request.getParameter("llevel"));
			
			String subject = request.getParameter("subject");
			String contents = request.getParameter("contents");
			String writer = request.getParameter("writer");
			String password = request.getParameter("password");
			
			String ip = InetAddress.getLocalHost().getHostAddress();	//ip주소 불러오는법
			
			HttpSession session = request.getSession();	//midx 가져오는법
			int midx = (int)session.getAttribute("midx");
			System.out.println("midx:"+midx);
			//2.처리한다.
			BoardDao bd = new BoardDao();
			bd.boardReply(bidx, originbidx, depth, llevel, subject, contents, writer, password, ip, midx);
			
			
			//3.이동한다.
			response.sendRedirect(request.getContextPath()+"/board/boardList.do");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
