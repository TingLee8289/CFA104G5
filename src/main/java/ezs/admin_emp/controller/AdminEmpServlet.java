package ezs.admin_emp.controller;

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

import com.mysql.cj.Session;

import ezs.admin_emp.model.AdminEmpService;
import ezs.admin_emp.model.AdminEmpVO;

@WebServlet("/admin_emp/AdminEmpServlet.do")
public class AdminEmpServlet extends HttpServlet {
//	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		doPost(req, res);
//	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {

				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String admUsername = req.getParameter("admUsername");
				String admPassword = req.getParameter("admPassword");

				if (admUsername == null || (admUsername.trim()).length() == 0) {
					errorMsgs.add("帳號密碼不得為空1");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/login.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				if (admPassword == null || (admPassword.trim()).length() == 0) {
					errorMsgs.add("帳號密碼不得為空2");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/login.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 2.開始查詢資料 *****************************************/
				AdminEmpService adminEmpService = new AdminEmpService();
				AdminEmpVO adminEmpVO = adminEmpService.Search(admUsername, admPassword);
				if (adminEmpVO == null) {
					errorMsgs.add("帳號或密碼有誤，請重新輸入3");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/login.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				HttpSession session = req.getSession();
				session.setAttribute("adminEmpVO", adminEmpVO); // 資料庫取出的adminEmpVO物件,存入req
				session.setAttribute("admUsername", adminEmpVO.getAdmUsername());

				String url = "/backend/loginsucess.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginsucess.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/login.jsp");
				failureView.forward(req, res);
			}
		}
//		登出設定
		if ("logout".equals(action)) {
			HttpSession session = req.getSession(false);
			if (session != null) {
//				   session.removeAttribute("admUsername");
				session.invalidate();
			}
			req.getRequestDispatcher("/backend/login.jsp").forward(req, res);
			return;
		}
		
	}
}
