<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>
h1{
text-align:center
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body style="background-color:#56C6A9">
     <form action=Register>
<h1>Registration Form</h1>

Enter your Name     <input type="text" name="x" required="required"><br><br>
Enter your Gender   <input type="text" name="y" required="required"><br><br>
Enter your DOB      <input type="date" name="z" required="required"><br><br>
Enter your E-mail ID<input type="email" name="mail" required="required"><br><br>
Enter your Address  <input type="text" name ="address" required="required"><br><br>
Enter your password <input type="password" name="pass" required="required"><br><br>
<input type="submit" value="Register">
</form>

</body>
</html>