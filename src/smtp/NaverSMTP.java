package smtp;

//import jakarta.mail.*;
//import jakarta.mail.internet.InternetAddress;
//import jakarta.mail.internet.MimeMessage;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Map;
import java.util.Properties;

// 네이버 SMTP 서버를 통해 이메일을 전송하는 클래스
public class NaverSMTP {
    private final Properties serverInfo;
    private final Authenticator auth;

    public NaverSMTP() {
        // 네이버 SMTP 서버 접속 정보
        this.serverInfo = new Properties();
        serverInfo.put("mail.smtp.host", "smtp.naver.com");
        serverInfo.put("mail.smtp.port", "465");
        serverInfo.put("mail.smtp.starttls.enable", "true");
        serverInfo.put("mail.smtp.auth", "true");
        serverInfo.put("mail.smtp.debug", "true");
        serverInfo.put("mail.smtp.socketFactory.port", "465");
        serverInfo.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        serverInfo.put("mail.smtp.socketFactory.fallback", "false");

        // 사용자 인증 정보
        this.auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EmailInfoToHide.email, EmailInfoToHide.password); // 네이버 아이디, 비밀번호
            }
        };
    }

    // 주어진 메일 내용을 네이버 SMTP 서버를 통해 전송
    public void emailSending(Map<String, String> mailInfo) throws MessagingException {
        // 1.세션 생성
        Session session = Session.getInstance(serverInfo, auth);
        session.setDebug(true);

        // 2.메시지 작성
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(mailInfo.get("from"))); // 보내는 사람
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(mailInfo.get("to"))); // 받는 사람
        msg.setSubject(mailInfo.get("subject")); // 제목
        msg.setContent(mailInfo.get("content"), mailInfo.get("format")); // 내용

        // 3.전송
        Transport.send(msg);
    }
}