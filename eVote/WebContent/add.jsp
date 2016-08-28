<%@ page import="eVote.DAO, java.sql.ResultSet" import="javax.servlet.http.HttpSession" session="false" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
HttpSession session = request.getSession(false);
DAO ob = new DAO();
String choice=request.getParameter("name");
boolean approve = ob.addparty(choice);
out.print("true");
%>
<jsp:forward page="eo.jsp"></jsp:forward>
</body>
</html>