package store;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
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


@WebServlet("/noteentry")
public class NoteEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public NoteEntry() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		
		
		String nname = null;
        String sname=null;
        String sem=null;
        String fname=null;
        String desc=null;
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
                            if (fileItem.isFormField())
                            {
                                
                                if(fileItem.getFieldName().equals("nname"))
                                {
                                    nname = fileItem.getString();
                                }
                                if(fileItem.getFieldName().equals("sname"))
                                {
                                    sname=fileItem.getString();
                                }
                                if(fileItem.getFieldName().equals("fname"))
                                {
                                    fname=fileItem.getString();
                                }
                                if(fileItem.getFieldName().equals("sem"))
                                {
                                    sem=fileItem.getString();
                                }
                                if(fileItem.getFieldName().equals("bdesc"))
                                {
                                    desc=fileItem.getString();
                                }
                       
                            }
                            else {
                                flItem = fileItem;
                            }
                    }
                    
                System.out.println(nname);
                System.out.println(sname);
                System.out.println(fname);
                System.out.println(sem);
                System.out.println(desc);
                
                
                Class.forName("oracle.jdbc.driver.OracleDriver");  
                con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
                Statement st=con.createStatement();
                pst=con.prepareStatement("insert into notes values(?,?,?,?,?,?,?,?,?,?)");
                ResultSet rs=st.executeQuery("select * from notes");
                
                int count=1;
                while(rs.next())
                    count++;
                rs.close();
                
                    pst.setInt(1,count);                   
                    pst.setDate(2,date);
                    pst.setString(3,"true");
                    pst.setString(4,owner);
                    pst.setString(5,nname);
                    pst.setString(6,desc);
                    pst.setBinaryStream(7, flItem.getInputStream(), (int) flItem.getSize());
                    pst.setString(8,sname);
                    pst.setString(9,sem);
                    pst.setString(10,fname); 
                    
                int rows = pst.executeUpdate();
                con.commit();
                System.out.println(rows);
                if (rows > 0) {
                    
                    request.setAttribute("Message", "Record save successfully");
                    RequestDispatcher rd = request.getRequestDispatcher("notes.jsp");
                    rd.forward(request, response);
                } 
                
            }
        } catch (Exception ex) {
        	
             System.out.println(ex.getMessage());
             request.setAttribute("Message", "Record noted saved");
             RequestDispatcher rd = request.getRequestDispatcher("notes.jsp");
             rd.forward(request, response);
            
        } finally {
            
            try {
                con.close();
                pst.close();
                out.close();
                
            } catch (Exception ex) {
                
                System.out.println(ex.getMessage());
            }
        }
     
     
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
