

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
    while(rs.next())
        row++;
    rs.close();
    con.close();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
        <style>  
        
                .carousel-inner > .item > img,  
                .carousel-inner > .item > a > img {  
                    width: 80%;  
                    margin: auto;  
                }   
        </style>
    </head>
    <body>
      <nav class="navbar navbar-static-top navbar-light navbar-default">
             
              <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"></span>&nbsp;Nitk Stuff</a>
                
              <ul class="nav navbar-nav">
                <li class="nav-item active">
                  <a class="nav-link" href="./home.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                  
                <li class="nav-item">
                   <a class="nav-link" href="book.jsp">Category</a> 
                   
                </li> 
                  
                <li class="nav-item">
                  <a class="nav-link" href="./bookentry.jsp">Donate</a>
                </li>
                  
                <li class="nav-item">
                  <a class="nav-link" href="aboutus.jsp">About</a>
                </li>
                  
                <li class="nav-item">
                  <a class="nav-link" href="#">Contact</a>
                </li>
                 <form role="form" class="form-inline navbar-form  navbar-right">
                     
                      
                      &nbsp; 
                      <% if(session.getAttribute("UNM")==null) {%>
                      <a class="btn btn-primary" type="button" href="login.jsp">Sign In </a>                     
                         &nbsp;
                      <a href="signup.jsp" class="btn  btn-success"><span class="glyphicon glyphicon-user">SignUp</span></a>                       
                      <%} %>
                       
                      <% if(session.getAttribute("UNM")!=null) {%>
                      <a class="btn btn-primary" type="button" href="cart.jsp">
                        <span class="glyphicon glyphicon-shopping-cart">&nbsp;</span>Cart&nbsp;<span class="badge"><%=row%>  </span>
                        </a>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                       
                         
                         <button type="button" class="btn btn-default dropdown-toggle " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						     <span class="glyphicon glyphicon-user">Welcome,<%= session.getAttribute("UNM") %></span>
						      <span class="caret"></span>						      
						    </button>
						    <ul class="dropdown-menu">
						      <li><a href="logout.jsp">Logout</a></li>
						      <li><a href="profile.jsp">Profile</a></li>
						      <li><a href="myrequest.jsp">My Request</a></li>
						      <li><a href="approverequest.jsp">Approve Request</a></li>
						      <li><a href="donation.jsp">Your Donations</a></li>
						    </ul>
						    
                      <%} %>
                        
                        
                     
                  </form>
                 
             </ul>
                
         </nav>
         <script type="text/javascript" src="js/npm.js"></script>
       <script type="text/javascript" src="js/bootstrap-min.js"></script>
       <script src="js/jquery-min.js"></script> 
     <script src="js/jquery-1.10.2.min.js"></script>
    </body>
</html>
