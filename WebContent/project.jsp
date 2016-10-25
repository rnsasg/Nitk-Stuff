<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">   
</head>
<body>
    <%@page import="java.io.*"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.lang.*"%>
    <%
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from project");
        
    %>
    
    <div class="container-fluid">
               <jsp:include page="menu.jsp"></jsp:include>
    </div>
    
    <div class="container">
		<div class="row">
		
			<div class="col-sm-2">
			
			<ul class="nav nav-pills nav-stacked ">
  				<li class="nav-item"><a class="nav-link active" href="book.jsp">BOOK</a></li>
  				<li class="nav-item"><a class="nav-link" href="laptop.jsp">LAPTOP</a></li>
  				<li class="nav-item"><a class="nav-link" href="notes.jsp">NOTES</a></li>
  				<li class="nav-item"><a class="nav-link" href="project.jsp">PROJECT</a></li>
			</ul>
				
			</div>
			
			<div class="col-sm-10">
				
				
				  <form method="get" action="./productview.jsp">
   
        
       
        
        
     <div class="panel panel-info">
			<div class="panel-header">
				 <a class="panel-title" href="">Projects Details</a>
			</div>
			<div class="panel-body">
    <%
        
        while(rs.next())
        {   
            
            String p="F://Final/Stuff/WebContent/File_upload/project/";
            String pic=rs.getString(1);
            String p3=new String(p+pic+".jpg");
            System.out.println(p3);
    %>
                
                <div class="col-md-3">
                    <div class="thumbnail">
                        
                        <%
                            Blob b=rs.getBlob(7);  
                            byte barr[]=b.getBytes(1,(int)b.length());              
                            FileOutputStream fout=new FileOutputStream(p3);  
                            fout.write(barr);              
                            fout.close();
                        %>
			<img src="File_upload\book\<%=pic%>.jpg" alt="<%=rs.getString(5)%>" >
                            <div class="caption">
			 <a href="./productview.jsp?table=project&id=<%=rs.getInt(1)%>" ><%= rs.getString(5)%></a>
                            </div>
                    </div>
		</div>
            
    
       <%            
               }
         rs.close();
         con.close();
       %>
                        </div>
	</div>
   
    </form> 
				
				
			</div>
		</div>
	
	
	</div>
    
  
    <div class="container-fluid">
            <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>