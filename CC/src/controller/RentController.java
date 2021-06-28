package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RentController")
public class RentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8"); 
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String uri = request.getRequestURI();
		int pnamelength = request.getContextPath().length();
		String str = uri.substring(pnamelength);
		System.out.println("url주소:"+str);

		if(str.equals("/Rentpage_main.do")) {		
			RequestDispatcher rd = request.getRequestDispatcher("/Rentpage_main.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Rent_Esimate.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/Rent_Estimate.jsp");
			rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
