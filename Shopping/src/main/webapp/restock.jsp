<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>
h1{
text-align:center;
}
.pl{
text-align :center;
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Restock</title>
</head>
<body style="background-color:#E0B589">
<form action="Restock" >
<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires", "0");
		if(session.getAttribute("uname")==null){
			response.sendRedirect("index.jsp");
		}
		
	%>
<%
PrintWriter pw = response.getWriter();
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Akaash", "maximo");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from Item");
pw.print("<table border = '1' width = '100%'>");
pw.print("<tr>");
pw.print("<th>Item Name</th>");
pw.print("<th>Quantity</th>");
pw.print("<th>Price</th>");
while(rs.next()) {
	String item=rs.getString("Name");
	String qty=rs.getString("Quantity");
	String price=rs.getString("Price");
	pw.print("</tr>");
	pw.print("<tr>");
	pw.print("<td>");
	pw.print(item);
	pw.print("</td>");
	pw.print("<td>");
	pw.print(qty);
	pw.print("</td>");
	pw.print("<td>");
	pw.print(price);
	pw.print("</td>");
	
}

%>
	<h1>Enter the Details below to Restock!!!</h1><br><br><br><br>
	<div class="pl">
	Enter the Item Name <input type="text" name="item"><br><br><br><br>
	Enter the Quantity&nbsp;&nbsp; <input type="number" name="restqty"><br><br><br><br>
	<input type="submit" value="Restock"><br><br><br><br>
	</form>
	<form action="Logout"> 
    <input type="submit" value="Logout"><br><br><br><br><br><br><br><br>
    </form>
    </div>
    <a href="additem.jsp">Click here to add new items</a><br><br><br><br><br><br><br><br>
</body>
</html>