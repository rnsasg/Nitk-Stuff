<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String id=request.getParameter("request_id");
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
   // PreparedStatement pst=con.prepareStatement("update cart set status='no' where request_id='"+id+"'");
   //PreparedStatement pst=con.prepareStatement("delete from cart where request_id='"+id+"'");
   
   
   Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select * from cart where request_id='"+ id +"'");
   rs.next();
   Statement st2=con.createStatement();
   st2.execute("update "+rs.getString(3)+" set status='true' where id='"+rs.getString(2)+"'");
  
   PreparedStatement pst=con.prepareStatement("update cart set status='no' where request_id='"+id+"'");
   pst.execute();
   con.commit();
   
   pst.close();
   con.close();
   //out.println("Successfully removed");
   response.sendRedirect("cart.jsp");   
%>
