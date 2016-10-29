<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="css/bootstrap.min.css"/>
         <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
         <script>
         	
         </script>
    </head>
    <body>
        <div class="container-fluid">
               <jsp:include page="menu.jsp"></jsp:include>                
        </div>
        
        
       
        <form method="post" action="feedback">
         <div class="container">        
            
            <br>
            <div class="row">
            	 <%  if(null!=request.getAttribute("Message"))
				    {%>
				       
				     <h4><font color="#94BE67"><%out.println(request.getAttribute("Message"));%></font></h4>
				   <% }%>
            </div>
            <div class="row">
                
                <div class="container" >
		
		<div class="form-vertical" >
			<div class="form-group" ><h1>Feedback</h1>
				<div class="row">
					<div class="col-sm-2 col-lg-6">
						<label for="fname" >Name</label>
						<input type="text" name="fname" class="form-control"  placeholder="First name" pattern="^([a-zA-Z]{1,})(\s([a-zA-Z]{1,}))*" title="Invalid First Name" required>
					</div>
					<div class="col-sm-2 col-lg-6">
							<label for="lname" >Last</label>
							<input type="text" name="lname" class="form-control"  placeholder="Last name" placeholder="First name" pattern="^([a-zA-Z]{1,})(\s([a-zA-Z]{1,}))*" title="Invalid Last Name" required>
					</div>
				</div>
				
				<div class="form-group" >	
						<label for="email" >Email</label>
						<input type="email" name="email" class="form-control"  placeholder="Email" required>
				</div> 		
				<div class="form-group" >
						<label for="regno" >Registration Id</label>
						<input type="text" name="regno" class="form-control"  placeholder="Registration" placeholder="First name" pattern="^([0-9]{6})$" title=" !! Invalid Reg no no !!!" required>
				</div> 		
				<div class="form-group" >	
						<label for="comments" >Comments</label>
						<textarea class="form-control" name="comments" pattern="^[a-zA-Z0-9\s\n\.- _]$" title="Invalid Text(use alphanumeric and . _ - charracter )" required> </textarea>                       
				</div> 					 
				
			</div>
		
				<div class="col-sm-6 col-lg-4">
				<input type="submit" value="Submit" class="btn btn-success btn-lg">
				<input type="button" value="clear" onclick="this.form.reset()" class="btn btn-success btn-lg">
				</div>
		</div>
	</div>
            </div>
            <br>
           
        </div>
      </form> 
                <div class="container">
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
    </body>
   
</html>
