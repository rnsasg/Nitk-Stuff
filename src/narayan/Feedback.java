package narayan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import narayan.GmailMail;

@WebServlet("/feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Feedback() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String fname=(String)request.getParameter("fname");
		String lname=(String)request.getParameter("lname");
		String email=(String)request.getParameter("email");
		String regno=(String)request.getParameter("regno");
		String comments=(String)request.getParameter("comments");
		
		 long millis=System.currentTimeMillis();  
	     Date date=new java.sql.Date(millis);
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
			PreparedStatement pst=con.prepareStatement("insert into feedback values(?,?,?,?,?,?)");
			pst.setString(1,fname);
			pst.setString(2,lname);
			pst.setString(3,email);
			pst.setString(4,comments);
			pst.setDate(5,date);
			pst.setString(6,regno);
			pst.executeUpdate();
			System.out.println("Message Store Successfully");
			con.close();
			String sub="Feedback message from "+fname+" "+lname;
			String msg="Feedback message \n Name="+fname+" "+lname+"\n Email="+email+"\nRegno="+regno+"\n Comments="+comments;
			GmailMail gm=new GmailMail();
			gm.msgSend("rnsasg@gmail.com",sub, msg);
            request.setAttribute("Message", "Feedback submitted successfully");
            RequestDispatcher rd = request.getRequestDispatcher("feedback.jsp");
            rd.forward(request, response);
         
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			request.setAttribute("Message", "Feedback not submitted");
            RequestDispatcher rd = request.getRequestDispatcher("feedback.jsp");
            rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
