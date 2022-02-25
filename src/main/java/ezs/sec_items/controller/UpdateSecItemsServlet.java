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
import ezs.sec_pics.model.SecPicsService;
import ezs.sec_pics.model.SecPicsVO;

@WebServlet("/sec_items/UpdateSecItemsServlet.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)

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

		if ("update".equals(action)) { // 來自update_secItems_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println(action);
//			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer shID = Integer.valueOf(req.getParameter("shID").trim());
				
				
				Integer shCateID = Integer.valueOf(req.getParameter("shCateID").trim());
				if (shCateID == null || shCateID == 0) {
					errorMsgs.add("商品類別請勿空白");
				}
				Integer shSellerID = Integer.valueOf(req.getParameter("shSellerID").trim());

				String shName = req.getParameter("shName");
				String shNameReg = "^[(\u4e00-\u9fa5)]{2,10}$";
//				if (shName == null || shName.trim().length() == 0) {
//					errorMsgs.add("商品名稱: 請勿空白");
//				} else if (!shName.trim().matches(shNameReg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("商品名稱: 只能是中字且長度必需在2到10之間");
//				}

				String shPrice = req.getParameter("shPrice");
				String shPriceReg = "^[(0-9)]{1,1000000000}$";
				if (shPrice == null || shPrice.toString().trim().length() == 0) {
					errorMsgs.add("價格: 請勿空白");
				} else if (!shPrice.toString().trim().matches(shPriceReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("價格: 請填有效數字");
				}
				BigDecimal shPrice1 = new BigDecimal(shPrice.trim());

//				try {
//					shPrice = new BigDecimal(req.getParameter("shPrice").trim());
//				} catch (NumberFormatException e) {
//					shPrice = BigDecimal.valueOf(0);
//					errorMsgs.add("價格請填數字.");
//				}
//				d2 = d2.setScale(2, BigDecimal.ROUND_HALF_UP);
//				會不會有小數點問題??

				Integer shQTY = Integer.valueOf(req.getParameter("shQTY").trim());
				if (shQTY == null || shQTY == 0) {
					errorMsgs.add("商品數量請勿空白");
				}
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
				
				//.....update抓取圖片的code
				
				InputStream in = req.getPart("shPic").getInputStream();   //servlet 3.0Part物件
				byte[] shPic = null;
				if(in.available()!=0) {
//				part是拿到inputStream   要轉成陣列
				shPic = new byte[in.available()];
				in.read(shPic);
				in.close();
				}else {
					errorMsgs.add("請上傳圖片");
				}
				
				SecItemsVO secItemsVO = new SecItemsVO();
				secItemsVO.setShID(shID);
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
				
				SecPicsVO secPicsVO = new SecPicsVO();
				secPicsVO.setShPicID(shID);
				secPicsVO.setShPic(shPic);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("secItemsVO", secItemsVO); // 含有輸入格式錯誤的SecItemsVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_items/update_secItems_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				SecItemsService secItemsSvc = new SecItemsService();
				secItemsVO = secItemsSvc.updateSecItems(shID, shCateID, shSellerID, shName, shPrice1, shQTY, shSize,
						shDescription, shCondition, shTime, shGuarantee, shStatus, shCounty, shDist);

				SecPicsService secPicsSvc = new SecPicsService();
				secPicsSvc.updateSecPics(shID, shPic);
				System.out.println("2"+ shID);
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("secItemsVO", secItemsVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/frontend/sec_items/listOneSecItems.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				System.out.println("3"+secItemsVO);
				/*************************** 其他可能的錯誤處理 *************************************/
//			最外面的catch是因為要讓錯誤產生時候還能導回該頁面
//			} catch (Exception e) {
//				e.printStackTrace();      //為了抓錯誤
//				errorMsgs.add("修改資料失敗:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_items/update_secItems_input.jsp");
//				failureView.forward(req, res);
//			}
		}

		
	}
}
