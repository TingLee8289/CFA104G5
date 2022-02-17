//package ezs.admin_priv.controller;
//
//import java.io.IOException;
//import java.util.LinkedList;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import ezs.admin_priv.model.AdminPrivService;
//import ezs.admin_priv.model.AdminPrivVO;
//
//public class AdminPrivServlet {
//	@WebServlet("/admin_priv/controller/AdminPrivServlet.do")
//	public class AdminEmpServlet extends HttpServlet {
////		protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
////			doPost(req, res);
////		}
//
//		public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//
//			req.setCharacterEncoding("UTF-8");
//			String action = req.getParameter("action");
//
//			if ("getOne_For_Update".equals(action)) {
//
//				List<String> errorMsgs = new LinkedList<String>();
//				req.setAttribute("errorMsgs", errorMsgs);
//				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//				String adminID = req.getParameter("admID");
//				/***************************2.開始查詢資料****************************************/
//				AdminPrivService adminPrivService = new AdminPrivService();
//				AdminPrivVO adminPrivVO = AdminPrivService.getoneAdminFunc(adminID);
//				
//				
//				
//			}
//		}
//	}
//}
