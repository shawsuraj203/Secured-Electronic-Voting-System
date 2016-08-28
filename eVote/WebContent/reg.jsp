<%@ page import="java.sql.*" import="eVote.DAO" import= "java.sql.ResultSet" import="javax.servlet.http.HttpSession" session="false" language="java" contentType="text/html; charset=ISO-8859-1"
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
double choice = Double.parseDouble(request.getParameter("choice"));
DAO ob = new DAO();
if(choice==1){
	String nm=request.getParameter("name");
	String email =request.getParameter("email");
	String user1 =request.getParameter("user");
	String pass =request.getParameter("pass");
	String gn=request.getParameter("gender");
	String mn=request.getParameter("phone");
	String dob = request.getParameter("dob");
	String add = request.getParameter("address");
	String cons = request.getParameter("cons");
	boolean z= ob.signup(nm, email, user1, pass, mn, gn, dob, add, cons);%>
	<jsp:forward page="log.jsp"></jsp:forward><%
}
else if(choice==2){
	String nm=request.getParameter("name1");
	String email =request.getParameter("email1");
	String party =request.getParameter("party");
	String gn=request.getParameter("gender1");
	String mn=request.getParameter("phone1");
	String dob = request.getParameter("dob1");
	String Const = request.getParameter("Constituncy");
	String state = request.getParameter("state");
	String dist = request.getParameter("District");
	boolean z = ob.signup1(nm, email, party, mn, gn, dob, Const, state, dist);%>
	<h1>You are successfuly registerd in our site.<br>Wait for EO permission<br>Your User Id is</h1> 
	<%if(z){String y=ob.candid(email);
	out.print(y);}
	%> <a href="index.jsp">Go Back</a> <%
}
else if(choice == 3){

	String nm=request.getParameter("name2");
	String lnm=request.getParameter("lname");
	String email =request.getParameter("email2");
	String user1 =request.getParameter("party");
	String mn=request.getParameter("phone2");
	String sym = request.getParameter("symbol");
	String det = request.getParameter("details");
	boolean z= ob.signup2(nm, email, lnm, mn, sym, det);%>
	<jsp:forward page="index.jsp"></jsp:forward>
	<%
}
else if(choice==5){
	String nm=request.getParameter("name");
	String email =request.getParameter("email");
	String user1 =request.getParameter("user");

	String gn=request.getParameter("gender");
	String mn=request.getParameter("phone");
	String dob = request.getParameter("dob");
	String add = request.getParameter("address");
	boolean z= ob.edit(nm, user1, mn, gn, dob, add);%>
	<%= z %><%
}
else if(choice==6){
	String un = (String) session.getAttribute("UN");
	ResultSet rs = ob.fetch(un);
	String add = rs.getString("ADDRESS");
	
	String name = rs.getString("NAME");
	String adpd = request.getParameter("adpd");
	
	String uadpd = request.getParameter("uadpd");
	System.out.println(uadpd);
	String dobd = request.getParameter("dobd");
	String udobd = request.getParameter("udobd");
	boolean z = ob.pendding(un,adpd,uadpd,dobd,udobd,add,name);
	%>
	<jsp:forward page="home.jsp"></jsp:forward>
<% }

%>

</body>
</html>