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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;




@WebServlet("/laptopentry")
public class LaptopEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LaptopEntry() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		String lname = null;
        String cname=null;
        String pro=null;
        String hdd=null;
        String gcard=null;
        String ldesc=null;
        String os=null;
        String owner=null;
        Date date = null;
        FileItem flItem = null;
        PreparedStatement pst = null;
        Connection con = null;
        
        
      
        
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
                                
                                if(fileItem.getFieldName().equals("lname"))
                                {
                                    lname = fileItem.getString();
                                }
                                if(fileItem.getFieldName().equals("cname"))
                                {
                                    cname=fileItem.getString();
                                }
                                if(fileItem.getFieldName().equals("pro"))
                                {
                                    pro=fileItem.getString();
                                }
                                if(fileItem.getFieldName().equals("hdd"))
                                {
                                    hdd=fileItem.getString();
                                }
                                if(fileItem.getFieldName().equals("gcard"))
                                {
                                    gcard=fileItem.getString();
                                }
                                if(fileItem.getFieldName().equals("ldesc"))
                                {
                                    ldesc=fileItem.getString();
                                }
                                if(fileItem.getFieldName().equals("os"))
                                {
                                    os=fileItem.getString();
                                }
                       
                            } else {
                                flItem = fileItem;
                            }
                    }
                Class.forName("oracle.jdbc.driver.OracleDriver");  
                con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","narayan","sah");
                Statement st=con.createStatement();
                pst=con.prepareStatement("insert into laptop values(?,?,?,?,?,?,?,?,?,?,?,?)");
                ResultSet rs=st.executeQuery("select * from laptop");
                
                int count=1;
                while(rs.next())
                    count++;
                
                rs.close();
                
                    pst.setInt(1,count);                   
                    pst.setDate(2,date);
                    pst.setString(3,"true");
                    pst.setString(4,owner);
                    pst.setString(5,lname);
                    pst.setString(6,ldesc);
                    pst.setBinaryStream(7, flItem.getInputStream(), (int) flItem.getSize());
                    pst.setString(8,cname);
                    pst.setString(9,pro);
                    pst.setString(10,hdd); 
                    pst.setString(11,gcard);
                    pst.setString(12,os);   
                
                int rows = pst.executeUpdate();
                System.out.println(rows);
                if (rows > 0) {
                    
                    request.setAttribute("Message", "Record save successfully");
                    RequestDispatcher rd = request.getRequestDispatcher("laptop.jsp");
                    rd.forward(request, response);
                } 
                
            }
        } catch (Exception ex) {
            
        	request.setAttribute("Message", "Record not saved");
            RequestDispatcher rd = request.getRequestDispatcher("laptop.jsp");
            rd.forward(request, response);
        } 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
