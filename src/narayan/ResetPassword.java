package narayan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.SQLException;
import java.sql.Statement;

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
        String otp=(String)request.getParameter("otp");
        String pwd=(String)request.getParameter("set");
        String cpwd=(String)request.getParameter("confirm");
        String msg=""+otp;
        
        System.out.println("---------Reset Password ---------------");
        System.out.println(user);
        System.out.println(otp);
        System.out.println(pwd);
        System.out.println(cpwd);
        if(pwd.equals(cpwd))
        {
            try{
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
                /*PreparedStatement pst=con.prepareStatement("update users set password=? where roll_no=?");
                pst.setString(1,pwd);
                pst.setString(2,user);*/
                
                Statement st=con.createStatement();
                System.out.println("Enter");
                int i=st.executeUpdate("update users set password='"+pwd+"' where roll_no='"+user+"'");
               
               
                
                System.out.println("Out");
                con.commit();
                if(i==1)
                {
                	System.out.println("Password Reset Successfully");
                    response.sendRedirect("index.jsp");
                }
                else
                {
                	
                	System.out.println("Password Reset Failed");
                   //response.sendRedirect("setpassword.jsp?user="+user+"&msg="+msg);
                }
            }
            catch(SQLException se){
            	System.out.println("Password Reset Failed");
                //response.sendRedirect("index.jsp");
                //Handle errors for JDBC
                se.printStackTrace();
             }catch(Exception e){
                //Handle errors for Class.forName
                e.printStackTrace();
             }
        }
        else
        {
            msg="Password and Confirm Password is not same";
            System.out.println(msg);
            response.sendRedirect("setpassword.jsp?user="+user+"&msg="+msg);
        }
       
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
