<%-- 
    Document   : login
    Created on : Oct 12, 2016, 3:44:45 AM
    Author     : Sah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="css/bootstrap.min.css"/>
         <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
         <script>
         
         document.getElementById("uname").onmouseleave = function() {checkuname()};
         document.getElementById("pwd").onmouseleave = function() {checkpwd()};
         
         function checkuname()
         {
        	 var uname=document.myform.uname.value;
        	 if(uname==null || uname=="")
        			alert("Username Can't be empty");
         }
         function checkpwd()
         {
        	 var upwd=document.myform.pwd.value;
        	 if(upwd==null || upwd=="")
        			alert("Password Can't be empty");
         }
         
         
         </script>
         <title>Login</title>
    </head>
    <body><form action="login" method="get" name="myform" onsubmit="return submitFunction()">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h1 class="panel-title">Login</h1>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    
                    <input type="text" class="form-control" name="uname"  aria-describedby="uname" placeholder="Enter your Reg No">
                    <span ></span>
                    <br>
                   
                        <input type="text" class="form-control" name="pwd" aria-describedby="pwd" placeholder="Enter your password">
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
                            <input type="radio" class="form-check-input" name="role" id="optionsRadios2" value="users" checked>
                            users
                            </label>
                    </div>    
                        
                        
                    <div class="form-check">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="role" id="optionsRadios1" value="admin" >
                             admin
                         </label>
                    </div>
                          
                                             
                                         
                </fieldset>  
                    <input type="submit" class="btn btn-default" value="Login">
		</div>
                
                 
				
            </div>
        </div></form>
    </body>
    <script src="js/jquery.min.js"></script> 
    <script src="js/bootstrap.min.js"></script>
     <script src="js/jquery-1.10.2.min.js"></script>
</html>
