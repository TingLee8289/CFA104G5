package ezs.sec_items.controller;

import java.io.IOException;
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

import ezs.sec_items.model.SecItemsService;
import ezs.sec_items.model.SecItemsVO;

/**
 * Servlet implementation class GetSecItemsStatusServlet
 */
@WebServlet("/sec_items/GetSecItemsStatusServlet.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class GetSecItemsStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	synchronized public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	synchronized public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession(); // 取得session

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {

				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Object seller = session.getAttribute("memID");

				Integer shSellerID = (Integer) seller;
				System.out.println(shSellerID);

				Integer shStatus = Integer.valueOf(req.getParameter("shStatus"));

//				String str = req.getParameter("shStatus");
//				if (str == null || (str.trim()).length() == 0) {
//					errorMsgs.add("請選擇商品狀態");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_items/select_page.jsp");
//					failureView.forward(req, res);
//					return;// 程式中斷
//				}
//
//				Integer shStatus = null;
//				try {
//					shStatus = Integer.valueOf(str);
//				} catch (Exception e) {
//					errorMsgs.add("商品搜尋狀態別不正確");
//				}

				System.out.println(shStatus);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_items/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				SecItemsService secItemsSvc = new SecItemsService();
				List<SecItemsVO> secItemsVO = secItemsSvc.getByStatus(shSellerID, shStatus);
				System.out.println(shSellerID);
				if (secItemsVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_items/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				System.out.println(shStatus);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("secItemsVO", secItemsVO); // 資料庫取出的secItemsVO物件,存入req
				String url = "/frontend/sec_items/listOneSecItemsStatus.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
				System.out.println(successView);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_items/select_page.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
