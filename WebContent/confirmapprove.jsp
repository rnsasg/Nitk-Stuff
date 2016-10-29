<%
session=request.getSession(false);
String username=(String)session.getAttribute("UNM");
if(username==null || username=="")
{
	response.sendRedirect("index.jsp");
}
%>
<%@page import="java.sql.*" %>
<%@page import="narayan.GmailMail" %>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
	
	GmailMail mail=new GmailMail();
	String[] checked=(String[])request.getParameterValues("value");
	//session.removeAttribute("valid");
	String remail,dname,dblock,droomno;
	String sub,msg;
	
	for(String ch:checked)
	{
		msg="Your Request has been Approved \n";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from request where req_id='"+ch+"'");
		rs.next();
		
		
		Statement st1=con.createStatement();
		ResultSet rs1=st1.executeQuery("select email from users where roll_no='"+rs.getString(2)+"'");
		rs1.next();
		remail=null;
		remail=rs1.getString(1);
		rs1.close();
		
		Statement st2=con.createStatement();
		ResultSet rs2=st2.executeQuery("select name,block,room_no from users where roll_no='"+rs.getString(3)+"'");
		rs2.next();
		dblock=null;
		droomno=null;
		dname=null;
		dname=rs2.getString(1);
		dblock=rs2.getString(2);
		droomno=rs2.getString(3);
		rs2.close();
		
		
		msg+="Order id:"+rs.getString(1)+"\n Doner Name: "+dname+"\nDoner Hostel Block: "+dblock+"\n Doner Room No:"+droomno+"\n";
		msg+="now you can visit and take stuff form referenced address \n Thank You for your time \n Give feedback About Nitk Stuff";
				
		sub="Request Approved";
		
		mail.msgSend(remail, sub, msg);
		
		
		/* Delete book entry */
		
	 	PreparedStatement pst=con.prepareStatement("update "+rs.getString(4)+" set status='false' where id='"+rs.getString(5)+"'");
		pst.executeUpdate();
		pst.close();
	
		/* delete from cart */
		
		PreparedStatement pst1=con.prepareStatement("update cart set cart='false' where type='"+rs.getString(4)+"' and id='"+rs.getString(5)+"'");
		pst1.executeUpdate();
		pst1.close();
		/* delete from request */
		
		PreparedStatement pst2=con.prepareStatement("update request set approved='true' where req_id='"+ch+"'");
		pst2.executeUpdate();
		pst2.close();
		
		rs.close();
		msg=null;
	}
	
	con.close();
	
	 request.setAttribute("Message", "Items are requested Successfully");
     response.sendRedirect("approverequest.jsp");
%>