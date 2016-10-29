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
   
    String user=(String)session.getAttribute("UNM");
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
    PreparedStatement pst=con.prepareStatement("update cart set cart='false' where requester='"+username+"'");
    pst.executeUpdate();
    con.commit();
    con.close(); 
    
    request.setAttribute("Message", "All item removed successfully");
    RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
    rd.forward(request, response);
  
   response.sendRedirect("cart.jsp");   
%>

