package ezs.ren_location.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ezs.ren_location.model.RenLocationService;
import ezs.ren_listing.model.*;
import ezs.ren_location.model.*;

@WebServlet("/frontend/ren_listing/RenLocationServlet.do")
public class RenLocationServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");   //<--- 已經由 SetCharacterEncodingFilter 濾器解決 Query String 之編碼問題了
		String action = req.getParameter("action");
		
		if("listLocations_BylisAreaID".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*****************1.接收請求參數_輸入格式的錯誤處理******************/
				Integer lisAreaID = new Integer(req.getParameter("lisAreaID"));
//				System.out.print(1234);
				/*************************** 2.開始查詢資料 ****************************************/
				RenLocationService renLocationSvc = new RenLocationService();
				Set<RenListingVO> set1 = renLocationSvc.getRenListingByLisAreaID(lisAreaID);
				if (set1 == null) {
					errorMsgs.add("查無資料請查詢別區");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_listing/listingView.jsp");
									
					failureView.forward(req, res);
					return;
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				HttpSession session = req.getSession();
				session.setAttribute("listRenListing_ByLisAreaID", set1);    // 資料庫取出的list物件,存入request				
//				String url = "/frontend/ren_location/listListing_ByLisAreaID.jsp";
				String url = "/frontend/ren_listing/listingViewByLocation.jsp";
				System.out.println(set1);
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

                 }catch (Exception e) {
                	 errorMsgs.add("無法取得資料:" + e.getMessage());
     				RequestDispatcher failureView = req
     						.getRequestDispatcher("/frontend/ren_listing/listingView.jsp");
     				failureView.forward(req, res);
     			}				
			}
		}
}
