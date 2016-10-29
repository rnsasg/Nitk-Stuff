package store;

import java.io.IOException;

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
import javax.sql.PooledConnection;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import oracle.jdbc.pool.OracleConnectionPoolDataSource;


@WebServlet("/bookentry")
public class BookEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BookEntry() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		 String bname = null;
	        String btype=null;
	        String author=null;
	        String publication=null;
	        String lang=null;
	        String bdesc=null;
	        
	        String owner=null;
	        Date date = null;
	        FileItem flItem = null;
	        PreparedStatement pst = null;
	        Connection con = null;
	        
	        response.setContentType("text/html;charset=UTF-8");      
	      
	        
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
	                                
	                                if(fileItem.getFieldName().equals("bname"))
	                                {
	                                    bname = fileItem.getString();
	                                }
	                                if(fileItem.getFieldName().equals("btype"))
	                                {
	                                    btype=fileItem.getString();
	                                }
	                                if(fileItem.getFieldName().equals("author"))
	                                {
	                                    author=fileItem.getString();
	                                }
	                                if(fileItem.getFieldName().equals("bdesc"))
	                                {
	                                    bdesc=fileItem.getString();
	                                }
	                                if(fileItem.getFieldName().equals("publication"))
	                                {
	                                    publication=fileItem.getString();
	                                }
	                                if(fileItem.getFieldName().equals("lang"))
	                                {
	                                    lang=fileItem.getString();
	                                }
	                       
	                            } else {
	                                flItem = fileItem;
	                            }
	                    }
	               OracleConnectionPoolDataSource ds=new OracleConnectionPoolDataSource(); 
	               ds.setURL("jdbc:oracle:thin:@localhost:1521:xe");
	               ds.setUser("narayan");
	               ds.setPassword("sah");
	               PooledConnection pc=ds.getPooledConnection();
	               con=pc.getConnection();
	               Statement st=con.createStatement();
	               pst=con.prepareStatement("insert into book values(?,?,?,?,?,?,?,?,?,?,?)");
	               ResultSet rs=st.executeQuery("select * from book");
	                
	                int count=1;
	                while(rs.next())
	                    count++;
	            
	                    //System.out.println(count);
	                    pst.setInt(1,count);                   
	                    pst.setDate(2,date);
	                    pst.setString(3,"true");
	                    pst.setString(4,owner);
	                    pst.setString(5,bname);
	                    pst.setString(6,bdesc);
	                    pst.setBinaryStream(7, flItem.getInputStream(), (int) flItem.getSize());
	                    pst.setString(8,author);
	                    pst.setString(9,publication);                    
	                    pst.setString(10,lang);
	                    pst.setString(11,btype); 
	                    
	                int rows = pst.executeUpdate();
	                con.commit();
	                System.out.println(rows);
	                if (rows > 0) {
	                    
	                    request.setAttribute("Message", "Record save successfully");
	                    RequestDispatcher rd = request.getRequestDispatcher("book.jsp");
	                    rd.forward(request, response);
	                } 
	                
	            }
	               
	        }
	        catch (Exception ex)
	        {
	            System.out.println(ex.getMessage());
	            response.sendRedirect("bookentry.jsp");
                request.setAttribute("Message", "Record not saved");
                RequestDispatcher rd = request.getRequestDispatcher("book.jsp");
                rd.forward(request, response);         
	        }  
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
