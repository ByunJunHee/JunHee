package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
