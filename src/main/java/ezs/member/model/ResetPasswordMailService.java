package ezs.member.model;

//寄出成功 待放上email密碼

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class ResetPasswordMailService {
	// 設定傳送郵件:至收信人的Email信箱,Email主旨,Email內容
		public void sendMail(String to, String subject, String messageText) {

			try {
				// 設定使用SSL連線至 Gmail smtp Server
				Properties props = new Properties();
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.socketFactory.port", "465");
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.port", "465");

				// ●設定 gmail 的帳號 & 密碼 (將藉由你的Gmail來傳送Email)
				// ●須將myGmail的【安全性較低的應用程式存取權】打開
				final String myGmail = "dodohello71@gmail.com";
				final String myGmail_password = "uiopjkl0000";
				Session session = Session.getInstance(props, new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(myGmail, myGmail_password);
					}
				});

				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress(myGmail));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

				// 設定信中的主旨
				message.setSubject(subject);
				// 設定信中的內容
				message.setText(messageText);

				
				Transport.send(message);
				System.out.println("會員忘記密碼驗證信傳送成功!");
			} catch (MessagingException e) {
				System.out.println("會員忘記密碼驗證信傳送失敗!");
				e.printStackTrace();
			}
		}

//		public static void main(String args[]) {
//
//			String to = "rr965234@gmail.com";
//
//			String subject = "密碼重新設定通知";
//
//			String ch_name = "客戶";
//
//			String link = req.getContextPath()+
//					"/member/updateMemberPassword.jsp?memid="; 
//			
//			String messageText = "親愛的 " + ch_name +"您好!"+ " 請立即開啟連結，完成密碼變更 " +  "\n" 
//					+ "貼心提醒：\r\n"
//					+ "1.此密碼有效時間為30分鐘，如逾時失效，請至EASY SPACE重新申請「忘記密碼」，系統將重新派送。\r\n"
//					+ "2.密碼變更完成後，請使用新密碼重新登入，並請妥善保管您的個人資料，切勿提供他人，以保障您的帳號安全。";
//
//			ResetPasswordMailService mailService = new ResetPasswordMailService();
//			mailService.sendMail(to, subject, messageText);
//
//		}
}
