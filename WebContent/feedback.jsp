<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="css/bootstrap.min.css"/>
         <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
    </head>
    <body>
        <div class="container-fluid">
               <jsp:include page="menu.jsp"></jsp:include>                
        </div>
        <form method="get" action="laptopentry">
         <div class="container">
            
            
            <br>
            <div class="row">
                
                <div class="container" >
		
		<div class="form-vertical" role=form>
			<div class="form-group" ><h1>Feedback</h1>
				<div class="row">
					<div class="col-sm-2 col-lg-6">
						<label for="t1" >Name</label>
						<input type="text" name="t1" class="form-control"  placeholder="First name"/>
					</div>
					<div class="col-sm-2 col-lg-6">
							<label for="t2" >Last</label>
							<input type="text" name="t2" class="form-control"  placeholder="Last name"/>
					</div>
				</div>
				
				<div class="form-group" >	
						<label for="t3" >Email</label>
						<input type="email" name="t3" class="form-control"  placeholder="Email"/>
				</div> 		
				<div class="form-group" >
						<label for="t4" >Registration Id</label>
						<input type="text" name="t4" class="form-control"  placeholder="Registration"/>
				</div> 		
				<div class="form-group" >	
						<label for="t5" >Comments</label>
						<textarea class="form-control" placeholer="Message" name="t5">
                                     </textarea>
				</div> 					 
				
			</div>
		
				<div class="col-sm-6 col-lg-4">
				<a href="#" class="btn btn-success btn-lg" role="button">Submit </a>
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
   <script src="js/jquery-3.1.1.min.js"></script>
<script src="js/jquery.min.js"></script>    
<script src="js/bootstrap.min.js"></script> 
<script type="text/javascript" src="js/bootstrap-filestyle.js"> </script>
</html>
