package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CmBoardDao;
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

		if(str.equals("/Rent/Rentpage_main.do")) {		
			RequestDispatcher rd = request.getRequestDispatcher("/Rentpage_main.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Rent/Rent_Estimate.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/Rent_Estimate.jsp");
			rd.forward(request, response);
		}else if(str.equals("/Rent/Rent_EstimateAction.do")) {
			String r_name = request.getParameter("r_name");
			String r_phone = request.getParameter("r_phone");
			String r_addr = request.getParameter("r_addr");
			String r_interest = request.getParameter("r_interest");
			String r_division = request.getParameter("r_division");
			String inpt_Id = request.getParameter("inpt_id");
			
			System.out.println("r_name->"+r_name);
			System.out.println("r_phone->"+r_phone);
			System.out.println("r_addr->"+r_addr);
			System.out.println("r_interest->"+r_interest);
			System.out.println("r_division->"+r_division);
			System.out.println("inpt_Id->"+inpt_Id);
			
			int r_num = 0;
			
			RentDao rd = new RentDao();
			int value = rd.RentInsert(r_name, r_phone, r_addr, r_interest, r_division, inpt_Id);
			System.out.println("value:"+value);
			
			
			if(value >0) {
				response.sendRedirect(request.getContextPath()+"/Mypage/Mypage_detail1.do");	
			}else{
				response.sendRedirect(request.getContextPath()+"/Rent/Rent_Estimate.do");
			}
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
