package com.shop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet{
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			response.setContentType("text/html");
			String name=request.getParameter("login");
			String pass=request.getParameter("pass");
			if(name.equals("Admin") && pass.equals("gamer")) {
				HttpSession session = request.getSession();
				session.setAttribute("uname", "Admin");
				response.sendRedirect("AdminAfterLogin.jsp");
			}
			else {
				response.sendRedirect("Invalid.jsp");
			}
			}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
