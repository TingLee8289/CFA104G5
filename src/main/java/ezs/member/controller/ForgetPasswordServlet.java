//package ezs.member.controller;
//
//import java.io.IOException;
//import java.util.LinkedList;
//import java.util.List;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import ezs.member.model.MemberService;
//import ezs.member.model.MemberVO;
//import ezs.member.model.ResetPasswordMailService;
//
//@WebServlet("/member/ForgetPasswordServlet.do")
//public class ForgetPasswordServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	public ForgetPasswordServlet() {
//		super();
//	}
//
//	public void doGet(HttpServletRequest req, HttpServletResponse res) 
//			throws ServletException, IOException {
//		doPost(req, res);
//		
//		String page = "resetpassword.jsp";
//        req.getRequestDispatcher(page).forward(req, res);
//	}
//
//	public void doPost(HttpServletRequest req, HttpServletResponse res) 
//			throws ServletException, IOException {
//
//		
//		
//		ResetPasswordMailService resetPasswordMailService = new ResetPasswordMailService();
//		
//		 String action = req.getParameter("action");
//		
//
//
//		if ("reset_Password_Email".equals(action)) { // 來自resetpassword.jsp的請求
//
//			List<String> errorMsgs = new LinkedList<String>();
//		
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			try {
//				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
////				呼叫 email service
////				取得回傳的email
//				String email = req.getParameter("email");
//				String emailReg = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
//				if (email == null || email.trim().length() == 0) {
//					errorMsgs.add("EMAIL: 請勿空白");
//				} else if(!email.trim().matches(emailReg)) { 
//					errorMsgs.add("請輸入正確EMAIL格式");
//	            }
//				
//				MemberVO memberVO = new MemberVO();
//				memberVO.setMemEmail(email);
//				
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("memberVO", memberVO);
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/frontend/member/resetpassword.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
//				/***************************2.開始查詢資料*****************************************/
////				回會員資料庫查詢email 比對資料
//				MemberService memberSvc = new MemberService();
//				MemberVO MemberVO = MemberSvc.getOneEmp(empno);
//				if (empVO == null) {
//					errorMsgs.add("查無資料");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
//				
//				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
////				轉交給EMAIL SERVICE
//				
//				req.setAttribute("empVO", empVO); // 資料庫取出的empVO物件,存入req
//				String url = "/emp/listOneEmp.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交listOneEmp.jsp
//				successView.forward(req, res);
//				/***************************其他可能的錯誤處理*************************************/
//			} catch (Exception e) {
//				e.printStackTrace();
//				errorMsgs.add("修改資料失敗:"+e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/frontend/member/resetpassword.jsp");
//				failureView.forward(req, res);
//			}
//		}
//			
//			
//			
//		}
//	}
//
