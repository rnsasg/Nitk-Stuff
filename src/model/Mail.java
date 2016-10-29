package model;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail
{
         public String  d_email,
            d_password,
            d_host = "smtp.gmail.com",
            d_port  = "465",
            m_subject = "Allahabad Museum News Letter",
            m_text;
   
 
        public synchronized static boolean sendMail(String userName,String passWord,String host,String port,String starttls,String auth,boolean debug,String socketFactoryClass,String fallback,String[] to,String subject,String text){
                Properties props = new Properties();
                //Properties props=System.getProperties();
        props.put("mail.smtp.user", userName);
        props.put("mail.smtp.host", host);
                if(!"".equals(port))
        props.put("mail.smtp.port", port);
                if(!"".equals(starttls))
        props.put("mail.smtp.starttls.enable",starttls);
        props.put("mail.smtp.auth", auth);
                if(debug){
                props.put("mail.smtp.debug", "true");
                }else{
                props.put("mail.smtp.debug", "false");         
                }
                if(!"".equals(port))
        props.put("mail.smtp.socketFactory.port", port);
                if(!"".equals(socketFactoryClass))
        props.put("mail.smtp.socketFactory.class",socketFactoryClass);
                if(!"".equals(fallback))
        props.put("mail.smtp.socketFactory.fallback", fallback);
 
        try
        {
            //Session session = Session.getDefaultInstance(props, null);
	   Session session = Session.getInstance(props, new GMailAuthenticator(userName, passWord));
            session.setDebug(debug);
            MimeMessage msg = new MimeMessage(session);
            msg.setText(text);
            msg.setSubject(subject);
            msg.setFrom(new InternetAddress("p_sambasivarao@sutyam.com"));
                        for(int i=0;i<to.length;i++){
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to[i]));
                        }
            msg.saveChanges();
                        Transport transport = session.getTransport("smtp");
                        transport.connect(host, userName, passWord);
                        transport.sendMessage(msg, msg.getAllRecipients());
                        transport.close();
                        return true;
        }
        catch (Exception mex)
        {
        	System.out.println("Inside catch of Mail"+mex);
            mex.printStackTrace();
                        return false;
        }
        }
 
}
 
