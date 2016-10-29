

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
       String id=request.getParameter("request_id");
       Class.forName("oracle.jdbc.driver.OracleDriver");
       Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
   
	   Statement st=con.createStatement();	   
	   int row=st.executeUpdate("update cart set cart='false' where request_id='"+id+"'");	   
	   con.commit();
	   con.close();
	   
	   request.setAttribute("Message", "item removed successfully");
       RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
       rd.forward(request, response);  
%>
