package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/MypageController")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8"); 
	response.getWriter().append("Served at: ").append(request.getContextPath());
	
	String uri = request.getRequestURI();
	int pnamelength = request.getContextPath().length();
	String str = uri.substring(pnamelength);
	System.out.println("url주소:"+str);

	if(str.equals("/Mypage/Mypage_main.do")) {		
		RequestDispatcher rd = request.getRequestDispatcher("/Mypage_main.jsp");
		rd.forward(request, response);
	}else if(str.equals("/Mypage/Mypage_detail1.do")) {
		System.out.println("test");
		RequestDispatcher rd = request.getRequestDispatcher("/Mypage_detail1.jsp");
		rd.forward(request, response);
		
	}else if(str.equals("/Mypage/Mypage_detail2.do")) {
		RequestDispatcher rd = request.getRequestDispatcher("/Mypage_detail2.jsp");
		rd.forward(request, response);
	}else if(str.equals("/Mypage/Mypage_detail3.do")) {
		RequestDispatcher rd = request.getRequestDispatcher("/Mypage_detail3.jsp");
		rd.forward(request, response);
	}else if(str.equals("/Mypage/Mypage_detail4.do")) {
		RequestDispatcher rd = request.getRequestDispatcher("/Mypage_detail4.jsp");
		rd.forward(request, response);
	}else if(str.equals("/Mypage/Mypage_detail5.do")) {
		RequestDispatcher rd = request.getRequestDispatcher("/Mypage_detail5.jsp");
		rd.forward(request, response);
	}
}

	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
