<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>
h1{
text-align: center;
}
.pl{
text-align: center;
}
.pl2{
text-align: center;
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Add Item</title>
</head>
<body style="background-color:#E9897E">
<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires", "0");
		if(session.getAttribute("uname")==null){
			response.sendRedirect("index.jsp");
		}
		
%>
<h1> Enter the new item to add!!!</h1><br><br><br><br>
<div class="pl">
<form action="AddItem" >
Enter the new item &emsp;&emsp;&nbsp;&nbsp;<input type="text" name="item"><br><br><br><br>
Enter the item quantity &emsp;&nbsp;<input type="text" name="qty"><br><br><br><br>
Enter the price of the item <input type="double" name="price"><br><br><br><br><br>
<input type="submit" value="Add Item"><br><br><br><br>
</form>
</div>
<div class="pl2">
<form action="Logout"> 
    <input type="submit" value="Logout">
    </form>
    </div>
    <a href="restock.jsp">Click here to restock items</a><br><br><br><br><br><br><br><br><br>
</body>
</html>