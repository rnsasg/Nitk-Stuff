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

	String pwd=(String)request.getParameter("password");
	String email=(String)request.getParameter("email");
	String mob=(String)request.getParameter("mob_no");
	String block=(String)request.getParameter("block");
	String roomno=(String)request.getParameter("roomno");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
	PreparedStatement pst=con.prepareStatement("update users set password=?,email=?,mob_no=?,block=?,room_no=? where roll_no=?");
	pst.setString(1,pwd);
	pst.setString(2,email);
	pst.setString(3,mob);
	pst.setString(4,block);
	pst.setString(5,roomno);
	pst.setString(6,user);
	pst.executeUpdate();
	
	pst.close();
	con.close();
	
	request.setAttribute("Message", "Record save successfully");
    RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
    rd.forward(request, response);
	
	
	
	
%>