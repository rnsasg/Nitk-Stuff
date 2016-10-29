<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Request</title>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
</head>
<body>

<%@page import="java.sql.*"%>
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
	PreparedStatement pscart=con.prepareStatement("select * from request where doner='"+user+"' and approved='false'");
	ResultSet rs=pscart.executeQuery();
	
%>
	<jsp:include page="menu.jsp"></jsp:include>
	<form action="validateApprove.jsp" method="post">
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
		
			<div class="panel panel-default">
				<div class="panel-heading">
					<h1 class="panel title">Requests</h1>
				</div>
				
				<table class="table table-striped table-bordered table-hover table-condensed">
				
					<tr>
						<th>Image</th>
						<th>Item Type</th>
						<th>Name</th>
						<th>Requester Name</th>
						<th>Requester Id</th>
						<th>Requester Mobile No</th>
						<th>Requester Email</th>
						<th>Date</th>
						<th>Approved</th>						
					</tr>
					<% while(rs.next()){%>
					
					<tr>
						<td ><img src="Upload/<%=rs.getString(4)%>/<%=rs.getString(5)%>.jpg" height="100" width="100"></td>
						<td><%=rs.getString(4)%></td>
						
						<%
							// Item Name
							PreparedStatement ps=con.prepareStatement("select * from "+rs.getString(4)+" where id='"+rs.getString(5)+"'");
							ResultSet rs1=ps.executeQuery();
							rs1.next();
						%>
						<td><%= rs1.getString(5)%></td>
						
						<%
							// requester Detail
							PreparedStatement pst1=con.prepareStatement("select * from users where roll_no='"+rs.getString(2)+"'");
							ResultSet rs3=pst1.executeQuery();
							rs3.next();
						%>
						<td><%= rs3.getString(1) %></td>
						<td><%= rs3.getString(2) %></td>
						<td><%= rs3.getString(4) %></td>
						<td><%= rs3.getString(3) %></td>
												
						<td><%= rs.getDate(6) %></td>
						<td><input type="checkbox" name="check" value="<%= rs.getString(1)%>"></td>
					</tr>
					
					<% rs3.close();rs1.close();}  con.close();%>
					<tr>
						<td></td><td></td><td></td><td></td>
						<td><input type="submit" value="Approve" class="btn  btn-success"></td>
						<td></td><td></td><td></td><td></td>
					</tr>
					
				</table>
				
				
				</div>
			</div>
			
		</div>	
	</form>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>