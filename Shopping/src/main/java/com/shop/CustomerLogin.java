package com.shop;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Crypt a=new Crypt();
			String user = request.getParameter("custlogin");
			String pas = request.getParameter("custpass");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Akaash", "maximo");
			Statement st = con.createStatement();
			PrintWriter pw = response.getWriter();
			ResultSet rs = st.executeQuery("select * from Cust");
			while (rs.next()) {
				String name = rs.getString("Email");
				String pass = rs.getString("password");
				String org=a.decrypt(pass);
				String nam = rs.getString("name");
				if (name.equals(user)) {
					if (org.equals(pas)) {
						HttpSession session = request.getSession();
						session.setAttribute("uname", nam);
						response.sendRedirect("CustAfterLogin.jsp");
					} else {
						response.sendRedirect("Invalid.jsp");
					}
				} else {
					response.sendRedirect("Invalid.jsp");
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	

}
