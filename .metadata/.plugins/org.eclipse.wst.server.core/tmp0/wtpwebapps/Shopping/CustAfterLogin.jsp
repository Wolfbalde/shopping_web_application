<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>
h1{
text-align:center;
}
.pl{
text-align: center;
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Customer Logged in</title>
</head>
<body style="background-color:#B89B72;">
<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires", "0");
		if(session.getAttribute("uname")==null){
			response.sendRedirect("index.jsp");
		}
	%>
	<h1>Welcome ${uname}</h1><br><br><br>
	<h3>Logged In Successfully....</h3><br><br><br><br><br><br>
	<a href="buyitem.jsp"> Click here to buy items</a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a href="Cart.jsp">Click here to view your cart</a><br><br><br>
	
	<form action="Logout"> 
    <input type="submit" value="Logout">
    </form>
    
</body>
</html>