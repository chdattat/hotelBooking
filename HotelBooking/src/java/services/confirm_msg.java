package services;

import java.util.Date;
import java.util.Properties;
import javax.jws.WebService;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebService(endpointInterface = "services.Confirmation_Msg")

public class confirm_msg implements Confirmation_Msg
{
@Override
public String sendConfirm(String email1, String sub, String msg1)
{

String host = "smtp.gmail.com";
String from = "sahil_kullar@outlook.com";
String to = email1;
String subject = sub;
String messageText=msg1;

final String username = "sahilkullar";
final String password1 = "0172@chd";

Properties props = new Properties();
props.put("mail.smtp.host", host);
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.port", "465");
javax.mail.Session session1 = javax.mail.Session.getInstance(props,new javax.mail.Authenticator()
{
@Override
protected PasswordAuthentication getPasswordAuthentication() {
return new PasswordAuthentication(username, password1);
}
});
try
{

Message msg = new MimeMessage(session1);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address1 = { new InternetAddress(to) };
msg.setRecipients(Message.RecipientType.TO, address1);
msg.setSubject(subject);
msg.setSentDate(new Date());
msg.setContent(messageText, "text/html");
Transport.send(msg);
}
catch (MessagingException e)
{
    System.out.println(e);
}
return "mail gone";
    }
}

