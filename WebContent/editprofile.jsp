<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User Profile</title>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
 <script>
         	function validateform()
         	{
         		
         		
         		var pwd=document.signup.password.value;
         		var cpwd=document.signup.cpassword.value;
         		if(pwd!=cpwd)
         		{
         			alert("Password and confirm password should be same");
         			return false;
         		} 
         		if(pwd.length<=6)
         		{
         			alert("Password length should atleast 6 character long");
         			return false;
         		} 
         	}
         	
         </script>
</head>
<body>
<%@page import="java.sql.*" %>
<%
session=request.getSession(false);
String username=(String)session.getAttribute("UNM");
if(username==null || username=="")
{
	response.sendRedirect("index.jsp");
}
%>
<%
	String user=(String)session.getAttribute("UNM");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where roll_no='"+user+"'");
	
	
%>
<jsp:include page="menu.jsp"></jsp:include>
<form action="changeprofile.jsp" method="post" onsubmit="return validateform()" name="signup">
<div class="container">
	
		<div class="row">
        		<div class="col-sm-6 col-sm-push-3">
        			<%  if(null!=request.getAttribute("Message"))
				    {%>
				       
				    <h4><font color="red"><%out.println(request.getAttribute("Message"));%></font></h4>
				     
				  <% }%>
        		</div>
     	</div>
     	<div class="row">
			<div class="col-sm-6 col-sm-push-3">
		<div class="panel panel-default">	
		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
			<th colspan="7">User Profile</th>
			</tr>
			<%if(rs.next()){ %>
				<tr>
					<td>Name</td>
					<td><input type="text" value="<%= rs.getString(1) %>" disabled></td>
				</tr>
				<tr>
					<td>Roll NO</td>
					<td><input type="text" value="<%= rs.getString(2) %>" disabled></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" value="<%= rs.getString(7) %>" name="password" pattern="^([A-Za-z0-9]{1,})(\s([a-zA-Z]{1,4}))*$" title="Invalid Block Name" required></td>
				</tr>
				<tr>
					<td>Confirm Password</td>
					<td><input type="password"  name="cpassword"  pattern="^([A-Za-z0-9]{1,})(\s([a-zA-Z]{1,4}))*$" title="Invalid Block Name" required></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="email" value="<%= rs.getString(3) %>" name="email" required></td>
				</tr>
				<tr>
					<td>Mob No</td>
					<td><input type="text" value="<%= rs.getString(4)%>" name="mob_no" pattern="^([0-9]{10})$" title="Invalid Mobile No" required></td>
				</tr>
				<tr>
					<td>Block</td>
					<td><input type="text" value="<%= rs.getString(5) %>" name="block" required></td>
				</tr>
				<tr>
					<td>Room No</td>
					<td><input type="text" value="<%= rs.getString(6) %>" name="roomno" pattern="^([0-9]{1,3})$" title="Invalid Room No" required></td>
				</tr>
				
			<%} rs.close();con.close();%>
			<tr>
			<td colspan="2" ><center><input type="submit" class="btn btn-success" value="Update"></center></td>
			
			</tr>
		</table>
		</div>
		</div>
</div>
</div>
</form>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>