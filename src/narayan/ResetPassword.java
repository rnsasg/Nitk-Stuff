package narayan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/resetpassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ResetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String user=(String)request.getParameter("user");
        String uotp=(String)request.getParameter("otp");
        String pwd=(String)request.getParameter("set");
        String cpwd=(String)request.getParameter("confirm");
        String otp=(String)request.getParameter("otp1");
        String msg=""+otp;
        
        System.out.println("---------Reset Password ---------------");
        System.out.println(user);
        System.out.println(otp);
        System.out.println(pwd);
        System.out.println(cpwd);
        if(pwd.equals(cpwd))
        {
        	if(otp.equals(uotp))
        	{
            try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
                
                Statement st=con.createStatement();
                System.out.println("Enter");
                int i=st.executeUpdate("update users set password='"+pwd+"' where roll_no='"+user+"'");
               
              
                con.commit();
                if(i==1)
                {
                	msg="Password Reset Successfully now you can login";
                	request.setAttribute("Message",msg);
                	RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }
                else
                {
                	msg="Password not reset try again";
                	request.setAttribute("Message",msg);
                	RequestDispatcher rd=request.getRequestDispatcher("setpassword.jsp");
                    rd.forward(request, response);
                }
            }
            catch(SQLException se){
            	
            	msg="Password Reset Failed";
            	request.setAttribute("Message",msg);
            	RequestDispatcher rd=request.getRequestDispatcher("setpassword.jsp");
                rd.forward(request, response);
             }catch(Exception e){
            	 msg="Password Reset Failed";
             	request.setAttribute("Message",msg);
             	RequestDispatcher rd=request.getRequestDispatcher("setpassword.jsp");
                 rd.forward(request, response);
                e.printStackTrace();
             }
        }
        else
        {
        	msg="You have entered wrong OTP";
        	request.setAttribute("Message",msg);
        	request.setAttribute("otp",otp);
        	RequestDispatcher rd=request.getRequestDispatcher("setpassword.jsp");
            rd.forward(request, response);
        }
        
       }
       else
       {
            msg="Password and Confirm Password is not same";
            request.setAttribute("Message",msg);
        	RequestDispatcher rd=request.getRequestDispatcher("setpassword.jsp");
            rd.forward(request, response);
       }
       
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
