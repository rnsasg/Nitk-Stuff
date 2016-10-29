package model;
import java.io.IOException;
import java.sql.*;


public class Users {
	
	public static String user_name;
	public static String id;
	private String country;
	private String name;
	private String sex;
	private String password;
	private String email;

	
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getConnection() throws IOException {
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "housekeeping", "");
		//	Statement st = con.createStatement();
			System.out.println("db connection established");

			System.out.println("Debug02 >> got user");
			System.out.println("debug email and pass" + email + " " + password);
			// int
			
			String query = "select * from register where email=? and password=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			//System.out.println(email);
			//System.out.println(password);
			ResultSet s = pst.executeQuery();
			//s.next();
		    //System.out.println(s.getString("name"));
			//System.out.println("debug03-->" + s);
			if (s.next()) {

				//s.next();
				System.out.println("debug04--> inside if");
				System.out.println(s.getString("name"));
				System.out.println("debug-6 visitor id set" + getEmail());
				//set(s.getInt("visitorid"));
				System.out.println("debug05-->" + getEmail());
				
				email = getEmail();
				user_name=s.getString("name");
				id=email;
				System.out.println("debug email and password" + email + " " + password);
				System.out.println("valid user");
				return ("index.jsp");
			} else
				return ("Error");
			
		} catch (Exception e) {
			System.out.println("debug06-->" + e);
			return ("Error");
		}

	}

	public String validate() {
		String message = "";
		String mail[]=new String[1];
		//int no = 0;
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");

			Connection con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "music", "music");
			//Statement st = con.createStatement();
			String query ="insert into users values(?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, name);
			pst.setString(2, sex);
			pst.setString(3, email);
			pst.setString(4, password);
			pst.setString(5, country);
			
			int insert = pst.executeUpdate();
			System.out.println(insert);
			con.commit();
			mail[0]=email;
			String confirmationmail="Thanks for Registering as a member of Music Hub."+"\n"+"Your Email is: "+email+"\n"+"Your Password is: "+password;
		
			if(Mail.sendMail("musichub00@gmail.com","musichub12", "smtp.gmail.com", "465", "true","true", true,"javax.net.ssl.SSLSocketFactory","false", mail, "Music Hub Registration", confirmationmail))
			{ 
				System.out.println("inside if-mail sent");
			}
			 else{
				
				 System.out.println("inside else-could not send mail");
				
			}

			message = "you are now registered";
			return message;

		} catch (Exception e) {
			System.out.println("debug06-->" + e);
			message = "User already exists";
			return message;
		}
	}

	public boolean checkEmail(String email) {
		int len = email.length();
		boolean value = false;

		if (len <= 6) {
			value = false;
			return value;
		}

		for (int i = 0; i < len; i++) {
			System.out.println(value + "Inside for");
			if (email.charAt(i) == '@') {
				System.out.println(value + "Inside if 1");
				value = true;
				break;
			}
		}

		if (value) {
			if ((email.charAt(len - 4)) == '.') {
				System.out.println(value + "Inside if");
				value = true;
			} else {
				System.out.println(value + "Inside else");
				value = false;
			}
		}

		return value;
	}

}
