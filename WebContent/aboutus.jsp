<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  
<html lang="en">  
  <head>  
     <title>About us </title>  
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/> 
		<style>
			.panel-body p{ 
		font-size: 50%;    
		 font-style: italic;  
		 font-family: sans-serif; 
			}
		</style>
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
  </head>  
  <body >
  
     <jsp:include page="menu.jsp"></jsp:include>                
  
        
  <font size="3" style="Italic">  
  
	<div class="container-fluid">  
   
  
<div class="panel panel-primary">  
  <div class="panel-heading">  
    <h3 class="panel-title"></h3>  
  </div>  
  <div class="thumbnail"> 
  <img src = "img/aboutus.jpg" width = "1000" height ="242"> 
  <div class="caption">
    <p>The name of the project is nitk stuff. It is not possible for every student to buy each and every thing which is required in student life. It is a website for nitk students where they can find and get the student related stuff. On the website a student will request for a stuff which can be approved by the administrator. After the approval of request admin will  provide information of other student who have that stuff as non-usable thing. </p>
	
	<p>This Web application will add stuffs of those students who want to donate their non-usable things. These stuff will appear on the GUI of the application. Any student who required one of these things can send a request to admin to get the thing. The admin will approve the request and send the information of the student who is donating the stuff. </p>
</div>
  </div>  
    
</div>  
  
</div>  
  </font>

               <jsp:include page="footer.jsp"></jsp:include>                

        
  </body>  
</html>  