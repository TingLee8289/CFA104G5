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

@WebServlet("/sec_items/DeleteSecItemsServlet.do")

public class DeleteSecItemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	synchronized public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	synchronized public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer shID = Integer.valueOf(req.getParameter("shID"));

				/*************************** 2.開始刪除資料 ***************************************/
				SecItemsService secItemsSvc = new SecItemsService();
				
				secItemsSvc.deleteSecItems(shID);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/secItems/listAllSecItems.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/secItems/listAllSecItems.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
