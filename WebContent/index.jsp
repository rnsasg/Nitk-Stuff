
<html>
    <head>
        <title>Home Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body{
                
            }
        </style>
    </head>
    <body >
        <div class="container-fluid">
            
            <div class="row">
                <jsp:include page="homemenu.jsp"></jsp:include>
                
            </div>
            
            <div class="row">
                <jsp:include page="carousel.jsp"></jsp:include>
            </div>
            <br>
            <div class="row">
                
                <div class="col-sm-4">
                    <jsp:include page="login.jsp"></jsp:include>
                </div>
                <div class="col-sm-8">
                    <jsp:include page="signup.jsp"></jsp:include>
                </div>
                
            </div>
            <div class="row">
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
