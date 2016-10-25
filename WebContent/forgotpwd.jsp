

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <%
            String user=(String)request.getParameter("uname");
            String email=(String)request.getParameter("email");
            String mob=(String)request.getParameter("mob");
            String msg="";
            
            
            
            System.out.println("-----forgot pwd---");
            System.out.println(user);
            System.out.println(mob);
            System.out.println(email);
            System.out.println("-------------------");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
            PreparedStatement pst=con.prepareStatement("select email,mob_no from users where roll_no=?");
            pst.setString(1,user);
            ResultSet rs=pst.executeQuery();
            if(rs.next())
            {
                if(rs.getString(1).equals(email))
                {
                    if(rs.getString(2).equals(mob))
                    {
                        response.sendRedirect("./setpassword.jsp?user="+user+"&msg="+msg+"&email="+email);
                    }
                    else
                    {
                        msg="!!!!!! Mob no you enter is not registered !!!!";
                        System.out.println(msg);
                        response.sendRedirect("./forgotpassword.jsp?msg="+msg);
                    }
                }
                else
                {
                   msg="!!!!!! Email you is not registered on your acount !!!!"; 
                   response.sendRedirect("./forgotpassword.jsp?msg="+msg);
                   System.out.println(msg);
                }
                
            }
            else
            {
                msg="User id is invalid try again";
               System.out.println(msg);
                response.sendRedirect("./forgotpassword.jsp?msg="+msg);               
            }

        %>
