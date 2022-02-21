package ezs.ser_ad.controller;

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

import ezs.ser_ad.model.SerAdService;
import ezs.ser_ad.model.SerAdVO;


@WebServlet("/frontend/ser_ad/GetSerAdServlet.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class GetSerAdServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req,res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer adVdrID = new Integer(req.getParameter("adVdrID"));
				Integer adSerClaID = new Integer(req.getParameter("adSerClaID"));
				
				
				
//				String str = req.getParameter("adVdrID");
//				if (str == null || (str.trim()).length() == 0) {
//					errorMsgs.add("請輸入廠商編號");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/frontend/ser_ad/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
//				
//				Integer adVdrID = null;
//				try {
//					adVdrID = new Integer(str);
//				} catch (Exception e) {
//					errorMsgs.add("廠商編號格式不正確");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/frontend/ser_ad/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
//				
//				
//				String lol = req.getParameter("adSerClaID");
//				if (lol == null || (lol.trim()).length() == 0) {
//					errorMsgs.add("請輸入廠商編號");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/frontend/ser_ad/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
//				
//				Integer adSerClaID = null;
//				try {
//					adSerClaID = new Integer(str);
//				} catch (Exception e) {
//					errorMsgs.add("服務類別編號格式不正確");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/frontend/ser_ad/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
				
				
				
				
				/***************************2.開始查詢資料*****************************************/
				SerAdService serAdSvc = new SerAdService();
				SerAdVO serAdVO = serAdSvc.getOneSerAd(adVdrID, adSerClaID);
				if (serAdVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ser_ad/readSerAd.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("serAdVO", serAdVO); // 資料庫取出的empVO物件,存入req
				String url = "/frontend/ser_ad/listOneSerAd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ser_ad/readSerAd.jsp");
				failureView.forward(req, res);
			}
		}
	
	}

}
