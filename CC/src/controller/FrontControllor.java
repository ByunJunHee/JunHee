package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FrontControllor")
public class FrontControllor extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String uri = request.getRequestURI();
		int p_length = request.getContextPath().length();
		String str = uri.substring(p_length);
		System.out.println("str->"+str);
		
		String[] gubun = str.split("/");
		String str2 = gubun[1];
		System.out.println("str2:"+str2);
		
		if(str2.equals("Mypage")) {
			MypageController mpc = new MypageController();
			mpc.doGet(request,response);
		}else if(str2.equals("Manager")){
			ManagerController mc = new ManagerController();
			mc.doGet(request,response);
			
		}else {
			RentController rc = new RentController();
			rc.doGet(request,response);
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
