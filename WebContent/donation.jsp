<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Donation</title>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrap-theme.min.css"/>

</head>
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
%>
<body>


<jsp:include page="menu.jsp"></jsp:include>
<form method="get" action="" name="frm">
<div class="container">
	<div class="row">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h1 class="panel-title"><script></script></h1>
			</div>
			<table class="table table-condensed">
				<tr><td colspan="4">
				 <div class="form-group">
        <label class="col-xs-3 control-label">Size</label>
        <div class="col-xs-5 selectContainer">
            <select class="form-control" name="item" onchange="call()">
                <option value="">Choose a stuff</option>
                <option value="book">Book</option>
                <option value="laptop">Laptop</option>
                <option value="notes">Notes</option>
                <option value="project">Project</option>
            </select>
        </div>
        <input type="submit" class="btn btn-default" value="select">
    </div>			
				</td></tr>
			</table>
		</div>
	</div>
</div>
</form>
<%@page import='java.sql.*' %>

<%
	if(null!=request.getParameter("item"))
	{
		String table=(String)request.getParameter("item");
		if(table.equals("Choose a stuff"))
		{
		%>
		<h1>Choose Stuff name First</h1>
		
		<%}else{ 
		
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("Select * from "+table+" where owner='"+user+"' order by date_of_add desc");
		%>
		<div class="container">
		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
				<th>Image</th>
				<th>Item Type</th>
				<th>Item Name</th>
				<th>Date</th>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td><img src="Upload/<%= table%>/<%=rs.getString(1)%>.jpg" height="100px" width="100px"></td>
				<td><%= table%></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getDate(2) %></td>
			</tr>
			<%}rs.close();con.close(); %>;
			
		<%}
}%>
	
		</table>
		</div>
	
	

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>

