
package narayan;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class GmailMail {    
    
    final String from="roushannarayansah@gmail.com";
    final String pwd="Rou&h@n0$@h";
        
    public String msgSend(String to,String sub,String msg)
    {
        String result=""; 
        //String host="smtp.gmail.com"; 
        
        System.out.println("-----Gmail class---");
        System.out.println(to);
        System.out.println(sub);
        System.out.println(msg);
        System.out.println("-------------------");
        
        Properties props = new Properties();  
        props.put("mail.smtp.host", "smtp.gmail.com");  
        props.put("mail.smtp.socketFactory.port", "465");  
        props.put("mail.smtp.socketFactory.class",  
            "javax.net.ssl.SSLSocketFactory");  
        props.put("mail.smtp.auth", "true");  
        props.put("mail.smtp.port", "465");  
       
       Session session = Session.getInstance(props,
       new javax.mail.Authenticator() {  
       @Override
       protected PasswordAuthentication getPasswordAuthentication() {  
        return new PasswordAuthentication(from,pwd);  
      }  
    });  
        
  try{  
        MimeMessage message = new MimeMessage(session);  
        message.setFrom(new InternetAddress(from));//change accordingly  
        message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));   
        message.setSubject(sub);  
        message.setText(msg);  

        Transport.send(message); 
        result="Message Sent Successfully";
        System.out.println("Successful");

     } catch (MessagingException e) {
         
         result="Message Sending Fail";
         e.printStackTrace();}   
        return result;
    }
}
