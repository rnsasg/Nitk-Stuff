
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.util.*" %>

<%
session=request.getSession(false);
String username=(String)session.getAttribute("UNM");
if(username==null || username=="")
{
	response.sendRedirect("index.jsp");
}
%>

<%
    String requester=(String)session.getAttribute("UNM");
    Class.forName("oracle.jdbc.driver.OracleDriver");  
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
    Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    ResultSet rs=st.executeQuery("Select * from cart where requester='"+requester+"' and cart='true'");
    int row=0;
%>

<html>
    <head>
        <title>
            
        </title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    </head>
    <body>
        <div class="container-fluid">
            <jsp:include page="menu.jsp"></jsp:include>
        </div>
        
        <div class="container-fluid">
        
        
        <div class="row">
        		<div class="col-sm-6 col-sm-push-3">
        			<%  if(null!=request.getAttribute("Message"))
				    {%>
				       
				    <h4><font color="red"><%out.println(request.getAttribute("Message"));%></font></h4>
				     
				  <% }%>
        		</div>
     	</div>
        
        
             <form action="checkout.jsp" method="post">
                 
                 <div class="panel panel-primary">
                     <div class="panel-heading">
                          <h1 class="panel-title"> Cart Information </h1>
                             
                         
                     </div>
                     <div class="panel-body">
                         <table class="table table-bordered">
                                 <tr>
                                     <th width="40%">Picture</th>
                                     <th width="20%">Cat Name</th>
                                     <th width="20%">Item Name</th>
                                     <th width="20%">Action</th>
                                 </tr>
                                <% while(rs.next()) { %>
                                    <tr>
                                        <td><img src="Upload\<%=rs.getString(3)%>\<%=rs.getString(2)%>.jpg" width="100" height="100"/></td>
                                       <td><%= rs.getString(3)%></td>
                                       <td><%= rs.getString(4)%></td>
                                       <td><a href="removecart.jsp?request_id=<%=rs.getString(1)%>">Remove</a></td>
                                      <td align="center"></td>
                                    </tr>
                                    <% row++;  }
                                     session.setAttribute("item", row);
                                %> 
                         
                         </table>
                     </div>
                     <div class="panel-footer">
                         <a role="button" href="home.jsp" class="btn btn-lg btn-default">Contiune Shopping</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <a role="button" class="btn btn-lg btn-default" href="cartclear.jsp">Clear</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <input type="submit" value="Checkout" class="btn btn-lg btn-danger">
                     </div>
                 </div>            
             </form>
            
        </div>       
        
        <jsp:include page="footer.jsp"></jsp:include>
       
    </body>
</html>
