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

import ezs.admin_priv.model.AdminPrivService;
import ezs.admin_priv.model.AdminPrivVO;

public class AdminPrivServlet {
	@WebServlet("/admin_priv/AdminPrivServlet.do")
	public class AdminEmpServlet extends HttpServlet {
//		protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//			doPost(req, res);
//		}

		public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

			req.setCharacterEncoding("UTF-8");
			String action = req.getParameter("action");

			if ("getOne_For_Update".equals(action)) {
				
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
					Integer adminID = new Integer(req.getParameter("admID"));
					/***************************2.開始查詢資料****************************************/
					AdminPrivService adminPrivService = new AdminPrivService();
					List<AdminPrivVO> adminPrivVO = adminPrivService.getAllFromID(adminID);
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					req.setAttribute("adminprivVO", adminPrivVO); // 資料庫取出的empVO物件,存入req
					String url = "/backend/adminEMP/listAllEMPadmin.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
					successView.forward(req, res);
				} catch (Exception e) {
					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/emp/listAllEmp.jsp");
					failureView.forward(req, res);
				}
				
				
			}
		}
	}
}
