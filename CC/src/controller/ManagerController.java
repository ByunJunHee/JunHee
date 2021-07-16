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
import service.CmBoardDao;
import service.CmBoardVo;
import service.CmCarGalleryDao;
import service.CmCarGalleryVo;
import service.CmNoticeDao;
import service.CmNoticeVo;
import service.CmQnADao;
import service.RentDao;

@WebServlet("/ManagerController")
public class ManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	   
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//response.getWriter().append("Served at: ").append(request.getContextPath());
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			
			String uri = request.getRequestURI();		
			int pnamelength = request.getContextPath().length();
			String str = uri.substring(pnamelength);
			System.out.println("url주소:"+str);
		
		if(str.equals("/Manager/Manager_member.do")) {
			
			RequestDispatcher rd =request.getRequestDispatcher("/Manager_member.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Manager/Manager_Rentpage_main.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/Manager_Rentpage_main.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/Manager/Manager_rentcar_write.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/Manager_rentcar_write.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Manager/Manager_cardb.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/Manager_cardb.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Manager/Manager_cardb2.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/Manager_cardb2.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Manager/Manager_rentcar_modify.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/Manager_rentcar_modify.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Manager/Manager_rentcar_writeAction.do")) {
			
			String kr_name = request.getParameter("kr_name");	
			String kr_spec = request.getParameter("kr_spec");
			String kr_price	= request.getParameter("kr_price");
			String kr_discount = request.getParameter("kr_discount");
			String kr_dtoption = request.getParameter("kr_dtoption");
			String kr_dbenefit = request.getParameter("kr_dbenefit");
			
			System.out.println("kr_name = "+kr_name);
			System.out.println("kr_spec = "+kr_spec);
			System.out.println("kr_price = "+kr_price);
			System.out.println("kr_discount = "+kr_discount);
			System.out.println("kr_dtoption = "+kr_dtoption);
			System.out.println("kr_dbenefit = "+kr_dbenefit);
			
			
			RentDao rda = new RentDao();
			rda.RentResisterInsert(kr_name, kr_spec, kr_price, kr_discount, kr_dtoption, kr_dbenefit);
			
			 
			response.sendRedirect(request.getContentType()+"/Manager_rentcar_writeAction.jsp");
		
		}else if(str.equals("/Manager/Manager_Notice.do")) {
			
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
			
						
			CmNoticeDao cnd = new CmNoticeDao();
			int cnt= cnd.boardTotalCount(keyword);  //전체 리스트 갯수를 구한다
			System.out.println("cnt"+cnt);
			
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);  //페이지메이커에 서치크리테리아는 먼저 담는다
			pm.setTotalCount(cnt);			//전체갯수를 담은후에 페이지 네비게이션에 시작과 끝, 이전과 다음 페이지를 정한다
			
			
			System.out.println("pm"+pm);
			
			ArrayList<CmNoticeVo> alist  =  cnd.boardSelectAll(page2, keyword);
						
			request.setAttribute("alist", alist);	
			request.setAttribute("pm", pm);		
			
			
			
			RequestDispatcher rd =request.getRequestDispatcher("/Manager_Notice.jsp");
			rd.forward(request, response);

		}else if(str.equals("/Manager/Manager_NoticeWrite.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/Manager_NoticeWrite.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Manager/Manager_NoticeWriteAction.do")) {
			//값을 넘겨받는다
			String NTitle = request.getParameter("NTitle");
			String NContents = request.getParameter("NContents");
			
			
			System.out.println("NTitle->"+NTitle);
			System.out.println("NContents->"+NContents);
			
			
			
			CmNoticeDao rd = new CmNoticeDao();
			int value = rd.boardInsert(NTitle, NContents);
			System.out.println("value:"+value);
			
			if(value >0) {
				response.sendRedirect(request.getContextPath()+"/Manager/Manager_Notice.do");	
			}else{
				response.sendRedirect(request.getContextPath()+"/Manager/Manager_NoticeWrite.do");
			}
		}else if(str.equals("/Manager/Manager_NoticeContents.do")) {
			//값을 넘겨받는다
			String NIdx = request.getParameter("NIdx");
			int NIdx2 = Integer.parseInt(NIdx);
			
			CmNoticeDao cnd = new CmNoticeDao();
			CmNoticeVo cnv = cnd.boardSelectOne(NIdx2);
			
			cnd.boardViewCount(NIdx2);
			
			request.setAttribute("cnv", cnv);
			RequestDispatcher rd = request.getRequestDispatcher("/Manager_NoticeContents.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/Manager/Manager_NoticeModify.do")) {
			String NIdx = request.getParameter("NIdx");
			System.out.println("NIdx->"+NIdx);
			int NIdx2 = Integer.parseInt(NIdx);
			
			CmNoticeDao cnd = new CmNoticeDao();
			CmNoticeVo cnv = cnd.boardSelectOne(NIdx2);
			
			cnd.boardViewCount(NIdx2);
			
			
			request.setAttribute("cnv", cnv);
			RequestDispatcher rd = request.getRequestDispatcher("/Manager_NoticeModify.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Manager/Manager_NoticeModifyAction.do")) {
			//1.값을 넘겨받는다
			String NIdx =request.getParameter("NIdx");
			int NIdx2 = Integer.parseInt(NIdx);
			String NTitle = request.getParameter("NTitle");
			String NContents = request.getParameter("NContents");
			
			//2.처리한다
			CmNoticeDao cnd = new CmNoticeDao();//객체생성
			
			int value =cnd.boardModify(NIdx2, NTitle, NContents);
			System.out.println("value:"+value);
			
			if(value>0) {
			
				response.sendRedirect(request.getContextPath()+"/Manager/Manager_NoticeContents.do?NIdx="+NIdx);
			}else {
				response.sendRedirect(request.getContextPath()+"/Manager/Manager_NoticeModify.do?NIdx="+NIdx);
			}
			
		}else if(str.equals("/Manager/Manager_NoticeDelete.do")) {
			String NIdx = request.getParameter("NIdx");
			int NIdx2 = Integer.parseInt(NIdx);
			
			CmNoticeDao cnd = new CmNoticeDao();
			CmNoticeVo cnv = cnd.boardSelectOne(NIdx2);
		
	
			request.setAttribute("cnv", cnv);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/Manager_NoticeDelete.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/Manager/Manager_NoticeDeleteAction.do")) {
			
			String NIdx = request.getParameter("NIdx");
			int NIdx2 = Integer.parseInt(NIdx);

			CmNoticeDao cnd = new CmNoticeDao();
			int value = cnd.boardDelete(NIdx2);
			
			if (value > 0) {  
				response.sendRedirect(request.getContextPath()+"/Manager/Manager_Notice.do");	
			}else {
				response.sendRedirect(request.getContextPath()+"/Manager/Manager_NoticeDelete.do?NIdx="+NIdx);					
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
