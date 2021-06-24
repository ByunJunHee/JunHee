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
	//response.getWriter().append("Served at: ").append(request.getContextPath());
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=urf-8"); 
	
	String uri = request.getRequestURI();
	int pnamelength = request.getContextPath().length();
	String str = uri.substring(pnamelength);
	System.out.println("url주소:"+str);
	
	
	if(str.equals("/Mypage/Mypage_main.do")) {		
		RequestDispatcher rd = request.getRequestDispatcher("/Mypage_main.jsp");
		rd.forward(request, response);
	}else if(str.equals("/Mypage/Mypage_detail1.do")) {
		RequestDispatcher rd = request.getRequestDispatcher("/Mypage_detail1.jsp");
		rd.forward(request, response);
	}
	
	}

	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
