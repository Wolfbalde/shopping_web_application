package com.shop;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Restock")
public class Restock extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			response.setContentType("text/html");
			String name=request.getParameter("item");
			String qt=request.getParameter("restqty");
			int qty=Integer.parseInt(qt);
			boolean exist=false;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			PrintWriter pw = response.getWriter();
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Akaash", "maximo");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from Item");
			while(rs.next()) {
				String aitem=rs.getString("Name");
				if(name.equals(aitem)) {
					exist=true;
					int aqty=rs.getInt("Quantity");
					qty=qty+aqty;
					PreparedStatement ps = con.prepareStatement("update Item set Quantity=? where Name=?");
					ps.setInt(1, qty);
					ps.setString(2,name);
					ps.executeUpdate();
				}
			}
			if(exist==false) {
				pw.println("Item doesn't exist");
			}
			pw.println("<a href='index.jsp'>Home Page</a>");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}


}
