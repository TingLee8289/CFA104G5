package ezs.member.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ezs.member.model.MemberVO;
import redis.clients.jedis.Jedis;

@WebServlet("/member/RegisterMailServlet.do")
public class RegisterMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		System.out.println(memberVO.getMemUsername());
		RegisterMailServlet registerMailServlet = new RegisterMailServlet();

		String to = memberVO.getMemEmail();

		String subject = "EASY SPACE 會員註冊 - 帳號驗證確認";

		String mem_name = memberVO.getMemName();				// 會員名稱
		String passRandom = registerMailServlet.genAuthCode();	// 驗證碼
		String VerifLink = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+
				"/member/MemberVerificationServlet.do?action=verify&memUserName="+memberVO.getMemUsername()+"&verifCode="+passRandom; // mail內的連結

		Jedis jedis = new Jedis("localhost", 6379);
		jedis.set(memberVO.getMemUsername(), passRandom);
		jedis.close();
		
		String messageText = "親愛的 " + mem_name + " 會員您好" + "\n" + "謝謝您向 EASY SPACE 申請註冊，為了啟用 EASY SPACE 服務並且保護您的帳號安全。"
				+ "\n" + "我們將協助您進行最後一個驗證步驟： " + "E-Mail驗證步驟" + "\n" + "請在 EASY SPACE 驗證網頁中，輸入您的驗證碼： " + passRandom
				+ "\n" + VerifLink +"\n"+ "註冊完成後，EASY SPACE 將會提供您更多的服務資訊與內容。" + "\n" + "敬祝　有個愉快的一天" + "\n" + "EASY SPACE 你的空間管理大師";

		
		RegisterMailServlet mailService = new RegisterMailServlet();
		mailService.sendMail(to, subject, messageText);
		
		String url = "/frontend/member/memberVerificationPage.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url); 
		successView.forward(req, res);
	}
	
	// 產生一個8位數的驗證碼，此驗證碼內容包含了英文大小寫與數字的亂數組合
	public String genAuthCode() {
			char[] arr = new char[8];
			int[] forbiden = { 58, 59, 60, 61, 62, 63, 64, 91, 92, 93, 94, 95, 96 };

			for (int i = 0; i < arr.length; i++) {
				int randomInt;
				int result;
				do {
					result = 0;
					randomInt = (int) (Math.random() * 75 + 48);

					for (int j = 0; j < forbiden.length; j++) {
						if (randomInt == forbiden[j]) {
							result = 1;
						}
					}
				} while (result == 1);
				arr[i] = (char) randomInt;
			}
			StringBuffer authCode = new StringBuffer();
			for (int k = 0; k < arr.length; k++) {
				authCode.append(arr[k]);
			}

			return authCode.toString();
		}

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
				final String myGmail = "ixlogic.wu@gmail.com";
				final String myGmail_password = "BBB45678BBB";
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
				System.out.println("會員註冊驗證信傳送成功!");
			} catch (MessagingException e) {
				System.out.println("會員註冊驗證信傳送失敗!");
				e.printStackTrace();
			}
		}

}
