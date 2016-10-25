<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
   
    String user=(String)session.getAttribute("UNM");
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
    
    
   Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select * from cart where requester='"+user+"' and status='yes'");
   while(rs.next())
   {
        Statement st2=con.createStatement();
        st2.execute("update "+rs.getString(3)+" set status='true' where id='"+rs.getString(2)+"'");
   }
    
    
    Statement st3=con.createStatement();
    st3.execute("delete from cart where requester='"+user+"'");
    con.commit();
    con.close();
   //out.println("Successfully removed");
   response.sendRedirect("cart.jsp");   
%>

