<%@ page language="java" import="eVote.DAO, java.sql.ResultSet" import="javax.servlet.http.HttpSession" session="false" contentType="text/html; charset=ISO-8859-1"
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
String name=(String)session.getAttribute("UN");
String choice= request.getParameter("choice");
ResultSet rs= ob.cand(choice);%>
<table>
    	 <tr>
    	 <th>Candidate Name</th>
    	 <th>Constituency</th>
    	 </tr>
<%
while(rs.next()){
%>
 <tr>
    	 <td><%= rs.getString("NAME") %></td>
    	 <td><%= rs.getString("const") %></td>
    	 </tr>
    	 <%} %>
    	 </table>
    	
</body>
</html>