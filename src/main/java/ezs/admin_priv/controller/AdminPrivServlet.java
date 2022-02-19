package ezs.admin_priv.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.admin_emp.model.AdminEmpService;
import ezs.admin_priv.model.AdminPrivService;
import ezs.admin_priv.model.AdminPrivVO;

	@WebServlet("/admin_priv/AdminPrivServlet.do")
	public class AdminPrivServlet extends HttpServlet {
//		protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//			doPost(req, res);
//		}

		public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

			req.setCharacterEncoding("UTF-8");
			String action = req.getParameter("action");

			if ("delete".equals(action)) {
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				
				try {
					/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
					Integer admID = new Integer(req.getParameter("admID"));
					/*************************** 2.開始刪除資料 ***************************************/
					AdminEmpService adminEmpService = new AdminEmpService();
					AdminPrivService adminPrivService = new AdminPrivService();
					adminPrivService.deleteAdminPrinv(admID);
					adminEmpService.deletAdminEmp(admID);
					/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
					String url = "/backend/adminEmp/adminEmp.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(req, res);
					/*************************** 其他可能的錯誤處理 **********************************/
				} catch (Exception e) {
					errorMsgs.add("刪除資料失敗:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/adminEmp/adminEmp.jsp");
					failureView.forward(req, res);
				}
			}
				
				
			}
		}
	
