<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">   
</head>
<body>
<%
session=request.getSession(false);
String user=(String)session.getAttribute("UNM");
if(user==null || user=="")
{
	response.sendRedirect("index.jsp");
}

%>
    <%@page import="java.io.*"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.lang.*"%> 
    <%
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
        Statement st1=con.createStatement();
        ResultSet rs1=st1.executeQuery("select * from book where status='true' and rownum<=4 order by date_of_add desc");
        Statement st2=con.createStatement();
        ResultSet rs2=st2.executeQuery("select * from laptop where status='true' and rownum<=4 order by date_of_add desc");
        Statement st3=con.createStatement();
        ResultSet rs3=st3.executeQuery("select * from notes where status='true' and rownum<=4 order by date_of_add desc");
        Statement st4=con.createStatement();
        ResultSet rs4=st4.executeQuery("select * from project where status='true' and rownum<=4 order by date_of_add desc");
        
    %>
    
     <jsp:include page="menu.jsp"></jsp:include>
     
    <form method="post" action="productview.jsp">
        
        <div class="container">
        
        <div class="panel panel-info">
			<div class="panel-header">
	                    <a class="panel-title" href="book.jsp">Book Details</a>
			</div>
			<div class="panel-body">
			    <%
			        
			        while(rs1.next())
			        {   
			            
			            String p="F://Final/Stuff/WebContent/Upload/book/";
			            String pic=rs1.getString(1);
			            String p3=new String(p+pic+".jpg");
			            System.out.println(p3);
			    %>
			                
			                <div class="col-md-3">
			                    <div class="thumbnail">
			                        
			                        <%
			                            Blob b=rs1.getBlob(7);  
			                            byte barr[]=b.getBytes(1,(int)b.length());              
			                            FileOutputStream fout=new FileOutputStream(p3);  
			                            fout.write(barr);              
			                            fout.close();
			                        %>
						<img src="Upload/book/<%= pic %>.jpg" alt="<%=rs1.getString(5)%>" width="500" height="500">
			                            <div class="caption">
							<a href="productview.jsp?table=book&id=<%=rs1.getInt(1)%>" ><%= rs1.getString(5)%></a>
			                            </div>
			                    </div>
			                   
					</div>
			            
			    
			       <%            
			               }
			        rs1.close();
			       %>
			     </div>
		</div>
          
                        
        
         
         
          <div class="panel panel-info">
			<div class="panel-header">
				 <a class="panel-title" href="laptop.jsp">Laptop Details</a>
			</div>
			<div class="panel-body">
    <%
        
        while(rs2.next())
        {   
            
            String p="F://Final/Stuff/WebContent/Upload/laptop/";
            String pic=rs2.getString(1);
            String p3=new String(p+pic+".jpg");
            System.out.println(p3);
    %>
                
                <div class="col-md-3">
                    <div class="thumbnail">
                        
                        <%
                            Blob b=rs2.getBlob(7);  
                            byte barr[]=b.getBytes(1,(int)b.length());              
                            FileOutputStream fout=new FileOutputStream(p3);  
                            fout.write(barr);              
                            fout.close();
                        %>
			<img src="Upload/laptop/<%=rs2.getString(1)%>.jpg" alt="<%=rs2.getString(5)%>">
                            <div class="caption">
				 <a href="./productview.jsp?table=laptop&id=<%=rs2.getString(1)%>" ><%= rs2.getString(5) %></a>
                            </div>
                    </div>
		</div>
            
    
       <%            
               }
      
       %>
                        </div>
	</div>
                        
 
         
        
        
         <div class="panel panel-info">
			<div class="panel-header">
				 <a class="panel-title" href="notes.jsp">Note Details</a>
			</div>
			<div class="panel-body">
    <%
        
        while(rs3.next())
        {   
            
            String p="F://Final/Stuff/WebContent/Upload/notes/";
            String pic=rs3.getString(1);
            String p3=new String(p+pic+".jpg");
            System.out.println(p3);
    %>
                
                <div class="col-md-3">
                    <div class="thumbnail">
                        
                        <%
                            Blob b=rs3.getBlob(7);  
                            byte barr[]=b.getBytes(1,(int)b.length());              
                            FileOutputStream fout=new FileOutputStream(p3);  
                            fout.write(barr);              
                            fout.close();
                        %>
			<img src="Upload/notes/<%=rs3.getString(1)%>.jpg" alt="<%=rs3.getString(5)%>">
                            <div class="caption">
				 <a href="./productview.jsp?table=notes&id=<%=rs3.getString(1)%>" ><%= rs3.getString(5)%></a>
                            </div>
                    </div>
		</div>
            
    
       <%            
               } rs3.close();
         
       %>
                        </div>
	</div>
                        
         
         
          <div class="panel panel-info">
			<div class="panel-header">
				 <a class="panel-title" href="project.jsp">Project Details</a>
			</div>
			<div class="panel-body">
    <%
        
        while(rs4.next())
        {   
            
            String p="F://Final/Stuff/WebContent/Upload/project/";
            String pic=rs4.getString(1);
            String p3=new String(p+pic+".jpg");
            System.out.println(p3);
    %>
                
                <div class="col-md-3">
                    <div class="thumbnail">
                        
                        <%
                            Blob b=rs4.getBlob(7);  
                            byte barr[]=b.getBytes(1,(int)b.length());              
                            FileOutputStream fout=new FileOutputStream(p3);  
                            fout.write(barr);              
                            fout.close();
                        %>
			<img src="Upload/project/<%=rs4.getString(1)%>.jpg" alt="<%=rs4.getString(5)%>" >
                            <div class="caption">
				 <a href="./productview.jsp?table=project&id=<%=rs4.getString(1)%>" ><%= rs4.getString(5)%></a>
                            </div>
                    </div>
		</div>
            
    
       <%            
               }
               rs4.close();
               con.close();
       %>
                        </div>
	</div>
        
        
        
        
       
    </div>
    </form>
    <jsp:include page="footer.jsp"></jsp:include>
    
</body>
</html>