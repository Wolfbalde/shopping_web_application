<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>
h1 {
	text-align: center;
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
</head>
<body style="background-color:#E0B589">
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires", "0");
		if(session.getAttribute("uname")==null){
			response.sendRedirect("index.jsp");
		}
%>
	<%
int total=0;
PrintWriter pw = response.getWriter();
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Akaash", "maximo");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from Cart");
pw.print("<table border = '1' width = '100%'>");
pw.print("<tr>");
pw.print("<th>Item Name</th>");
pw.print("<th>Quantity</th>");
pw.print("<th>Price</th>");
pw.print("<th>Total</th>");
while(rs.next()) {
	String item=rs.getString("Name");
	int qty=rs.getInt("Quantity");
	int price=rs.getInt("Price");
	int a=price*qty;
	total=a+total;
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
	pw.print("<td>");
	pw.print(a);
	pw.print("</td>");
}
pw.print("<h1>The total amount is: Rs. ");
pw.print(total);
pw.print("</h1>");
%>
	<br><br><br>
    <h2>Enter below to delete items</h2>
    <form action="DeleteCartItem">
    Enter the item: <input type="text" name="delname">
    Enter the Quantity: <input type="number" name="delq">&emsp;&emsp;&emsp;
    <input type="submit" value="Reduce">
    </form>
    <br><br><br>
	<form action="Logout">
		<input type="submit" value="Logout">
	</form>
	<form action="PayBill">
	<input type="submit" value="Pay Bill">
	</form><br><br>
	<a href="buyitem.jsp">Click here to buy more items</a><br><br>
</body>
</html>