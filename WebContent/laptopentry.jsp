<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="css/bootstrap.min.css"/>
         <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
    </head>
    <body>
       
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
             <form method="post" action="laptopentry" enctype="multipart/form-data">
                 
           <div class="panel panel-default">
               
		<div class="panel-heading">
                    <h3 class="panel-title">Laptop Info</h3>
		</div>
               
		<div class="panel-body">
                    <div class="row">
                        <div class="col-sm-6 col-sm-push-3" >
			
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">Laptop Name</span>
						<input type="text" class="form-control" name="lname" placeholder="Laptop Name" aria-describedby="basic-addon1">
					</div>
				</div>
				
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">Company Name</span>
						<input type="text" class="form-control" name="cname" placeholder="Company Name" aria-describedby="basic-addon1">
					</div>
				</div>
				
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">Processor</span>
						<input type="text" class="form-control" name="pro" placeholder="Processor name" aria-describedby="basic-addon1">
					</div>
				</div>
				
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">Hard Disk</span>
						<input type="text" class="form-control" name="hdd" placeholder="Hard Disk" aria-describedby="basic-addon1">
					</div>
				</div>
                                
                                <div class="form-group">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">Operating System</span>
						<input type="text" class="form-control" name="os" placeholder="Operating System" aria-describedby="basic-addon1">
					</div>
				</div>
				
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">Graphics Card</span>
						<input type="text" class="form-control" name="gcard" placeholder="Graphics Card" aria-describedby="basic-addon1">
					</div>
				</div>
						
				
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">Description</span>
						<textarea class="form-control" name="ldesc" rows="5" id="comment" aria-describedby="basic-addon1"></textarea>
					</div>
				</div>
				
				
			 
		</div>
			
		</div>	
		<div class="row">
				<div class="col-sm-6 col-sm-push-3 ">
                                    <input type="file" class="filestyle" data-buttonText="Find file" data-buttonName="btn-primary" name="pic">
				</div>
		</div><br>
		<div class="row">
                    <div class="col-sm-6 col-sm-push-4">
                      

                                <input type="submit" value="submit" class="btn btn-primary btn-lg"> &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                <input type="submit" value="clear" class="btn btn-info btn-lg">
                 
                    </div>
                </div>
			
		</div>
	</div>
           
       </form>
            
   </div>          
            
            
        </div>
        
        
                <jsp:include page="footer.jsp"></jsp:include>
       
      
 <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="js/jquery.min.js"></script>    
<script src="js/bootstrap.min.js"></script> 
<script type="text/javascript" src="js/bootstrap-filestyle.js"> </script>
    </body>
   
</html>
