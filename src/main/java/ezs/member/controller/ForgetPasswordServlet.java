package ezs.member.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.member.model.MemberService;
import ezs.member.model.MemberVO;
import ezs.member.model.ResetPasswordMailService;

@WebServlet("/member/ForgetPasswordServlet.do")
public class ForgetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ForgetPasswordServlet() {
		super();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);

		String page = "resetpassword.jsp";
		req.getRequestDispatcher(page).forward(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

//		
		String action = req.getParameter("action");
//		res.setHeader("Refresh", "10";URL=req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath() +
//				"/frontend/member/updateMemberPassword.jsp);

		if ("reset_Password_Email".equals(action)) { // 來自resetpassword.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

//				取得回傳的email
				String email = req.getParameter("email");
				String emailReg = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
				if (email == null || email.trim().length() == 0) {
					errorMsgs.add("EMAIL: 請勿空白");
				} else if (!email.trim().matches(emailReg)) {
					errorMsgs.add("請輸入正確EMAIL格式");
				}
//				
//				MemberVO memberVO = new MemberVO();
//				memberVO.setMemEmail(email);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {

					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/resetpassword.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 2.開始查詢資料 *****************************************/
//				回會員資料庫 查詢email 比對資料
//				用memberVO去getName()
//				不用轉交,直接new物件ResetPasswordMailService svc = new ResetPasswordMailService();呼叫方法，else new出一個service把信件主旨、內容傳遞進去
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.searchEmail(email);
				if (memberVO == null) {
					errorMsgs.add("查無資料，請重新輸入註冊信箱");
				} else {
					String subject = "密碼重新設定通知";
					String messageText = "親愛的 " + memberVO.getMemName() +"您好!"+ " 請立即開啟連結，完成密碼變更 " +  "\n" 
							+ "貼心提醒：\r\n"
							+ "1.此密碼有效時間為30分鐘，如逾時失效，請至EASY SPACE重新申請「忘記密碼」，系統將重新派送。\r\n"
							+ "2.密碼變更完成後，請使用新密碼重新登入，並請妥善保管您的個人資料，切勿提供他人，以保障您的帳號安全。\r\n";
					String link = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath() +
							"/frontend/member/updateMemberPassword.jsp?memid=" + memberVO.getMemID(); 
					System.out.println(link);
					messageText += link;
//					參數傳遞
					ResetPasswordMailService svc = new ResetPasswordMailService();
					svc.sendMail(email, subject, messageText);
				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
//				
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/

				req.setAttribute("memberVO", memberVO); // 資料庫取出的memberVO物件,存入req
//				String url = "/frontend/member/updateMemberPassword.jsp?memid=" + memberVO.getMemID();
				
				String url ="/frontend/EZ_home.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				
				
				
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("信箱驗證失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/resetpassword.jsp"); // 導回重新輸入註冊email
				failureView.forward(req, res);
			}
		}

	}
}
