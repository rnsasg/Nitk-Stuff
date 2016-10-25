

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
        <style>  
        
                .carousel-inner > .item > img,  
                .carousel-inner > .item > a > img {  
                    width: 80%;  
                    margin: auto;  
                }   
        </style>
    </head>
    <body>
      <nav class="navbar navbar-static-top navbar-light navbar-default">
             
              <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-home"></span>&nbsp;Nitk Stuff</a>
                
              <ul class="nav navbar-nav">
                <li class="nav-item active">
                  <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                  
                <li class="nav-item dropdown">
                    
                  <a class="nav-link dropdown-toggle" drop-toggle="dropdown" role="button"  href="#" aria-haspopup="true" aria-expended="false">Category</a>
                    
                </li> 
                  
                <li class="nav-item">
                  <a class="nav-link" href="">Donate</a>
                </li>
                  
                <li class="nav-item">
                  <a class="nav-link" href="#">About</a>
                </li>
                  
                <li class="nav-item">
                  <a class="nav-link" href="#">Contact</a>
                </li>
                 <div role="" class="form-inline navbar-form  navbar-right">
                     
                        <div class="input-group ">
                            <input type="text" class="form-control" placeholder="Search Item" aria-describedby="basic">
                            <span class="input-group-addon" id="basic"><span class="glyphicon glyphicon-search"></span></span>
                        </div>
                     
                     
                  </div>
             </ul>
                
         </nav>
       <script src="js/jquery.min.js"></script> 
    <script src="js/bootstrap.min.js"></script>
     <script src="js/jquery-1.10.2.min.js"></script>
    </body>
</html>
