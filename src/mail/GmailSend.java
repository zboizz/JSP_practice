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
			//������ ���̵� , ��й�ȣ
			//return new PasswordAuthentication("������ ���̵�", "*******");
			return new PasswordAuthentication("zboizz0122", "@qaz3515123");
		}
	}
	
	
	public static void send(String title, String content, String toEmail) {
		
		Properties p = new Properties();
		//p.put("mail.smtp.user", "�����ϰ���"); //���� ������
		p.put("mail.smtp.user", "zboizz0122@gmail.com"); //���� ������
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
			
			//Address fromAddr = new InternetAddress("�����Ͼ��̵�@gmail.com"); 
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
			send("�̸��� ������ ������", "������ 2019�� 11�� 29���̴�. ���Ϻ����� �������̴�. �� ���� ������ ���� ĭ�̴�.", "zboizz@naver.com");
			System.out.println("����~~~~");
		}
	}


