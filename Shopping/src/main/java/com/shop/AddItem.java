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
@WebServlet("/AddItem")
public class AddItem extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			String item=request.getParameter("item");
			String qt=request.getParameter("qty");
			int qty=Integer.parseInt(qt);
			String pric=request.getParameter("price");
			int price=Integer.parseInt(pric);
			response.setContentType("text/html");
			boolean exist=false;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			PrintWriter pw = response.getWriter();
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Akaash", "maximo");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from Item");
			while(rs.next()) {
				String aitem=rs.getString("Name");
				if(item.equals(aitem)) {
					exist=true;
					pw.print("Item already Exists");
					pw.print("<br><br><br><br>");
					pw.println("Click here to ");
					pw.print("<a href='restock.jsp'>Restock<a>");
				}				
			}
			if(exist==false) {
				PreparedStatement ps = con.prepareStatement("insert into Item values(?,?,?)");
				ps.setString(1, item);
				ps.setInt(2, qty);
				ps.setInt(3, price);
				ps.executeUpdate();
				pw.print("<a href='admin.jsp'>Login</a>");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
