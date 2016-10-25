

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    
    String requester=(String)session.getAttribute("UNM");
    Class.forName("oracle.jdbc.driver.OracleDriver");  
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
    Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    ResultSet rs=st.executeQuery("Select * from cart where requester='"+requester+"' and status='yes'");
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
                  <a class="nav-link" href="#">About</a>
                </li>
                  
                <li class="nav-item">
                  <a class="nav-link" href="#">Contact</a>
                </li>
                 <form class="form-inline navbar-form  navbar-right">
                     
                        <div class="input-group ">
                            <input type="text" class="form-control" placeholder="Search Item" aria-describedby="basic">
                            <span class="input-group-addon" id="basic"><span class="glyphicon glyphicon-search"></span></span>
                        </div>
                      &nbsp; 
                      <a class="btn btn-primary" type="button" href="cart.jsp">
                        <span class="glyphicon glyphicon-shopping-cart">&nbsp;</span>Cart&nbsp;<span class="badge"><%=row%>  </span>
                        </a>
                         &nbsp;
                        <a href="./logout.jsp" class="btn btn-lg btn-info"><span class="glyphicon glyphicon-user">Logout</span></a>
                     
                  </form>
             </ul>
                
         </nav>
       <script src="js/jquery.min.js"></script> 
    <script src="js/bootstrap.min.js"></script>
     <script src="js/jquery-1.10.2.min.js"></script>
    </body>
</html>
