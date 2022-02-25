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
import javax.servlet.http.HttpSession;

import ezs.member.model.MemberService;
import ezs.member.model.MemberVO;
import redis.clients.jedis.Jedis;

@WebServlet("/member/MemberVerificationServlet.do")
public class MemberVerificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		String memUsername = memberVO.getMemUsername();
		String verifCode = req.getParameter("verifCode");
		
		System.out.println(memUsername);
		System.out.println(verifCode);

		if ("verify".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			
			/*************************** 1.處理沒有輸入的情況 *****************************************/
			if (verifCode == null || (verifCode.trim()).length() == 0) {
				errorMsgs.add("請輸入驗證碼");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/memberVerificationPage.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 2.開始查詢資料 *****************************************/
			Jedis jedis = new Jedis("localhost", 6379);
			System.out.println(jedis.get(memUsername));
			
			// 處理輸入驗證碼正確的情況
			if (verifCode.equals(jedis.get(memUsername))) {
				MemberService memberSvc = new MemberService();
				memberSvc.verifyMember(memUsername);
				jedis.close();
				
				String url = "/frontend/member/login.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				return;
			// 處理輸入驗證碼錯誤的情況
			} else {
				jedis.close();
				errorMsgs.add("驗證碼錯誤，請重新輸入");
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/memberVerificationPage.jsp");
					failureView.forward(req, res);
					return;
				}
			}

		}

		if ("resent".equals(action)) {
			
			
			
			
			
			
		}

	}

}
