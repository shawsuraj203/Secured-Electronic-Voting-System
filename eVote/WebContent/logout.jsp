<%@ page language="java" import="javax.servlet.http.HttpSession" session="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String logout  = request.getParameter("logout");
HttpSession session = null;
session = request.getSession(true);
if(logout != null && logout.equals("true"))
{
	session.invalidate();%>
	<script>var x = confirm("You are successfully logout!!");
	console.log(x);
	if(x){
		alert("Thanks For Using our site!!");
	}</script>
	<jsp:forward page="log.jsp"></jsp:forward>
	
<%}
%>
</body>
</html>