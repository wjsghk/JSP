package smtp;


import java.util.Map;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;




public class NaverSMTP {
	private final Properties serverInfo;//서버정보
	private final Authenticator auth;//인증 정보 ,lib에서 가져온 객체
	
	public NaverSMTP() {
		//네이버 SMTP 서버 접속 정보
		serverInfo = new Properties();
		serverInfo.put("mail.smtp.host", "smtp.naver.com");
		serverInfo.put("mail.smtp.port","465");
		serverInfo.put("mail.smtp.starttls.enable","true");
		serverInfo.put("mail.smtp.auth","true");
		serverInfo.put("mail.smtp.debug","true");
		serverInfo.put("mail.smtp.socketFactory.port","465");
		serverInfo.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		serverInfo.put("mail.smtp.socketFactory.fallback","false");
		
		//사용자 인증 정보 <=auth
		auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("kkwe3208","wjsghk3934");
			}
		};
	}
	
	public void emailSending(Map<String,String>mailInfo)
	throws MessagingException{
		//세션 생성
		Session session= Session.getInstance(serverInfo,auth);
		session.setDebug(true);
		//메세지 작성
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(mailInfo.get("from")));
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(mailInfo.get("to")));
		msg.setSubject(mailInfo.get("subject"));
		msg.setContent(mailInfo.get("content"),mailInfo.get("format"));
		//전송
		Transport.send(msg);
	}
}
