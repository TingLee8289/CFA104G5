package ezs.sec_items.controller;

import java.io.*;
import java.math.BigDecimal;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.sec_items.model.SecItemsService;
import ezs.sec_items.model.SecItemsVO;
import ezs.sec_pics.model.SecPicsVO;

@WebServlet("/sec_items/InsertSecItemsServlet.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class InsertSecItemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	synchronized public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	synchronized public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) { // 來自addsecItems.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				Integer shCateID = Integer.valueOf(req.getParameter("shCateID").trim());

				Integer shSellerID = Integer.valueOf(req.getParameter("shSellerID").trim());

				int minStrLength = 2;
				int maxStrLength = 50;

				String shName = req.getParameter("shName");
				String shNameReg = String.format("^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{%s,%s}$", minStrLength, maxStrLength);
				if (shName == null || shName.trim().length() == 0) {
					errorMsgs.add("商品名稱: 請勿空白");
				} else if (!shName.trim().matches(shNameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add(String.format("商品名稱: 只能是中、英文字母、數字和_, 且長度必需在%s到%s之間", minStrLength, maxStrLength));
				}

				String shPrice = req.getParameter("shPrice");
				String shPriceReg = "^[(0-9)]{1,1000000000}$";
				if (shPrice == null || shPrice.toString().trim().length() == 0) {
					errorMsgs.add("價格: 請勿空白");
				} else if (!shPrice.toString().trim().matches(shPriceReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("價格: 請填有效數字");
				}
				BigDecimal shPrice1 = new BigDecimal(shPrice.trim());
//				BigDecimal shPrice1 = new BigDecimal((shPrice.trim()), 0, RoundingMode.HALF_UP);
//				try {
//					shPrice = new BigDecimal(req.getParameter("shPrice").trim());
//				} catch (NumberFormatException e) {
//					shPrice = BigDecimal.valueOf(0);
//					errorMsgs.add("價格請填數字.");
//				}
//				d2 = d2.setScale(2, BigDecimal.ROUND_HALF_UP);
//				會不會有小數點問題??

				Integer shQTY = Integer.valueOf(req.getParameter("shQTY").trim());
				String shQTYReg = "^[(0-9)]{1,1000000000}$";
				if (shQTY == null || shQTY.toString().trim().length() == 0) {
					errorMsgs.add("數量: 請勿空白");
				} else if (!shQTY.toString().trim().matches(shQTYReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("數量: 請填有效數字");
				}

				String shSize = req.getParameter("shSize").trim();
				if (shSize == null || shSize.trim().length() == 0) {
					errorMsgs.add("商品尺寸請勿空白");
				}
				
				
				int minStrLength2 = 2;
				int maxStrLength2 =500;
				String shDescription = req.getParameter("shDescription").trim();
				String shDescriptionReg = String.format("^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{%s,%s}$", minStrLength2, maxStrLength2);
				if (shDescription == null || shDescription.trim().length() == 0) {
					errorMsgs.add("商品介紹請勿空白");
				} else if (!shDescription.trim().matches(shDescriptionReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add(String.format("商品介紹:請填有效文字, 且長度必需在%s到%s之間", minStrLength2, maxStrLength2));
				}
				
				
				

				int minStrLength1 = 2;
				int maxStrLength1 = 100;
				String shCondition = req.getParameter("shCondition").trim();
				String shConditionReg = String.format("^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{%s,%s}$", minStrLength1,
						maxStrLength1);
				if (shCondition == null || shCondition.trim().length() == 0) {
					errorMsgs.add("商品新舊狀況請勿空白");
				} else if (!shCondition.toString().trim().matches(shConditionReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品新舊狀況: 請填有效文字");
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

				// .....新增抓取圖片的code

				InputStream in = req.getPart("shPic").getInputStream(); // servlet 3.0Part物件
				byte[] shPic = null;
				if (in.available() != 0) {
//				part是拿到inputStream   要轉成陣列
					shPic = new byte[in.available()];
					in.read(shPic);
					in.close();
				} else {
					errorMsgs.add("請上傳圖片");
				}

				SecItemsVO secItemsVO = new SecItemsVO();
				secItemsVO.setShCateID(shCateID);
				secItemsVO.setShSellerID(shSellerID);
				secItemsVO.setShName(shName);
				secItemsVO.setShPrice(shPrice1);
				secItemsVO.setShQTY(shQTY);
				secItemsVO.setShSize(shSize);
				secItemsVO.setShDescription(shDescription);
				secItemsVO.setShCondition(shCondition);
				secItemsVO.setShTime(shTime);
				secItemsVO.setShGuarantee(shGuarantee);
				secItemsVO.setShStatus(shStatus);
				secItemsVO.setShCounty(shCounty);
				secItemsVO.setShDist(shDist);

				SecPicsVO secPicVO = new SecPicsVO();

				secPicVO.setShPic(shPic);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("secItemsVO", secItemsVO); // 含有輸入格式錯誤的secItemsVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_items/addSecItems.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
//				new一個新物件secItemsSvc  去放各式各樣零件  組奘起來回傳給secItemsVO  在讓VO送回去給資料庫~~

				SecItemsService secItemsSvc = new SecItemsService();

//				secItemsVO = secItemsSvc.addSecItems(shCateID, shSellerID, shName, shPrice1, shQTY, shSize,
//						shDescription, shCondition, shTime, shGuarantee, shStatus, shCounty, shDist);
//			
				secItemsVO = secItemsSvc.addSecItems(secItemsVO, secPicVO);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/frontend/sec_items/listAllSecItems.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/

			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_items/addSecItems.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
