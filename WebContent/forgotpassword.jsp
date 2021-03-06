
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
        
        <style>
            #mydiv{
               margin:100px 0px 100px 0px;
            }
        </style>
    </head>
    <body>
        
        
        <div class="container-fluid">
               <jsp:include page="homemenu.jsp"></jsp:include>                
        </div>
       
        <div class="container-fluid">
        
         <div class="row">
        		<div class="col-sm-6 col-sm-push-3">
        			<%  if(null!=request.getAttribute("Message"))
				    {%>
				       
				    <h4><font color="red"><%out.println(request.getAttribute("Message"));%></font></h4>
				     
				  <% }%>
        		</div>
        	</div>
            
            <form  method="post" action="forgotpwd.jsp">
            <div class="row" id="mydiv">
                <div class="col-sm-3">
                    
                </div>
                <div class="col-sm-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h1 class="panel-title"> Forgot Password</h1>
                        </div>
                        <div class="panel-body">
                            <div class="form-group" >	
										<input type="text" name="uname" class="form-control"  placeholder="Enter User name" pattern="^([0-9]{2})[a-z]{2}([0-9]{2})$" title=" !! Invalid User id !!!" required ><br/>
                                        <input type="email" name="email" class="form-control"  placeholder="Enter Your Email Address" required><br/>
                                        <input type="text" name="mob" class="form-control"  placeholder="Enter Mob No" pattern="^([0-9]{10})$" title="Invalid Mobile No" required><br/>
                                        
                                        <input type="submit" class="btn btn-success" value="Submit">
                                        
                            </div> 	
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    
                </div>
            </div>
                
           </form>
        </div>
        <div class="container-fluid">
               <jsp:include page="footer.jsp"></jsp:include>                
        </div>
    </body>
    
</html>
