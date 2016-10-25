<%-- 
    Document   : signup
    Created on : Oct 12, 2016, 3:58:23 AM
    Author     : Sah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="css/bootstrap.min.css"/>
         <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
    </head>
    <body>
        <form name="signup" action="signup" method="get">
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
                                    <input type="text" class="form-control" name="name"  aria-describedby="name">
                                </div><br>
                                <div class="input-group">
                                    <span class="input-group-addon" id="uname">Email</span>
                                    <input type="text" class="form-control" name="email"  aria-describedby="email">
                                </div><br>
                                <div class="input-group">
                                    <span class="input-group-addon" id="uname">Block</span>
                                    <input type="text" class="form-control" name="block"  aria-describedby="block">
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
                                    <input type="text" class="form-control" name="rollno"  aria-describedby="rollno">
                                </div><br>
                                 <div class="input-group">
                                    <span class="input-group-addon" id="uname">Mob NO</span>
                                    <input type="text" class="form-control" name="mobno"  aria-describedby="mobno">
                                </div><br>
                                 <div class="input-group">
                                    <span class="input-group-addon" id="uname">Room No</span>
                                    <input type="text" class="form-control" name="roomno"  aria-describedby="roomno">
                                 </div><br>
                                  <div class="input-group">
                                    <span class="input-group-addon" id="uname">Password</span>
                                    <input type="password" class="form-control" name="password"  aria-describedby="roomno">
                                 </div><br>
                                 <button class="btn btn-default">SignUp</button>
                        </div>
                    </div>
                    </div>
                        
		</div>
				
            </div>
       </form>
    </body>
     <script src="js/jquery.min.js"></script> 
    <script src="js/bootstrap.min.js"></script>
     <script src="js/jquery-1.10.2.min.js"></script>
</html>
