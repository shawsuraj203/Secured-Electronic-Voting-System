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
        	<li><a href="eo.jsp"  >Home</a></li>
            <li><a href="voter_req.jsp" >eVoter Req</a></li>
            <li><a href="party_req.jsp">Party Req</a></li>
            <li><a href="candidate_req.jsp" style="background-color:orange;">Candidate Req</a></li>
            <li><a href="contact1.jsp">Contacts</a></li>
         </ul>
    </nav>
    <div id="whole">
    <section id="sec">
    	<div id="cont">
    	<%
    	ResultSet rs =ob.candidate();
    	%>
    	<table>
    	<%while(rs.next()){ %>
    	<tr>
    	<td><%= rs.getString("NAME") %></td>
    	<td><%= rs.getString("CAND") %></td>
    	<td><%= rs.getString("PARTY") %></td>
    	<td><%= rs.getString("CONST") %></td>
    	<td><%= rs.getString("DOB") %></td>
    	<td><a href=cadd.jsp?name=<%= rs.getString("CAND") %>>Accept</a></td>
    	<td><a href=rejc.jsp?name=<%= rs.getString("CAND") %>>Reject</a></td>
    	</tr>
    	<%} %>
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
        <div style="position:relative; right:-300px; top:-30px; margin-top:0px; width:40px;"><a href="#"><img src="image/viewAll.png"></a></div>
            <img src="image/add2.jpg">
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
<script type="text/javascript" src="js/script.js"></script>
<%
}
else{
	%><jsp:forward page="home.jsp"></jsp:forward>
<% }
%>
</html>