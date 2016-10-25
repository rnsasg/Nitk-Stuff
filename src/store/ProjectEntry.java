package store;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Iterator;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/projectentry")
public class ProjectEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProjectEntry() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		String pname = null;
        String lang=null;
        String db=null;
        String os=null;
        String psoft=null;
        String pdesc=null;
        String owner=null;
        Date date = null;
        FileItem flItem = null;
        PreparedStatement pst = null;
        Connection con = null;
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
      
        
        HttpSession session=request.getSession();
        owner=(String)session.getAttribute("UNM");
        
        long millis=System.currentTimeMillis();  
        date=new java.sql.Date(millis);
        
        try {
               

                boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
                if (isMultiPart) {
                    
                    FileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    List<FileItem> items = upload.parseRequest(request);
                    Iterator<FileItem> iter = items.iterator();
                    
                    while (iter.hasNext()) {
                            FileItem fileItem = iter.next();
                         if (fileItem.isFormField()) {
                                
                                if(fileItem.getFieldName().equals("pname"))
                                {
                                    pname = fileItem.getString();
                                }
                                if(fileItem.getFieldName().equals("lang"))
                                {
                                    lang=fileItem.getString();
                                }
                                if(fileItem.getFieldName().equals("db"))
                                {
                                    db=fileItem.getString();
                                }
                                if(fileItem.getFieldName().equals("os"))
                                {
                                    os=fileItem.getString();
                                }
                                if(fileItem.getFieldName().equals("psoft"))
                                {
                                    psoft=fileItem.getString();
                                }
                                if(fileItem.getFieldName().equals("pdesc"))
                                {
                                    pdesc=fileItem.getString();
                                }
                       
                            } 
                            else 
                            {
                                
                                flItem = fileItem;
                            }
                    }
                    
                Class.forName("oracle.jdbc.driver.OracleDriver");  
                con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
                Statement st=con.createStatement();
                pst=con.prepareStatement("insert into project values(?,?,?,?,?,?,?,?,?,?,?)");
                ResultSet rs=st.executeQuery("select * from project");
                
                int count=1;
                while(rs.next())
                    count++;
                rs.close(); 
                
                
                System.out.println(pname);
                System.out.println(lang);
                System.out.println(db);
                System.out.println(os);
                System.out.println(pdesc);
                System.out.println(psoft);
                
                
               
                
                    pst.setInt(1,count);                   
                    pst.setDate(2,date);
                    pst.setString(3,"true");
                    pst.setString(4,owner);
                    pst.setString(5,pname);
                    pst.setString(6,pdesc);
                    pst.setBinaryStream(7, flItem.getInputStream(), (int) flItem.getSize());
                    pst.setString(8,lang);
                    pst.setString(9,db);
                    pst.setString(10,psoft); 
                    pst.setString(11,os);   
           
                int rows = pst.executeUpdate();
                
                System.out.println(rows);
                if (rows > 0) {
                    response.sendRedirect("projectentry.jsp");
                } 
                
            }
        } catch (Exception ex) {
            System.out.println("Error");
            System.out.println(ex.getMessage());
            //response.sendRedirect("./projectentry.jsp");
            
        } finally {
            
            try {
                System.out.println("Error3"); 
                con.close();
                pst.close();
                out.close();
                
            } catch (Exception ex) {
                System.out.println("Error2"); 
                System.out.println(ex.getMessage());
            }
        }
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				doGet(request, response);
	}

}
