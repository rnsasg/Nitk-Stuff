
<html>
    <head>
        <title>Home Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body >
    	<jsp:include page="menu.jsp"></jsp:include>
        <div class="container-fluid">
         <div class="row">
        		<div class="col-sm-6 col-sm-push-3">
        			<%  if(null!=request.getAttribute("Message"))
				    {%>
				       
				    <h4><font color="red"><%out.println(request.getAttribute("Message"));%></font></h4>
				     
				  <% }%>
        		</div>
     		</div>
            
            <div class="row">
                <jsp:include page="carousel.jsp"></jsp:include>
            </div>
            <br>
             <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
