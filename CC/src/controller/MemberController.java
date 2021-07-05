package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberDAO;
import service.MemberVO;



@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		String uri = request.getRequestURI();	
		
		System.out.println("uri1 =>:"+uri);
		
		
		int pnamelength = request.getContextPath().length();
		String str = uri.substring(pnamelength);
		
		System.out.println("url¡÷º“:"+str);
		
	if(str.equals("/memberJoinAction.do")){
			
			String m_id = request.getParameter("m_id");
			String m_pass = request.getParameter("m_pass");
			String m_name = request.getParameter("m_name");
			String m_gender = request.getParameter("m_gender");
			String m_phone1 = request.getParameter("m_phone1");
			String m_phone2 = request.getParameter("m_phone2");
			String m_email = request.getParameter("m_email");
			String m_addr1 = request.getParameter("m_addr1");
			String m_addr2 = request.getParameter("m_addr2");
			String m_addr3 = request.getParameter("m_addr3");
			
			System.out.println("m_id = "+m_id);
			System.out.println("m_pass = "+m_pass);
			System.out.println("m_name = "+m_name);
			System.out.println("m_gender = "+m_gender);
			System.out.println("m_phone1 = "+m_phone1);
			System.out.println("m_phone2 = "+m_phone2);
			System.out.println("m_email = "+m_email);
			System.out.println("m_addr1 = "+m_addr1);
			System.out.println("m_addr2 = "+m_addr2);
			System.out.println("m_addr3 = "+m_addr3);
			
			
			String ip = InetAddress.getLocalHost().getHostAddress();
			
			MemberDAO md = new MemberDAO();
			md.memberInsert(m_id, m_pass, m_name, m_gender, m_phone1, m_phone2, m_email, m_addr1, m_addr2, m_addr3);
			
			response.sendRedirect(request.getContextPath()+"/memberJoinAction.jsp");
		
		}else if(str.equals("/memberJoin.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/memberJoin.jsp");
			rd.forward(request, response);	
		}else if(str.equals("/memberLogin.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/memberLogin.jsp");
			rd.forward(request, response);
		
		}else if(str.equals("/main.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main.jsp");
			rd.forward(request, response);
		
		}else if(str.equals("/introduce.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/introduce.jsp");
			rd.forward(request, response);
		
		}else if(str.equals("/findId.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/findId.jsp");
			rd.forward(request, response);
		
		}else if(str.equals("/findPw.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/findPw.jsp");
			rd.forward(request, response);
		
		}else if(str.equals("/memberLoginOk.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/memberLoginOk.jsp");
			rd.forward(request, response);
		
		}else if(str.equals("/memberLogout.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/memberLogout.jsp");
			rd.forward(request, response);
		
		}else if(str.equals("/findIdOk.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/findIdOk.jsp");
			rd.forward(request, response);
		
		}else if(str.equals("/findPwOk.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/findPwOk.jsp");
			rd.forward(request, response);
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
}