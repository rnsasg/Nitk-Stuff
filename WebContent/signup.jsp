

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="css/bootstrap.min.css"/>
         <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
         
         <script>
         	function validateform()
         	{
         		
         		
         		var pwd=document.signup.password.value;
         		var cpwd=document.signup.cpassword.value;
         		if(pwd!=cpwd)
         		{
         			alert("Password and confirm password should be same");
         			return false;
         		} 
         		if(pwd.length<=6)
         		{
         			alert("Password length should atleast 6 character long");
         			return false;
         		} 
         	}
         	
         </script>
    </head>
    <body>
    
    
    
    <jsp:include page="menu.jsp"></jsp:include>
    <br/>
    <br/>
    <br/>
    
    <%  if(null!=request.getAttribute("Message"))
	 {%>
	  <center> <h4><font color="#006699"><%out.println(request.getAttribute("Message"));%></font></h4></center>
	<% }%>
	
    <form name="signup" action="signup" method="get" onsubmit="return validateform()" name="signup">
    
    <div class="contailer">
    	<div class="row">
    		<div class="col-sm-10 col-sm-push-1">
    			
       <div class="panel panel-info">
            <div class="panel-heading">
                <h1 class="panel-title">Sign Up</h1>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-6">
                            
                                <div class="input-group">
                                    <span class="input-group-addon" id="uname">Name</span>
                                    <input type="text" class="form-control" name="name"  aria-describedby="name" pattern="^([a-zA-Z]{1,})(\s([a-zA-Z]{1,}))*$" title="only alphbates and space is required (use only one space between two word) " required>
                                </div><br>
                                
                                <div class="input-group">
                                    <span class="input-group-addon" id="email">Email</span>
                                    <input type="email" class="form-control" name="email"  aria-describedby="email" required>
                                </div><br>
                                
                                <div class="input-group">
                                    <span class="input-group-addon" id="block">Block</span>
                                    <input type="text" class="form-control" name="block"  aria-describedby="block"  required>
                                </div>
                                <br>
                                
                                  <div class="input-group">
                                    <span class="input-group-addon" id="uname">Password</span>
                                    <input type="password" class="form-control" name="password"  aria-describedby="roomno" required>
                                 </div>
                                
                                <br>
                                <fieldset class="form-group">
                                        
                                         
                                          <div class="form-check">
                                            <label class="form-check-label">
                                              <input type="radio" class="form-check-input" name="gender" id="optionsRadios1" value="male" checked>
                                              Male
                                            </label>
                                          </div>
                                         
                                          <div class="form-check">
                                          <label class="form-check-label">
                                              <input type="radio" class="form-check-input" name="gender" id="optionsRadios2" value="female">
                                              Female
                                          </label>
                                          </div>
                                         
                                </fieldset>   
                             </div>
                           
                        
                        <div class="col-sm-6">
                            
                                <div class="input-group">
                                    <span class="input-group-addon" id="uname">Roll No</span>
                                    <input type="text" class="form-control" name="rollno"  aria-describedby="rollno" pattern="^([0-9]{2})[a-z]{2}([0-9]{2})$" title=" !! Invalid Roll no !!!" required>
                                </div><br>
                                 <div class="input-group">
                                    <span class="input-group-addon" id="uname">Mob NO</span>
                                    <input type="text" class="form-control" name="mobno"  aria-describedby="mobno" pattern="^([0-9]{10})$" title="Invalid Mobile No" required>
                                </div><br>
                                 <div class="input-group">
                                    <span class="input-group-addon" id="uname">Room No</span>
                                    <input type="text" class="form-control" name="roomno"  aria-describedby="roomno" pattern="^([0-9]{1,3})$" title="Invalid Room No" required>
                                 </div><br>
                                  <div class="input-group">
                                    <span class="input-group-addon" id="uname">Confirm Password</span>
                                    <input type="password" class="form-control" name="cpassword"  aria-describedby="roomno" pattern="^([A-Za-z0-9]{1,})(\s([a-zA-Z]{1,4}))*$" title="Invalid Block Name" required>
                                 </div><br>
                                 <input type="submit" class="btn btn-default" value="SignUp">
                        		</div>
                    	</div>
                    	
                    </div>
                        
		</div>
				
            </div>
            
            </div> <br/>
    		 
    	</div>
    </div>
       </form>
    		
    <br/>
     <br/> <br/> 
     <br/>
      <br/>
      <jsp:include page="footer.jsp"></jsp:include>
        
    </body>
     <script src="js/jquery.min.js"></script> 
    <script src="js/bootstrap.min.js"></script>
     <script src="js/jquery-1.10.2.min.js"></script>
</html>
