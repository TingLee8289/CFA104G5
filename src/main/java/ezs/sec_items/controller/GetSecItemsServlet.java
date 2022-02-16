package ezs.sec_items.controller;

import java.io.*;
import java.math.BigDecimal;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.sec_items.model.SecItemsService;
import ezs.sec_items.model.SecItemsVO;

@WebServlet("/sec_items/GetSecItemsServlet.do")

public class GetSecItemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	synchronized public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	synchronized public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // 來自secItemsViewPage.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			try {
				String str = req.getParameter("shID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_items/secItemsViewPage.jsp");
					failureView.forward(req, res);
					return;
				}

				Integer shID = null;
				try {
					shID = Integer.valueOf(str);
				} catch (NumberFormatException e) {
					errorMsgs.add("商品編號格式不正確");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_items/secItemsViewPage.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始查詢資料 *****************************************/
				SecItemsService secItemsSvc = new SecItemsService();
				SecItemsVO secItemsVO = secItemsSvc.getOneSecItems(shID);
				if (secItemsVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/secItems/select_page.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("secItemsVO", secItemsVO); // 資料庫取出的secItemsVO物件,存入req
				String url = "/frontend/sec_items/showOneSecItems.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/secItems/select_sec_items_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("get_BY_CATE".equals(action)) { // 來自secItemsViewPage.jsp側邊欄以商品類別查詢的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			try {
				String str = req.getParameter("shCateID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品類別");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_items/secItemsViewPage.jsp");
					failureView.forward(req, res);
					return;
				}

				Integer shCateID = null;
				try {
					shCateID = Integer.valueOf(str);
				} catch (NumberFormatException e) {
					errorMsgs.add("商品類別格式不正確");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_items/secItemsViewPage.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始查詢資料 *****************************************/
				SecItemsService secItemsSvc = new SecItemsService();
				List<SecItemsVO> secItemsVOList = secItemsSvc.getByCategory(shCateID);
				if (secItemsVOList.size() == 0) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_items/secItemsViewPage.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("secItemsVOList", secItemsVOList); // 資料庫取出的secItemsVOList物件,存入req
				String url = "/frontend/sec_items/secItemsViewPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/frontend/sec_items/secItemsViewPage.jsp");
//				failureView.forward(req, res);
			}
		}
		
		

	}
}
