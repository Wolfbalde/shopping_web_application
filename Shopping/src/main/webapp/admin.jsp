<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>
h1 {
  text-align: center;
}
.al{
text-align: center;
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<body style="background-color:yellow;">
<div class="al">
<form action="AdminLogin" method="post">
<h1>Enter your Credentials!!!</h1><br><br><br><br><br>
Name:     &emsp;&nbsp;<input type="text" name="login" required="required"><br><br><br><br><br>
Password: <input type="password" name="pass" required="required"><br><br><br><br><br>
<input type="submit" value="Login">
</form>
</div>
</body>
</html>