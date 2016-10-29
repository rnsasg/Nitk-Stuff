
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.util.Random"%>
<%@page import="narayan.GmailMail"%>

<% 
    
	String msg=null,user=null,email=null,otp=null,totp=null;
   
   if(request.getParameter("user")!=null)
   {
	   user=(String)request.getParameter("user");
	    
   }
   if(request.getParameter("msg")!=null)
   {
	   msg=(String)request.getParameter("msg");
   }
   if(request.getParameter("msg")!=null)
   {
	   email=(String)request.getParameter("email");
   }
   
   /* System.out.println("-----set password---");
    System.out.println(user);
    System.out.println(msg);
    System.out.println(email);
    System.out.println("-------------------");
    */
    
    if(request.getParameter("email")!=null)
    {   
	    Random randomno = new Random(); 
	    int num=randomno.nextInt(10000); 
	    otp="this is the OTP for your password reset :"+num;
	    totp=""+num;
    }
    else
    {    	
    	totp=(String)request.getAttribute("otp");
    }
%>


<%
if(request.getParameter("email")!=null)
{
  GmailMail gm=new GmailMail();
  String output=gm.msgSend(email,"OTP for Reset Your password",otp);  
  System.out.println(output);
}
%>





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
        <script type="text/javascript">
        function validateform()
     	{
     		
     		
     		var pwd=document.frm.set.value;
     		var cpwd=document.frm.confirm.value;
     		if(pwd!=cpwd)
     		{
     			alert("Password and confirm password should be same");
     			return false;
     		} 
     		if(pwd.length<6)
     		{
     			alert("Password length should atleast 6 character long");
     			return false;
     		} 
     	}
        </script>
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
            
            <form  method="post" action="resetpassword" onsubmit="return validateform();" name="frm">
            <div class="row" id="mydiv">
                <div class="col-sm-3">
                    
                </div>
                <div class="col-sm-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h1 class="panel-title"> Reset Password</h1>
                        </div>
                        <div class="panel-body">
                            <div class="form-group" >	
										<input type="text" name="set" class="form-control"  placeholder="Enter Password" required><br/>
                                        <input type="email" name="confirm" class="form-control"  placeholder="Reenter Password" required><br/>
                                        <input type="email" name="otp" class="form-control"  placeholder="Enter OTP" pattern="^([0-9]{1,5})$" title="Enter valid OTP" required><br/>
                                        <input type="hidden" name="user" value="<%= user %>"> 
                                        <input type="hidden" name="otp1" value="<%= totp %>">                                       
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