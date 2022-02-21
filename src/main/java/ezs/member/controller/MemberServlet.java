package ezs.member.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import ezs.member.model.MemberService;
import ezs.member.model.MemberVO;
import ezs.ser_vdr.model.SerVdrService;

@WebServlet("/member/MemberServlet.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MemberServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
// 登入設定
		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {

				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String memUsername = req.getParameter("name");
				String memPassword = req.getParameter("psw");

				if (memUsername == null || (memUsername.trim()).length() == 0) {
					errorMsgs.add("帳號密碼不得為空1");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/login.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				if (memPassword == null || (memPassword.trim()).length() == 0) {
					errorMsgs.add("帳號密碼不得為空2");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/login.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 2.開始查詢資料 *****************************************/
				MemberService memberserivce = new MemberService();
				MemberVO memberVO = memberserivce.Search(memUsername, memPassword);
				if (memberVO == null) {
					errorMsgs.add("帳號或密碼有誤，請重新輸入3");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/login.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("memberVO", memberVO); // 資料庫取出的memberVO物件,存入req
				HttpSession session = req.getSession();
				session.setAttribute("memUsername", memberVO.getMemUsername());
				session.setAttribute("memberVO", memberVO);
				session.setAttribute("memID", memberVO.getMemID());

				String url = "/frontend/EZ_home.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginsucess.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("frontend/member/login2.jsp");
				failureView.forward(req, res);
			}
		}
// 登出設定
//	System.out.println(action);
	if ("logout".equals(action)) {
		HttpSession session = req.getSession(false);
		if (session != null) {
//				   session.removeAttribute("memUsername");
			session.invalidate();
		}
		req.getRequestDispatcher("/frontend/member/login.jsp").forward(req, res);
		return;
	}
// 新增會員 (接收來自memberRegister.jsp請求)	
		if ("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

			try {
				String memUsername = req.getParameter("memUsername");
				if (memUsername == null || memUsername.trim().length() == 0) {
					errorMsgs.add("帳號請勿空白");
				}

				String memPassword = req.getParameter("memPassword");
				if (memPassword == null || memPassword.trim().length() == 0) {
					errorMsgs.add("密碼請勿空白");
				}

				String memName = req.getParameter("memName");
				if (memName == null || memName.trim().length() == 0) {
					errorMsgs.add("會員名稱請勿空白");
				}
				String memPhone = req.getParameter("memPhone");
				if (memPhone == null || memPhone.trim().length() == 0) {
					errorMsgs.add("電話請勿空白");
				}
				String memAddress = req.getParameter("memAddress");
				if (memAddress == null || memAddress.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				}
				String memEmail = req.getParameter("memEmail");
				if (memEmail == null || memEmail.trim().length() == 0) {
					errorMsgs.add("email請勿空白");
				}
				String memPID = req.getParameter("memPID");
				if (memPID == null || memPID.trim().length() == 0) {
					errorMsgs.add("身分證字號請勿空白");
				}
				
				byte[] memHeadshot = null;
				Collection<Part> parts = req.getParts();
				for (Part part: parts) {
					if(part.getContentType()!= null) {
						InputStream in = part.getInputStream();
						memHeadshot = new byte[in.available()];
						in.read(memHeadshot);
						in.close();
					}
				}
				

				MemberVO memberVO = new MemberVO();
				memberVO.setMemUsername(memUsername);
				memberVO.setMemPassword(memPassword);
				memberVO.setMemName(memName);
				memberVO.setMemPhone(memPhone);
				memberVO.setMemAddress(memAddress);
				memberVO.setMemEmail(memEmail);
				memberVO.setMemPID(memPID);
				memberVO.setMemVatno(null);
				memberVO.setMemHeadshot(memHeadshot);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/memberRegister.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始新增資料 ***************************************/
				MemberService memberSvc = new MemberService();
				memberVO = memberSvc.addMember(memUsername, memPassword, memName, memPhone, memAddress, memEmail,
						memPID, memHeadshot);
				
				SerVdrService serVdrSvc = new SerVdrService();
//				serVdrSvc.addSerVdr(memID, 0, null, null, null, null, null, null, null, null, null, null, null);
				
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("memberVO", memberVO);
				
				RequestDispatcher successView = req.getRequestDispatcher("/member/RegisterMailServlet.do"); 
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/memberRegister.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
