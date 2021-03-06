<%@ page language="java" import="eVote.DAO, java.sql.ResultSet" import="javax.servlet.http.HttpSession" session="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>eVote::Home</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/main1.css"/>
<link rel="shortcut icon" href="image/icon.jpg"/>
<style type="text/css">
.tab td, th{
padding:20px ; 
 }
</style>
<%
HttpSession session = request.getSession(false);
DAO ob = new DAO();
String name=(String)session.getAttribute("UN");
String type = ob.check(name);
if(type.equals("E"))
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
                <option value="pass1.jsp">Change Password</option>
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
        	<li><a href="eo.jsp"  >Home</a></li>
            <li><a href="voter_req.jsp" style="background-color:orange;" >eVoter Req</a></li>
            <li><a href="party_req.jsp">Party Req</a></li>
            <li><a href="candidate_req.jsp">Candidate Req</a></li>
            <li><a href="contact1.jsp">Contacts</a></li>
         </ul>
    </nav>
    <div id="whole">
    <section id="sec" style="width:1200px">
    	<div id="cont"">
    	<%
    	ResultSet rs =ob.pend();
    	%>
    	<table class="tab" border="1">
    	<caption>Voter Request</caption>
    	<tr>
    	<th>NAME</th>
    	<th>USERN</th>
    	<th>Voter_ID</th>
    	<th>ADDRESS</th>
    	<th>Address Proof</th>
    	<th>File Name</th>
    	
    	<th>Birth Proof</th>
    	<th>File Name</th>
    	<th colspan="2">Action</th>
    	</tr>
    	<%while(rs.next()){ %>
    	<tr>
    	<td><%= rs.getString("NAME") %></td>
    	<td><%= rs.getString("USERN") %></td>
    	<td><%= rs.getString("UNNO") %></td>
    	<td><%= rs.getString("ADDRESS") %></td>
    	<td><%= rs.getString("ID1D") %></td>
    	<br>
    	<td><a href="file/<%= rs.getString("ID1") %>"><%= rs.getString("ID1") %></a></td>
    	<td><%= rs.getString("ID2D") %></td>
    	<td><a href="file/<%= rs.getString("ID2") %>"><%= rs.getString("ID2") %></a></td>
    	<td><a href=acc.jsp?name=<%= rs.getString("USERN") %>>Accept</a></td>
    	<td><a href=rej.jsp?name=<%= rs.getString("USERN") %>>Reject</a></td>
    	</tr>
    	<%} %>
    	
    	 
    	</table>
    	</div>
    </section>
    <aside id="ad">
         
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
<script type="text/javascript" src="js/script.js"></script>
<%
}
else{
	%><jsp:forward page="home.jsp"></jsp:forward>
<% }
%>
</html>