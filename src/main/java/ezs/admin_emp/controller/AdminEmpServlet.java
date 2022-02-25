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
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

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
					errorMsgs.add("帳號密碼不得為空");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/login.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				if (admPassword == null || (admPassword.trim()).length() == 0) {
					errorMsgs.add("帳號密碼不得為空");
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
					errorMsgs.add("帳號或密碼有誤，請重新輸入");
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
				session.setAttribute("admID", adminEmpVO.getAdmID());

				String url = "/backend/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 loginsucess.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/login.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { //新增管理員
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String admUsername = req.getParameter("admUsername");
				String admUsernameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{4,45}$";
				if (admUsername == null || admUsername.trim().length() == 0) {
					errorMsgs.add("管理員名稱: 請勿空白");
				} else if (!admUsername.trim().matches(admUsernameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("管理員名稱: 只能是中、英文字母、數字和_ , 且長度必需在4到45之間");
				}
				String admPassword = req.getParameter("admPassword");
				String admPasswordReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{4,45}$";
				if (admPassword == null || admPassword.trim().length() == 0) {
					errorMsgs.add("管理員密碼: 請勿空白");
				} else if (!admPassword.trim().matches(admPasswordReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("管理員密碼: 只能是英文字母、數字和, 且長度必需在4到45之間");
				}
				
				AdminEmpService adminEmpService = new AdminEmpService();
				AdminEmpVO adminEmpVO1 = adminEmpService.Check(admUsername);
				if (adminEmpVO1 != null) {
					errorMsgs.add("管理員名稱:已被使用");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/adminEmp/addNewAdmin.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer admStatus = new Integer(req.getParameter("admStatus").trim());

				AdminEmpVO adminEmpVO = new AdminEmpVO();
				adminEmpVO.setAdmUsername(admUsername);
				adminEmpVO.setAdmPassword(admPassword);
				adminEmpVO.setAdmStatus(admStatus);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("adminEmpVO", adminEmpVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/adminEmp/addNewAdmin.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始新增資料 ***************************************/
				AdminEmpService admSvc = new AdminEmpService();
				adminEmpVO = admSvc.addAdminEmp(admUsername, admPassword, admStatus);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/backend/adminEmp/adminEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/adminEmp/adminEmp.jsp");
				failureView.forward(req, res);
			}
		}
		//get one for update
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer admid = new Integer(req.getParameter("admID"));
				
				/***************************2.開始查詢資料****************************************/
				AdminEmpService admEsvc = new AdminEmpService();
				AdminEmpVO adminEmpVO = admEsvc.getOneAdminEmp(admid);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("adminEmpVO", adminEmpVO);         // 資料庫取出的empVO物件,存入req
				String url = "/backend/adminEmp/update_adminemp_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);
System.out.println(successView);
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/adminEmp/adminEmp.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		
		
		//Update
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			
			try {
				Integer admID = new Integer(req.getParameter("admID"));
				System.out.println("line188 id="+admID);
				String admUsername = req.getParameter("admUsername");
				String admUsernameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{4,45}$";
				if (admUsername == null || admUsername.trim().length() == 0) {
					errorMsgs.add("管理員名稱: 請勿空白");
				} 
//				else if (!admUsername.trim().matches(admUsernameReg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("管理員名稱: 只能是中、英文字母、數字和_ , 且長度必需在4到45之間");
//				}
				String admPassword = req.getParameter("admPassword");
				String admPasswordReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{4,45}$";
				if (admPassword == null || admPassword.trim().length() == 0) {
					errorMsgs.add("管理員密碼: 請勿空白");
				} else if (!admPassword.trim().matches(admPasswordReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("管理員密碼: 只能是英文字母、數字和_ , 且長度必需在4到45之間");
				}
				Integer admStatus = new Integer(req.getParameter("admStatus").trim());
				
//				AdminEmpService adminEmpService = new AdminEmpService();
//				AdminEmpVO adminEmpVO1 = adminEmpService.Check(admUsername);
//				if (adminEmpVO1 != null) {
//					errorMsgs.add("管理員名稱:已被使用");
//				}
				
				AdminEmpVO adminEmpVO = new AdminEmpVO();
			
				adminEmpVO.setAdmUsername(admUsername);
				adminEmpVO.setAdmPassword(admPassword);
				adminEmpVO.setAdmStatus(admStatus);
				adminEmpVO.setAdmID(admID);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("adminEmpVO", adminEmpVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/adminEmp/update_adminemp_input.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始修改資料*****************************************/
				AdminEmpService admSvc = new AdminEmpService();
				adminEmpVO = admSvc.updateAdminEmp(admID,admUsername, admPassword, admStatus);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("adminEmpVO", adminEmpVO);         // 資料庫取出的empVO物件,存入req
				String url = "/backend/adminEmp/adminEmp.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);
System.out.println(successView);
			} catch (NumberFormatException e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/adminEmp/update_adminemp_input.jsp");
				failureView.forward(req, res);
				e.printStackTrace();
			} catch (ServletException e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/adminEmp/update_adminemp_input.jsp");
				failureView.forward(req, res);
				e.printStackTrace();
			} catch (IOException e) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backend/adminEmp/update_adminemp_input.jsp");
				failureView.forward(req, res);
				e.printStackTrace();
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
