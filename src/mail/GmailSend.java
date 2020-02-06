package mail;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class GmailSend {
	
	private static class SMTPAuthenticator extends Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			//지메일 아이디 , 비밀번호
			//return new PasswordAuthentication("지메일 아이디", "*******");
			return new PasswordAuthentication("zboizz0122", "@qaz3515123");
		}
	}
	
	
	public static void send(String title, String content, String toEmail) {
		
		Properties p = new Properties();
		//p.put("mail.smtp.user", "지메일계정"); //본인 지메일
		p.put("mail.smtp.user", "zboizz0122@gmail.com"); //본인 지메일
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");

		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getInstance(p, auth);
			session.setDebug(true); 

			MimeMessage msg = new MimeMessage(session);
			String message = content;
			msg.setSubject(title);
			
			//Address fromAddr = new InternetAddress("지메일아이디@gmail.com"); 
			Address fromAddr = new InternetAddress("zboizz0122@gmail.com"); 
			msg.setFrom(fromAddr);
			
			Address toAddr = new InternetAddress(toEmail); 
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(message, "text/plain;charset=KSC5601");
			
			Transport.send(msg);
			
		} catch (Exception e) { 
			e.printStackTrace();
		}
	}
		public static void main(String[] args) {
			send("이메일 보내기 연습중", "오늘은 2019년 11월 29일이다. 메일보내기 수업중이다. 이 곳은 내용을 적는 칸이다.", "zboizz@naver.com");
			System.out.println("성공~~~~");
		}
	}


