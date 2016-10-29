<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="model.*"%>
<%@page import="narayan.GmailMail"%>
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
	PreparedStatement pscart=con.prepareStatement("select * from cart where requester='"+user+"' and cart='true'");
	ResultSet rs=pscart.executeQuery();
	 
	long millis=System.currentTimeMillis();  
    Date date=new java.sql.Date(millis);
	
	int count=0;
	String reqemail=null;
	String rsub=null;
	String reqmsg=null;
	String msg=null;
	
	String donermsg=null;
	String dsub=null;
	String demail=null;
	
	Statement st=con.createStatement();
	GmailMail mail=new GmailMail();
	ResultSet rscount=st.executeQuery("select * from request");
	while(rscount.next())
		count++; 
	
	int scount=count;
	
	while(rs.next())
	{
	
		Statement st1=con.createStatement();
		ResultSet rs2=st1.executeQuery("select * from "+rs.getString(3)+" where id='"+rs.getString(2)+"'");
		rs2.next();
		
		
		PreparedStatement pst=con.prepareStatement("insert into request values(?,?,?,?,?,?,?)");
		pst.setInt(1, count);
		pst.setString(2, rs.getString(7));
		pst.setString(3, rs2.getString(4));
		pst.setString(4, rs.getString(3));
		pst.setString(5, rs.getString(2));
		pst.setDate(6, date);
		pst.setString(7,"false");		
		pst.executeUpdate();
		
		/* Requester Email */
		
		/* Doner Email Start */
		Statement st2=con.createStatement();
		ResultSet rs3=st2.executeQuery("Select email from users where roll_no='"+rs2.getString(4)+"'");
		rs3.next();
		
		demail=rs3.getString(1);		
		donermsg="Order id:"+count+"\n Stuff is requested by: "+rs.getString(7)+"\n Stuff Type:"+rs.getString(3)+"\n Stuff Name is:"+rs.getString(4)+"\n Date:"+rs.getDate(5)+"\n You can approved this requested by the website";
		dsub="Stuff Requests Form NITK STUFF";		
		
		mail.msgSend(demail,dsub,donermsg);
		
		demail=null;
		donermsg=null;
		dsub=null;
		
		/* Requester msg Start */
		
			msg+=" \n Item : \n Order id:"+count+"\n Stuff Type:"+rs.getString(3)+"\n Stuff Name is:"+rs.getString(4)+"\n Date:"+rs.getDate(5)+"";
		
	   /* Requester msg End */
		count++;
		
		
	}
	/* Requester Email Start */
	
		 int no_of_item=count-scount;	 
		 reqmsg="You Requested "+no_of_item+" Item\n";
		 reqmsg+=msg;
		 Statement st4=con.createStatement();
		 ResultSet rs5=st4.executeQuery("Select email from users where roll_no='"+user+"'");
		 rs5.next();
		 reqemail=rs5.getString(1);
		 rsub="Nitk Stuff Request Message";
		 
		 mail.msgSend(reqemail, rsub, reqmsg);
	 
	 
	 /* Requester Email End */
	 
	 
	 /* Item Delete form cart */
	 
	 	PreparedStatement pst=con.prepareStatement("update cart set cart='false' where requester='"+username+"'");
    	pst.executeUpdate();
    	con.commit();
   		con.close();
   	
	 request.setAttribute("Message", "Items are requested Successfully");
     response.sendRedirect("myrequest.jsp");
	
%>