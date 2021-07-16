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
import service.CmFactoryCerticationDao;
import service.CmFactoryCerticationVo;
import service.CmQnADao;
import service.CmQnAVo;

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
			System.out.println("page2->"+page2);
			
			
			String keyword = request.getParameter("keyword");	//키워드 검색을 위해		
			if(keyword == null) keyword = "";
				

			
			SearchCriteria scri = new SearchCriteria();   //서치크리테리아에 키워드와 페이지를 담아논다
			scri.setKeyword(keyword);
			scri.setPage(page2);
			System.out.println("scri->"+scri);
			
						
			CmBoardDao bd = new CmBoardDao();
			int cnt= bd.boardTotalCount(keyword);  //전체 리스트 갯수를 구한다
			System.out.println("cnt->"+cnt);
			
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);  //페이지메이커에 서치크리테리아는 먼저 담는다
			pm.setTotalCount(cnt);			//전체갯수를 담은후에 페이지 네비게이션에 시작과 끝, 이전과 다음 페이지를 정한다
			
			
			System.out.println("pm->"+pm);
			
			ArrayList<CmBoardVo> alist  =  bd.boardSelectAll(page2, keyword);
						
			request.setAttribute("alist", alist);	
			request.setAttribute("pm", pm);		
			
			RequestDispatcher rd =request.getRequestDispatcher("/CmBoard.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/Board/CmBoardDelete.do")) {
			String bNum = request.getParameter("bNum");
			int bNum2 = Integer.parseInt(bNum);
			
			CmBoardDao cbd = new CmBoardDao();
			CmBoardVo cbv = cbd.boardSelectOne(bNum2);
		
	
			request.setAttribute("cbv", cbv);
			RequestDispatcher rd = request.getRequestDispatcher("/CmBoardDelete.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Board/CmBoardWrite.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/CmBoardWrite.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Board/CmBoardWriteAction.do")) {
			//값을 넘겨받는다
			String bTitle = request.getParameter("bTitle");
			String bContents = request.getParameter("bContents");
			
			
			
			System.out.println("btitle->"+bTitle);
			System.out.println("bcontents->"+bContents);
			
			
			
			CmBoardDao rd = new CmBoardDao();
			int value = rd.boardInsert(bTitle, bContents );
			System.out.println("value:"+value);
			
			if(value >0) {
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard.do");	
			}else{
				response.sendRedirect(request.getContextPath()+"/Board/CmBoardWrite.do");
			}
		}else if(str.equals("/Board/CmBoardContents.do")) {
			//값을 넘겨받는다
			String bNum = request.getParameter("bNum");
			int bNum2 = Integer.parseInt(bNum);
			
			CmBoardDao cbd = new CmBoardDao();
			CmBoardVo cbv = cbd.boardSelectOne(bNum2);
			
			cbd.boardViewCount(bNum2);
			
			request.setAttribute("cbv", cbv);
			RequestDispatcher rd = request.getRequestDispatcher("/CmBoardContents.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/Board/CmBoardModify.do")) {
			String bNum = request.getParameter("bNum");
			System.out.println("bNum->"+bNum);
			int bNum2 = Integer.parseInt(bNum);
			
			CmBoardDao cbd = new CmBoardDao();
			CmBoardVo cbv = cbd.boardSelectOne(bNum2);
			
			cbd.boardViewCount(bNum2);
			
			
			request.setAttribute("cbv", cbv);
			RequestDispatcher rd = request.getRequestDispatcher("/CmBoardModify.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Board/CmBoardModifyAction.do")) {
			//1.값을 넘겨받는다
			String bNum =request.getParameter("bNum");
			int bNum2 = Integer.parseInt(bNum);
			String bTitle = request.getParameter("bTitle");
			String bContents = request.getParameter("bContents");
			
			//2.처리한다
			CmBoardDao cbd = new CmBoardDao();//객체생성
			
			int value =cbd.boardModify(bNum2, bTitle, bContents);
			System.out.println("value:"+value);
			
			if(value>0) {
			
				response.sendRedirect(request.getContextPath()+"/Board/CmBoardContents.do?bNum="+bNum);
			}else {
				response.sendRedirect(request.getContextPath()+"/Board/CmBoardModify.do?bNum="+bNum);
			}
			
		}else if(str.equals("/Board/CmBoardDeleteAction.do")) {
			
			String bNum = request.getParameter("bNum");
			int bNum2 = Integer.parseInt(bNum);

			CmBoardDao cbd = new CmBoardDao();
			int value = cbd.boardDelete(bNum2);
			
			if (value > 0) {  
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard.do");	
			}else {
				response.sendRedirect(request.getContextPath()+"/Board/CmBoardDelete.do?bNum="+bNum);					
			}
		}else if(str.equals("/Board/CmBoard2.do")) {
				
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
				
							
				CmFactoryCerticationDao cfd = new CmFactoryCerticationDao();
				int cnt= cfd.boardTotalCount(keyword);  //전체 리스트 갯수를 구한다
				System.out.println("cnt"+cnt);
				
				
				PageMaker pm = new PageMaker();
				pm.setScri(scri);  //페이지메이커에 서치크리테리아는 먼저 담는다
				pm.setTotalCount(cnt);			//전체갯수를 담은후에 페이지 네비게이션에 시작과 끝, 이전과 다음 페이지를 정한다
				
				
				System.out.println("pm"+pm);
				
				ArrayList<CmFactoryCerticationVo> alist  =  cfd.boardSelectAll(page2, keyword);
							
				request.setAttribute("alist", alist);	
				request.setAttribute("pm", pm);		
				
				
				RequestDispatcher rd =request.getRequestDispatcher("/CmBoard2.jsp");
				rd.forward(request, response);

		}else if(str.equals("/Board/CmBoard2Contents.do")) {
			//값을 넘겨받는다
			String FcIdx = request.getParameter("FcIdx");
			int FcIdx2 = Integer.parseInt(FcIdx);
			
			CmFactoryCerticationDao cfd = new CmFactoryCerticationDao();
			CmFactoryCerticationVo cfv = cfd.boardSelectOne(FcIdx2);
			
			cfd.boardViewCount(FcIdx2);
			
			request.setAttribute("cfv", cfv);
			RequestDispatcher rd = request.getRequestDispatcher("/CmBoard2Contents.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/Board/CmBoard2Write.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/CmBoard2Write.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Board/CmBoard2WriteAction.do")) {
			//값을 넘겨받는다
			String FcTitle = request.getParameter("FcTitle");
			String FcContents = request.getParameter("FcContents");
			
			
			System.out.println("FcTitle->"+FcTitle);
			System.out.println("FcContents->"+FcContents);
			
			
			
			CmFactoryCerticationDao cfd = new CmFactoryCerticationDao();
			int value = cfd.boardInsert(FcTitle, FcContents);
			System.out.println("value:"+value);
			
			if(value >0) {
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard2.do");	
			}else{
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard2Write.do");
			}
		}else if(str.equals("/Board/CmBoard2Delete.do")) {
			String FcIdx = request.getParameter("FcIdx");
			int FcIdx2 = Integer.parseInt(FcIdx);
			
			CmFactoryCerticationDao cfd = new CmFactoryCerticationDao();
			CmFactoryCerticationVo cfv = cfd.boardSelectOne(FcIdx2);
		
	
			request.setAttribute("cfv", cfv);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/CmBoard2Delete.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/Board/CmBoard2DeleteAction.do")) {
			
			String FcIdx = request.getParameter("FcIdx");
			int FcIdx2 = Integer.parseInt(FcIdx);

			CmFactoryCerticationDao cfd = new CmFactoryCerticationDao();
			int value = cfd.boardDelete(FcIdx2);
			
			if (value > 0) {  
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard2.do");	
			}else {
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard2Delete.do?FcIdx="+FcIdx);					
			}
		}else if(str.equals("/Board/CmBoard2Modify.do")) {
			String FcIdx = request.getParameter("FcIdx");
			System.out.println("FcIdx->"+FcIdx);
			int FcIdx2 = Integer.parseInt(FcIdx);
			
			CmFactoryCerticationDao cfd = new CmFactoryCerticationDao();
			CmFactoryCerticationVo cfv = cfd.boardSelectOne(FcIdx2);
			
			cfd.boardViewCount(FcIdx2);
			
			
			request.setAttribute("cfv", cfv);
			RequestDispatcher rd = request.getRequestDispatcher("/CmBoard2Modify.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Board/CmBoard2ModifyAction.do")) {
			//1.값을 넘겨받는다
			String FcIdx =request.getParameter("FcIdx");
			int FcIdx2 = Integer.parseInt(FcIdx);
			String FcTitle = request.getParameter("FcTitle");
			String FcContents = request.getParameter("FcContents");
			
			//2.처리한다
			CmFactoryCerticationDao cfd = new CmFactoryCerticationDao();//객체생성
			
			int value =cfd.boardModify(FcIdx2, FcTitle, FcContents);
			System.out.println("value:"+value);
			
			if(value>0) {
			
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard2Contents.do?FcIdx="+FcIdx);
			}else {
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard2Modify.do?FcIdx="+FcIdx);
			}
			
		}else if(str.equals("/Board/CmBoard3.do")) {
		
				
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
				
							
				CmCarGalleryDao cgd = new CmCarGalleryDao();
				int cnt= cgd.boardTotalCount(keyword);  //전체 리스트 갯수를 구한다
				System.out.println("cnt"+cnt);
				
				
				PageMaker pm = new PageMaker();
				pm.setScri(scri);  //페이지메이커에 서치크리테리아는 먼저 담는다
				pm.setTotalCount(cnt);			//전체갯수를 담은후에 페이지 네비게이션에 시작과 끝, 이전과 다음 페이지를 정한다
				
				
				System.out.println("pm"+pm);
				
				ArrayList<CmCarGalleryVo> alist  =  cgd.boardSelectAll(page2, keyword);
							
				request.setAttribute("alist", alist);	
				request.setAttribute("pm", pm);		
				
				
				RequestDispatcher rd =request.getRequestDispatcher("/CmBoard3.jsp");
				rd.forward(request, response);
			
		}else if(str.equals("/Board/CmBoard3Contents.do")) {
			//값을 넘겨받는다
			String CgIdx = request.getParameter("CgIdx");
			int CgIdx2 = Integer.parseInt(CgIdx);
			
			CmCarGalleryDao cgd = new CmCarGalleryDao();
			CmCarGalleryVo cgv = cgd.boardSelectOne(CgIdx2);
			
			cgd.boardViewCount(CgIdx2);
			
			request.setAttribute("cgv", cgv);
			RequestDispatcher rd = request.getRequestDispatcher("/CmBoard3Contents.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/Board/CmBoard3Write.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/CmBoard3Write.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Board/CmBoard3WriteAction.do")) {
			//값을 넘겨받는다
			String CgTitle = request.getParameter("CgTitle");
			String CgContents = request.getParameter("CgContents");
			
			
			System.out.println("CgTitle->"+CgTitle);
			System.out.println("CgContents->"+CgContents);
			
			
			
			CmCarGalleryDao cgd = new CmCarGalleryDao();
			int value = cgd.boardInsert(CgTitle, CgContents);
			System.out.println("value:"+value);
			
			if(value >0) {
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard3.do");	
			}else{
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard3Write.do");
			}
		}else if(str.equals("/Board/CmBoard3Delete.do")) {
			String CgIdx = request.getParameter("CgIdx");
			int CgIdx2 = Integer.parseInt(CgIdx);
			
			CmCarGalleryDao cgd = new CmCarGalleryDao();
			CmCarGalleryVo cgv = cgd.boardSelectOne(CgIdx2);
		
	
			request.setAttribute("cgv", cgv);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/CmBoard3Delete.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/Board/CmBoard3DeleteAction.do")) {
			
			String CgIdx = request.getParameter("CgIdx");
			int CgIdx2 = Integer.parseInt(CgIdx);

			CmCarGalleryDao cgd = new CmCarGalleryDao();
			int value = cgd.boardDelete(CgIdx2);
			
			if (value > 0) {  
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard3.do");	
			}else {
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard3Delete.do?CgIdx="+CgIdx);					
			}
		}else if(str.equals("/Board/CmBoard3Modify.do")) {
			String CgIdx = request.getParameter("CgIdx");
			System.out.println("CgIdx->"+CgIdx);
			int CgIdx2 = Integer.parseInt(CgIdx);
			
			CmCarGalleryDao cgd = new CmCarGalleryDao();
			CmCarGalleryVo cgv = cgd.boardSelectOne(CgIdx2);
			
			cgd.boardViewCount(CgIdx2);
			
			
			request.setAttribute("cgv", cgv);
			RequestDispatcher rd = request.getRequestDispatcher("/CmBoard3Modify.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Board/CmBoard3ModifyAction.do")) {
			//1.값을 넘겨받는다
			String CgIdx =request.getParameter("CgIdx");
			int CgIdx2 = Integer.parseInt(CgIdx);
			String CgTitle = request.getParameter("CgTitle");
			String CgContents = request.getParameter("CgContents");
			
			//2.처리한다
			CmCarGalleryDao cgd = new CmCarGalleryDao();//객체생성
			
			int value =cgd.boardModify(CgIdx2, CgTitle, CgContents);
			System.out.println("value:"+value);
			
			if(value>0) {
			
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard3Contents.do?CgIdx="+CgIdx);
			}else {
				response.sendRedirect(request.getContextPath()+"/Board/CmBoard3Modify.do?CgIdx="+CgIdx);
			}
		}else if(str.equals("/Board/QnA.do")) {
			
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
			
						
			CmQnADao cqd = new CmQnADao();
			int cnt= cqd.boardTotalCount(keyword);  //전체 리스트 갯수를 구한다
			System.out.println("cnt"+cnt);
			
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);  //페이지메이커에 서치크리테리아는 먼저 담는다
			pm.setTotalCount(cnt);			//전체갯수를 담은후에 페이지 네비게이션에 시작과 끝, 이전과 다음 페이지를 정한다
			
			
			System.out.println("pm"+pm);
			
			ArrayList<CmQnAVo> alist  =  cqd.boardSelectAll(page2, keyword);
						
			request.setAttribute("alist", alist);	
			request.setAttribute("pm", pm);		
			
			
			RequestDispatcher rd =request.getRequestDispatcher("/QnA.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Board/QnAContents.do")) {
			//값을 넘겨받는다
			String QIdx = request.getParameter("QIdx");
			int QIdx2 = Integer.parseInt(QIdx);
			
			CmQnADao cqd = new CmQnADao();
			CmQnAVo cqv = cqd.boardSelectOne(QIdx2);
			
			cqd.boardViewCount(QIdx2);
			
			request.setAttribute("cqv", cqv);
			RequestDispatcher rd = request.getRequestDispatcher("/QnAContents.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/Board/QnAWrite.do")) {
			RequestDispatcher rd =request.getRequestDispatcher("/QnAWrite.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Board/QnAWriteAction.do")) {
			//값을 넘겨받는다
			String QTitle = request.getParameter("QTitle");
			String QContents = request.getParameter("QContents");
			
			
			System.out.println("QTitle->"+QTitle);
			System.out.println("QContents->"+QContents);
			
			
			
			CmQnADao cqd = new CmQnADao();
			int value = cqd.boardInsert(QTitle, QContents);
			System.out.println("value:"+value);
			
			if(value >0) {
				response.sendRedirect(request.getContextPath()+"/Board/QnA.do");	
			}else{
				response.sendRedirect(request.getContextPath()+"/Board/QnAWrite.do");
			}
		}else if(str.equals("/Board/QnADelete.do")) {
			String QIdx = request.getParameter("QIdx");
			int QIdx2 = Integer.parseInt(QIdx);
			
			CmQnADao cqd = new CmQnADao();
			CmQnAVo cqv = cqd.boardSelectOne(QIdx2);
		
	
			request.setAttribute("cqv", cqv);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/QnADelete.jsp");
			rd.forward(request, response);
			
		}else if(str.equals("/Board/QnADeleteAction.do")) {
			
			String QIdx = request.getParameter("QIdx");
			int QIdx2 = Integer.parseInt(QIdx);

			CmQnADao cqd = new CmQnADao();
			int value = cqd.boardDelete(QIdx2);
			
			if (value > 0) {  
				response.sendRedirect(request.getContextPath()+"/Board/QnA.do");	
			}else {
				response.sendRedirect(request.getContextPath()+"/Board/QnADelete.do?QIdx="+QIdx);					
			}
		}else if(str.equals("/Board/Faq.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/Faq.jsp");
			rd.forward(request, response);
			
		}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
