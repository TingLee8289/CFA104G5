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

@WebServlet("/sec_items/UpdateSecItemsServlet.do")

public class UpdateSecItemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	synchronized public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	synchronized public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Update".equals(action)) { // 來自listAllSecItems.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer shID = Integer.valueOf(req.getParameter("shID"));

				/*************************** 2.開始查詢資料 ****************************************/
				SecItemsService secItemsSvc = new SecItemsService();
				SecItemsVO secItemsVO = secItemsSvc.getOneSecItems(shID);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("secItemsVO", secItemsVO); // 資料庫取出的secItems物件,存入req
				String url = "/secItems/update_secItems_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/secItems/listAllSecItems.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_secItems_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer shID = Integer.valueOf(req.getParameter("shID").trim());

				Integer shCateID = Integer.valueOf(req.getParameter("shCateID").trim());

				Integer shSellerID = Integer.valueOf(req.getParameter("shSellerID").trim());

				String shName = req.getParameter("shName");
				String shNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (shName == null || shName.trim().length() == 0) {
					errorMsgs.add("員工姓名: 請勿空白");
				} else if (!shName.trim().matches(shNameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				BigDecimal shPrice = null;
				String shPriceReg = "^[(0-9)]{1,1000000000}$";
				if (shPrice == null || shPrice.toString().trim().length() == 0) {
					errorMsgs.add("價格: 請勿空白");
				} else if (!shPrice.toString().trim().matches(shPriceReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("價格: 請填有效數字");
				}

//				try {
//					shPrice = new BigDecimal(req.getParameter("shPrice").trim());
//				} catch (NumberFormatException e) {
//					shPrice = BigDecimal.valueOf(0);
//					errorMsgs.add("價格請填數字.");
//				}
//				d2 = d2.setScale(2, BigDecimal.ROUND_HALF_UP);
//				會不會有小數點問題??

				Integer shQTY = Integer.valueOf(req.getParameter("shQTY").trim());

				String shSize = req.getParameter("shSize").trim();
				if (shSize == null || shSize.trim().length() == 0) {
					errorMsgs.add("商品尺寸請勿空白");
				}
				String shDescription = req.getParameter("shDescription").trim();
				if (shDescription == null || shDescription.trim().length() == 0) {
					errorMsgs.add("商品介紹請勿空白");
				}
				String shCondition = req.getParameter("shCondition").trim();
				if (shCondition == null || shCondition.trim().length() == 0) {
					errorMsgs.add("商品新舊狀況請勿空白");
				}
				String shTime = req.getParameter("shTime").trim();
				if (shTime == null || shTime.trim().length() == 0) {
					errorMsgs.add("商品已使用時間請勿空白");
				}
				String shGuarantee = req.getParameter("shGuarantee").trim();
				if (shGuarantee == null || shGuarantee.trim().length() == 0) {
					errorMsgs.add("商品保固請勿空白");
				}

				Integer shStatus = Integer.valueOf(req.getParameter("shStatus").trim());

				String shCounty = req.getParameter("shCounty").trim();
				if (shCounty == null || shCounty.trim().length() == 0) {
					errorMsgs.add("所在縣市請勿空白");
				}

				String shDist = req.getParameter("shDist").trim();
				if (shDist == null || shDist.trim().length() == 0) {
					errorMsgs.add("所在鄉鎮區請勿空白");
				}

				SecItemsVO secItemsVO = new SecItemsVO();
				secItemsVO.setShCateID(shCateID);
				secItemsVO.setShSellerID(shSellerID);
				secItemsVO.setShName(shName);
				secItemsVO.setShPrice(shPrice);
				secItemsVO.setShQTY(shQTY);
				secItemsVO.setShSize(shSize);
				secItemsVO.setShDescription(shDescription);
				secItemsVO.setShCondition(shCondition);
				secItemsVO.setShTime(shTime);
				secItemsVO.setShGuarantee(shGuarantee);
				secItemsVO.setShStatus(shStatus);
				secItemsVO.setShCounty(shCounty);
				secItemsVO.setShDist(shDist);
				secItemsVO.setShID(shID);

//				dao.update(secItemsVO);	

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("secItemsVO", secItemsVO); // 含有輸入格式錯誤的SecItemsVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/secItems/update_secItems_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				SecItemsService secItemsSvc = new SecItemsService();
				secItemsVO = secItemsSvc.updateSecItems(shID, shCateID, shSellerID, shName, shPrice, shQTY, shSize,
						shDescription, shCondition, shTime, shGuarantee, shStatus, shCounty, shDist);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("secItemsVO", secItemsVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/secItems/listOneSecItems.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/secItems/update_secItems_input.jsp");
				failureView.forward(req, res);
			}
		}

		
	}
}
