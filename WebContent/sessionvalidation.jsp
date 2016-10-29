<%
session=request.getSession(false);
String user=(String)session.getAttribute("UNM");
out.println(user);
if(user==null || user=="")
{
	response.sendRedirect("index.jsp");
}

%>