
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="css/bootstrap.min.css"/>
         <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
         
          <script>
         	function mysubmit()
         	{
         		if( document.getElementById("pic").files.length == 0 ){
         		    
         			alert("no files selected");
         		    return false;
         		}
         		else
         		{
         			var fup = document.getElementById('pic');
         	        var fileName = fup.value;
         			var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
         			if(!(ext =="jpg"))
         		    {
         				alert("Upload only jpg file");
         		        return false;
         		    }
         		}
         	}
         </script>
         
         
    </head>
    <body>       
    
    
    <%
session=request.getSession(false);
String username=(String)session.getAttribute("UNM");
if(username==null || username=="")
{
	response.sendRedirect("index.jsp");
}
%>
          
          <jsp:include page="menu.jsp"></jsp:include>
        
        
        
        
         <div class="container"> 
            <div class="row">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link active" href="./bookentry.jsp">Book</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="./laptopentry.jsp">Laptop</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="./projectentry.jsp">Project</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link disabled" href="./notesentry.jsp">Notes</a>
                    </li>
               </ul> 
            </div>  
             
            <div class="row">
        <form method="post" action="projectentry" enctype="multipart/form-data" name="frm" onsubmit="return mysubmit();">  
            
            <div class="panel panel-default">
                
				<div class="panel-heading">
		                     <h3 class="panel-title">Project Info</h3>
				</div>
               
				<div class="panel-body">                    
		                    <div class="row">
		                        <div class="col-sm-6 col-sm-push-3" >
					
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">Project Title</span>
								<input type="text" class="form-control" name="pname" placeholder="Project Title" aria-describedby="basic-addon1" required>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">Language</span>
								<input type="text" class="form-control" name="lang" placeholder="Programing Language" aria-describedby="basic-addon1" required>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">Database</span>
								<input type="text" class="form-control" name="db" placeholder="Database" aria-describedby="basic-addon1" required>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">Operating System</span>
								<input type="text" class="form-control" name="os" placeholder="Operating System" aria-describedby="basic-addon1" required>
							</div>
						</div>
						
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">Software</span>
								<input type="text" class="form-control" name="psoft" placeholder="Software" aria-describedby="basic-addon1" required>
							</div>
						</div>
								
						
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">Description</span>
								<textarea class="form-control" name="pdesc" rows="5" id="comment"aria-describedby="basic-addon1"></textarea>
							</div>
						</div>
						
						
					 
				</div>
					
				</div>	
				<div class="row">
		                        <div class="row">
						<div class="col-sm-6 col-sm-push-3 ">
		                                <input type="file" class="filestyle" data-buttonText="Find file" data-buttonName="btn-primary" name="pic" required>
		                                
		                                
						</div>
		                        </div>
				</div><br>
				<div class="row">
		                    <div class="col-sm-6 col-sm-push-4">
		                        
		
		                                <input type="submit" value="submit" class="btn btn-primary btn-lg"/>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;                               
		                                <input type="button" value="clear" onclick="this.form.reset()" class="btn btn-info btn-lg"/>
		                       
		                    </div>
		                </div>
					
				</div>
			</div>
           
      
        </form>  
      
   </div>          
            
           
        </div>
        
        
       <jsp:include page="footer.jsp"></jsp:include>
                 
           
    </body>
   
<script type="text/javascript" src="js/bootstrap-filestyle.js"> </script>
</html>
