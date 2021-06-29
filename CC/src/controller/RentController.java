package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardDao;
import service.RentDao;


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
		}else if(str.equals("/Rent_Estimate.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/Rent_Estimate.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Rent_EstimateAction.do")) {
			String r_name = request.getParameter("r_name");
			String r_phone = request.getParameter("r_phone");
			String r_addr = request.getParameter("r_addr");
			String r_interest = request.getParameter("r_interest");
			String r_division = request.getParameter("r_division");
			
			System.out.println("r_name->"+r_name);
			System.out.println("r_phone->"+r_phone);
			System.out.println("r_addr->"+r_addr);
			System.out.println("r_interest->"+r_interest);
			System.out.println("r_division->"+r_division);
			
			int r_num = 0;
			
			RentDao rd = new RentDao();
			int value = rd.RentInsert(r_name, r_phone, r_addr, r_interest, r_division);
			System.out.println("value:"+value);
			
			
			if(value >0) {
				response.sendRedirect(request.getContextPath()+"/Mypage/Mypage_detail1.do?r_num="+r_num);	
			}else{
				response.sendRedirect(request.getContextPath()+"/Rent_Estimate.do?r_num="+r_num);
			}
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
