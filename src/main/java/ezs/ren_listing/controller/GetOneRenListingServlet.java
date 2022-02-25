package ezs.ren_listing.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import ezs.ren_listing.model.RenListingService;
import ezs.ren_listing.model.RenListingVO;

@WebServlet("/frontend/ren_listing/GetOneRenListingServlet.do")
public class GetOneRenListingServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");   //<--- 已經由 SetCharacterEncodingFilter 濾器解決 Query String 之編碼問題了
		String action = req.getParameter("action");
		
		if("getOne_For_Display_A".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*****************1.接收請求參數_輸入格式的錯誤處理******************/
				String str = req.getParameter("lisID");
				if(str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入房源ID");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
//							.getRequestDispatcher("/frontend/ren_listing/listAllListing.jsp");					failureView.forward(req, res);
							.getRequestDispatcher("/frontend/ren_listing/listingView.jsp");					failureView.forward(req, res);
					return;
				}
				
				Integer lisID = null;
				try {
					lisID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("房源編號格式不正確");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_listing/listingView.jsp");					failureView.forward(req, res);
					return;
				}
				/**********************2.開始查詢資料*************************/
				RenListingService renListingSvc = new RenListingService();
				RenListingVO renListingVO = renListingSvc.getOneRenListing(lisID);
				if (renListingVO == null) {
					errorMsgs.add("查無資料");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
//							.getRequestDispatcher("/frontend/ren_listing/listAllListing.jsp");
					.getRequestDispatcher("/frontend/ren_listing/listingView.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/********************3.查詢完成,準備轉交*****************/
				req.setAttribute("renListingVO", renListingVO);
//				String url = "/frontend/ren_listing/listOneListing.jsp";
				String url = "/frontend/ren_listing/listOneListingView.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/*********************其他可能的錯誤*************/	
				
				
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_listing/listingView.jsp");
//				.getRequestDispatcher("/frontend/ren_listing/listAllListing.jsp");
				failureView.forward(req, res);
			}
		}
	
	}
}
