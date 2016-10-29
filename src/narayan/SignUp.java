package narayan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/signup")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SignUp() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try{ 
			String name=request.getParameter("name");
	        String email=request.getParameter("email");
	        String block=request.getParameter("block");
	        String roomno=request.getParameter("roomno");
	        String mobno=request.getParameter("mobno");
	        String rollno=request.getParameter("rollno");
	        String password=request.getParameter("password");
	        String gender=request.getParameter("gender");
        
        
         
            Class.forName("oracle.jdbc.driver.OracleDriver");  
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
            PreparedStatement pst=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?)");
            pst.setString(1,name);
            pst.setString(2,rollno);
            pst.setString(3,email);
            pst.setString(4,mobno);
            pst.setString(5,block);
            pst.setString(6,roomno);
            pst.setString(7,password);
            pst.setString(8,gender);
            
            long millis=System.currentTimeMillis();  
            java.sql.Date date=new java.sql.Date(millis);           
            
            pst.setDate(9,date);
            pst.executeUpdate();
            request.setAttribute("Message", "Singup Successful now login");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
            con.close();
            pst.close();
            
               
          }catch(Exception e){
             e.printStackTrace();
             request.setAttribute("Message", "Singup Failed");
             RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
             rd.forward(request, response);
          }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
