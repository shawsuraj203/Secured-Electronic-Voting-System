<%@ page language="java" import="eVote.DAO, java.sql.ResultSet" import="javax.servlet.http.HttpSession" session="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>eVote::Shedule</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/main1.css"/>
<style type="text/css">
.tab td, th{
padding:20px ; 
 }
</style>
<link rel="shortcut icon" href="image/icon.jpg"/>
<%
HttpSession session = request.getSession(false);
DAO ob = new DAO();
String name=(String)session.getAttribute("UN");
String type = ob.check(name);
if(type.equals("U"))
{
%>
</head>
<body style="background-image:url(image/back.png)">
<div id="trav">
<header>
     <div style="float:left;"><span style="margin-left:20px; margin-top:10px; margin-bottom:5px;"><img src="image/logo.png" width="120" height="50"></span> </div>
       
    
    <div align="right" id="right" style="float:right;">
	<span style="font-size:14px; padding:5px;">
		<select class="user" onchange="location = this.options[this.selectedIndex].value;">
                <option selected>
		 <%
                out.print(name);
            
            %>
		        </option>
                <option value="profile.jsp">Profile</option>
                <option value="pass.jsp">Change Password</option>
                <option value="logout.jsp?logout=true">Log Out</option>
            </select>
	|<a href="index.jsp">About eVote</a>  | <a href="home.jsp">Home</a></span>
	<br>
	  <form action="results.jsp">
    Search:<input type="text" style="width:110px;" name="textinput">
    <button type="submit" class="heading">Go</button></form>
</div>
        <div id="clr"></div>
    </header>
</div>
<nav id="menu" style="background:url(image/navBg.png repeat-x;)">
    	<ul id="submenu">
        	<li><a href="home.jsp" >Home</a></li>
            <li><a href="voter.jsp" >eVoter Card</a></li>
            <li><a href="details.jsp"  style="background-color:orange;">Election Details</a></li>
            <li><a href="cast.jsp">Cast Vote</a></li>
            <li><a href="result.jsp">Election Result</a></li>
            <li><a href="contact.jsp">Contacts</a></li>
         </ul>
    </nav>
    <div id="whole">
    <section id="sec">
    	<div id="cont">
    	<h1 style="color:red; font-family:lucida calligraphy; text-decoration:underline;">Election at your constituency:</h1>
    	<table>
    	<%
    	ResultSet rs = ob.fetch(name);
    	String con = rs.getString("con");
    	
    	String clas="a";
    	ResultSet rey = ob.uviewschedule(con);
    	out.print(rey.getString("ELECTIONDATE"));%>
    	<br><h1 style="color:red; font-family:lucida calligraphy; text-decoration:underline;">Counting Date:</h1>
    	<%
    	out.print(rey.getString("COUNTINGDATE"));%>
    	<br/><h1 style="color:blue; font-family:lucida calligraphy;">Election at other Places:</h1>
    	<%
    	ResultSet res=ob.viewschedule(clas);%>
    	<tr>
    	<th>Election Date</th>
    	<th>Constituency</th>
    	<th>Counting Date</th>
    	</tr>
    	<%
    	while(res.next())
    	{%>
    	
    	<tr>
    		<td><%=res.getString("Electiondate")%></td>
    		<td><%=res.getString("Constituency") %></td>
    		<td><%=res.getString("Countingdate") %></td> 
    	<%} %>
    	</tr>
    	
</table>
    	
    	</div>
    </section>
    <aside id="ad">
    <div="news>
    <table border="1" width="100px" bgcolor="#ffffff">
            <tr bordercolor="#FFFFFF"><td><center><img src="image/splWeekHeading.png"></center></td></tr>
   			<tr><td><marquee direction="up"><center><h3 style="color:red">Important Dates</h3><br><h5 style="color:blue">Party Registration Last Day&nbsp; &nbsp; &nbsp;06/15/2015</h5>
<br><h5 style="color:blue">Candidate Registration Last Day&nbsp; &nbsp; &nbsp;06/15/2015</h5>
<br><h5 style="color:blue">Voter ID Req  Last Day&nbsp; &nbsp; &nbsp;06/15/2015</h5>

<br><h5 style="color:blue">Voting Starts From&nbsp; &nbsp; &nbsp;06/15/2015</h5>
</center></marquee></td>
    	</tr></table>
        <div style="position:relative; right:-300px; top:-30px; margin-top:0px; width:40px;"><a href="details.jsp"><img src="image/viewAll.png"></a></div>
            
</div>
    </aside>
    </div>
 <div class="footer">	
	<div class="subFooter">
		<a href="#" class="back2Top" id="toTop"><img src="image/bk2Top.png" width="196px" height="40px" alt="" title="" /></a>
    	<div class="footerMenu marginRigh40">
        <h1>Quick Links</h1>
        	<ul>
            	<li><a href="#">Home</a></li>
                <li><a href="#">Election Details</a></li>
                <li><a href="#">Election Result</a></li>
                <li><a href="#">FAQ</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>
        <div class="footerMenu footerMenu2">
        <br>
        	<ul>
				<li><a href="#">Govt. of India</a>
                <li><a href="#">Govt. West Bengal</a></li>
                <li><a href="#">Election Commission</a></li>
                <li><a href="#">Mamta Banerjee</a></li>           
            </ul>
            <div class="clear"></div>
        </div>
        <div class="footerSocialIcon">
        <h1>Find us</h1>
        <a href="#"><img src="image/f_connect.png" alt="Connect to Facebook" title="Connect to Facebook" /></a>
        <a href="#"><img src="image/t_follow.png" alt="Follow on Twitter" title="Follow on Twitter" /></a>
        <a href="#"><img src="image/l_connect.png" alt="Connect on LinkedIn" title="Connect on LinkedIn" /></a>
        </div>
        <div class="clear">&nbsp;</div><br>
        <div id="last"> <center><sup color="red">&copy;</sup> Election Commission Of India Devloped By Suraj Shaw & Team</center>
</div>
    </div>
   
</body>
<%
}
else if(type.equals("A")){
%>
<jsp:forward page="admin.jsp?clas=b"></jsp:forward>
<%
}
else if(type.equals("E"))
{
%>
<jsp:forward page="eo.jsp"></jsp:forward>
<%
}
else{
	out.println("You Don't have access to this Page.");
}
%>
</html>