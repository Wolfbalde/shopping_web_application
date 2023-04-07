<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>
h1{
text-align: center;
}
.pl{
text-align : center;
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Admin Logged in</title>
</head>
<body style="background-color:#A0DAA9;">

<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expires", "0");
		if(session.getAttribute("uname")==null){
			response.sendRedirect("index.jsp");
		}
		
		
		
	%>
	<h1>Welcome ${uname}</h1><br><br><br><br><br><br>
	<h4><a href="additem.jsp">Click here to add new items</a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<a href="restock.jsp">Click here to restock items</a><br><br><br><br><br><br><br><br><br>
	<form action="Logout"></h4> 
    <div class="pl"><input type="submit" value="Logout"></div>
    </form>
</body>
</html>