<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<% 
    String table=(String)request.getParameter("table");
    String id=(String)request.getParameter("id");    
    String user=(String)session.getAttribute("UNM");
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
    PreparedStatement pst=con.prepareStatement("insert into cart values(?,?,?,?,?,?,?,?)");
    
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from cart");
    
    Statement st1=con.createStatement();
    ResultSet rs1=st1.executeQuery("select * from " +table+ " where id='"+id+"'");
    
    Statement st2=con.createStatement();
    st2.executeQuery("update "+table+" set status='false' where id='"+id+"'");
    
    int count=1;
    while(rs.next())
        count++;
    
    long millis=System.currentTimeMillis();  
    Date date=new java.sql.Date(millis);
    
    pst.setString(1,""+count);
    pst.setString(2,id);
    pst.setString(3,table);
    rs1.next();
    pst.setString(4,rs1.getString(5));
    pst.setDate(5,date);
    pst.setString(6,"no");
    pst.setString(7,user);
    pst.setString(8,"yes");
    pst.executeUpdate();
        
    
    pst.close();    
    rs.close();
    rs1.close();
    con.close();
    //response.setHeader("table",table);
    //response.setHeader("id",id);
    //response.setIntHeader("id", id);
    response.sendRedirect("productview.jsp?table="+table+"&id="+id);
    
%>