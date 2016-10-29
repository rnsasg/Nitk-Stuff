<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
session=request.getSession(false);
String username=(String)session.getAttribute("UNM");
if(username==null || username=="")
{
	response.sendRedirect("index.jsp");
}

%>
<%

	session.removeAttribute("UNM");
	session.invalidate();	
	request.setAttribute("Message","Successfully logout");
	RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
    rd.forward(request, response);
   
    
    
%>
