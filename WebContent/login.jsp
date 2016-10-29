
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="css/bootstrap.min.css"/>
         <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
         <script type="text/javascript">  
			function validateform()
			{  
				var name=document.myform.uname.value;  
				var password=document.myform.pwd.value;  
				var re = new RegExp('^([0-9]{2})[a-z]{2}([0-9]{2})$','i');
				if (re.test(name)==false) 
				{
				   alert("Invalid user name it should be  as example 15ca61");
				   return false;
				   
				} 
				if(password.length<6){ 
					alert("Password must be at least 6 characters long.");  
						  return false;  
				}  
			}  
		</script>
         <title>Login</title>
    </head>
    <body>
    <jsp:include page="menu.jsp"></jsp:include>
    <br/>
    <br/>
    <br/>
    <div class="contailer">
    
    	<div class="row">
        		<div class="col-sm-6 col-sm-push-3">
        			<%  if(null!=request.getAttribute("Message"))
				    {%>
				       
				    <h4><font color="red"><%out.println(request.getAttribute("Message"));%></font></h4>
				     
				  <% }%>
        		</div>
        	</div>
            
    	<div class="row">
    		<div class="col-sm-4 col-sm-push-4">
    			<form action="login" onsubmit="return validateform()" method="get" name="myform">
    
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h1 class="panel-title">Login</h1>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    
                    <input type="text" class="form-control" name="uname"  aria-describedby="uname" placeholder="Enter your Reg No" required>
                    <span ></span>
                    <br>
                   
                        <input type="password" class="form-control" name="pwd" aria-describedby="pwd" placeholder="Enter your password" required>
                        <span ></span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span><a href="forgotpassword.jsp">Forgot password</a></span>
                    
                    <br>
                    
                    
                    <fieldset class="form-group">
                                        
                    <div class="form-check">
                            <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="role" id="option2" value="users" checked>
                            users
                            </label>
                    </div>    
                        
                        
                    <div class="form-check">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="role" id="option1" value="admin" >
                             admin
                         </label>
                    </div>
                          
                                             
                                         
                </fieldset>  
                    <input type="submit" class="btn btn-default" value="Login">
		</div>
                
                 
				
            </div>
        </div></form>
    		</div> <br/>
    		 
    	</div>
    </div>
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
