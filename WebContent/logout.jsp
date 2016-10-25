<%   
{
   session.removeAttribute("UNM");
    session.invalidate();
  response.sendRedirect("index.jsp?logouts=Sussessfull logout !!!");
}     

%>