<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
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
    String table=(String)request.getParameter("table");
    String id=(String)request.getParameter("id");    
    String user=(String)session.getAttribute("UNM");
    Class.forName("oracle.jdbc.driver.OracleDriver");
    String p1=request.getParameter("page");
    
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
    
    
    Statement st3=con.createStatement();
    ResultSet rs3=st3.executeQuery("select * from cart where requester='"+user+"' and id='"+id+"' and type='"+table+"' and cart='true'");
    if(rs3.next())
    {
    	request.setAttribute("Message", "Item already in the cart");
    	if(p1.equals("sendrequest"))
    	{
    		RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
    		rd.forward(request, response);	
    	}
    	else if(p1.equals("productview"))
    	{
    		RequestDispatcher rd = request.getRequestDispatcher("productview.jsp");
    		rd.forward(request, response);	
    	}        
       
    }
    else
    {
    	
    	
        PreparedStatement pst=con.prepareStatement("insert into cart values(?,?,?,?,?,?,?,?,?)");
        
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from cart");
        
        Statement st1=con.createStatement();
        ResultSet rs1=st1.executeQuery("select * from " +table+ " where id='"+id+"'");        
    	
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
        pst.setString(6,"false");
        pst.setString(7,user);
        pst.setString(8,"true");
        pst.setString(9,"true");
        pst.executeUpdate();
        pst.close();    
        rs.close();
        rs1.close();
        
        
        if(p1.equals("sendrequest"))
    	{
        	request.setAttribute("Message", "To Confirm plsease checkout");
    		RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
    		rd.forward(request, response);	
    	}
    	else if(p1.equals("productview"))
    	{
    		request.setAttribute("Message", "Item added to cart");
    		RequestDispatcher rd = request.getRequestDispatcher("productview.jsp");
    		rd.forward(request, response);	
    	}	
    }
    
    
        
    
    
    rs3.close();
    con.close();
    //response.setHeader("table",table);
    //response.setHeader("id",id);
    //response.setIntHeader("id", id);
    response.sendRedirect("productview.jsp?table="+table+"&id="+id);
    
%>