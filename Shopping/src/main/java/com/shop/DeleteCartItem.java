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

@WebServlet("/DeleteCartItem")
public class DeleteCartItem extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			response.setContentType("text/html");
			String name=request.getParameter("delname");
			String qt=request.getParameter("delq");
			int qty=Integer.parseInt(qt);
			Class.forName("oracle.jdbc.driver.OracleDriver");
			PrintWriter pw = response.getWriter();
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Akaash", "maximo");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from Cart");
			while(rs.next()) {
				String aname=rs.getString("Name");
				if(name.equals(aname)) {
					int a=rs.getInt("Quantity");
					if((a-qty)<=0) {
						PreparedStatement ps = con.prepareStatement("delete from Cart where Name=?");
						ps.setString(1,name);
						ps.executeUpdate();
					}
					if((a-qty)>0) {
						PreparedStatement ps = con.prepareStatement("update Cart set Quantity=? where Name=?");
						ps.setInt(1, a-qty);
						ps.setString(2,name);
						ps.executeUpdate();
					}
				}
			}
			pw.print("<a href='Cart.jsp'>Click here to view Cart</a>");
		}
		catch(Exception e) {
			e.printStackTrace();
		}

	}


}
