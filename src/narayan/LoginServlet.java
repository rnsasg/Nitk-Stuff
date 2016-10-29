package narayan;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;



@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		response.setContentType("text/html;charset=UTF-8");
		String uname=(String)request.getParameter("uname");
        String pwd=(String)request.getParameter("pwd");
        String role=(String)request.getParameter("role");
        
        
       try{   
           	ResultSet rs; 
            Class.forName("oracle.jdbc.driver.OracleDriver");  
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
            System.out.println(role);
            if(role.equals("users"))
            {
                  PreparedStatement pst=con.prepareStatement("select * from users where roll_no=? and password=?");
                  pst.setString(1,uname);
                  pst.setString(2,pwd);
                  rs = pst.executeQuery();
                  if(rs.next()){
                                    
                                    HttpSession session = request.getSession();
                                    session.setAttribute("UNM", uname);
                                    session.setAttribute("ROLE", role);
                                    rs.close();
                                    pst.close();
                                    con.close();
                                    RequestDispatcher rd=request.getRequestDispatcher("home.jsp");  
                                    rd.forward(request, response);
                               }
                  else
                  {
                      con.close();
                      request.setAttribute("Message", "Users id or password not exist");
                      RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                      rd.forward(request, response);
                  }

            } 
            else
            {
                 PreparedStatement pst=con.prepareStatement("select * from admin where username=? and password=?");
                 pst.setString(1,uname);
                 pst.setString(2,pwd);
                 rs = pst.executeQuery();
                  if(rs.next()){
                                    
                                    HttpSession session = request.getSession();
                                    session.setAttribute("UNM", uname);
                                    session.setAttribute("ROLE", role);
                                    rs.close();
                                    pst.close();
                                    con.close();
                                   // response.sendRedirect("home.jsp");
                                    RequestDispatcher rd=request.getRequestDispatcher("home.jsp");  
                                    rd.forward(request, response);
                               }
                  else
                  {
                      con.close();
                      request.setAttribute("Message", "Admin id or password not exist ");
                      RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                      rd.forward(request, response);
                  }

            }
            }catch(Exception e){
            	
               e.printStackTrace();
               request.setAttribute("Message", "Exception in login");
               RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
               rd.forward(request, response);
            }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
