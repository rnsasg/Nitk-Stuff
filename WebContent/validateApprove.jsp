<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
session=request.getSession(false);
String username=(String)session.getAttribute("UNM");
if(username==null || username=="")
{
	response.sendRedirect("index.jsp");
}
%>
<%@page import="java.sql.*" %>
<% 
	String user=(String)session.getAttribute("UNM");
	String[] checked=(String[])request.getParameterValues("check");
	if(checked==null)
	{
		request.setAttribute("Message", "You didn't selected any item ");
        RequestDispatcher rd = request.getRequestDispatcher("approverequest.jsp");
        rd.forward(request, response);
	}
	//session.setAttribute("valid",checked);
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
</head>

<body>
<jsp:include page="menu.jsp"></jsp:include>
<form action="confirmapprove.jsp" method="post">
	<div class="container">
		 <div class="row">
        		<div class="col-sm-6 col-sm-push-3">
        			<%  if(null!=request.getAttribute("Message"))
				    {%>
				       
				    <h4><font color="red"><%out.println(request.getAttribute("Message"));%></font></h4>
				     
				  <% }%>
        		</div>
     	</div>
		<%
			for(String ch:checked)
			{
		%>
			<input type="hidden" name="value" value="<%=ch%>">
		<% }%>
		<div class="row">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-heading">Confirm request</h3>
				</div>
				<table class="table table-striped table-bordered table-hover table-condensed">
					<tr>
						<th>Image</th>
						<th>Requester Id</th>
						<th>Stuff type</th>
						<th>Stuff id</th>
						<th>date</th>
					</tr>
					<% for(String ch:checked)
						{
							PreparedStatement pst=con.prepareStatement("select * from request where doner='"+user+"' and req_id='"+ch+"'");
							ResultSet rs=pst.executeQuery();
							rs.next();%>
					<tr>
						<td><img src="Upload/<%=rs.getString(4)%>/<%=rs.getString(5)%>.jpg" height="100" width="100"></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getDate(6) %></td>
					</tr>
					<% rs.close();}con.close();%>	
					<tr>
						<td></td><td></td>
						<td><input type="submit" value="Confirm Approved" class="btn  btn-info"></td>
						<td></td><td></td>
					</tr>			
				</table>
			</div>
		</div>
	</div>
	
</form>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

	
	
		
		
	
