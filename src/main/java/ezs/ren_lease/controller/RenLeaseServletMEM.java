package ezs.ren_lease.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.ren_landlord.model.RenLandlordVO;
import ezs.ren_lease.model.*;

@WebServlet("/ren_lease/RenLeaseServletMEM.do")

public class RenLeaseServletMEM extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("MEMgetOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
//			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("lseLeaseMemId");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_lease/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer lseLeaseMemId = null;
				try {
					lseLeaseMemId = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_lease/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				/***************************2.開始查詢資料*****************************************/
//				RenLeaseService renLeaseSvc = new RenLeaseService();
//				List<RenLeaseVO> list = renLeaseSvc.getAll(lseMemId);
//
//				if (list == null) {
//					errorMsgs.add("查無資料");
//				}
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/frontend/ren_lease/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("renLeaseVO", list); 
				String url = "/frontend/ren_lease/MEMlistOneLease.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得資料:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/frontend/ren_lease/select_page.jsp");
//				failureView.forward(req, res);
//			}
		}
		
		if ("MEMgetOne".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("lseId");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入租賃單編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_lease/MEMlistOneLease.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer lseId = null;
				try {
					lseId = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("租賃單編號格式不正確");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_lease/MEMlistOneLease.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				/***************************2.開始查詢資料*****************************************/
				RenLeaseService renLeaseSvc = new RenLeaseService();
				RenLeaseVO renLeaseVO = renLeaseSvc.getOneRenLease(lseId);

				if (renLeaseVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_lease/MEMlistOneLease.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("renLeaseVO", renLeaseVO);
				String url = "/frontend/ren_lease/MEMlistOneLease.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_lease/MEMlistOneLease.jsp");
				failureView.forward(req, res);
			}
		}

		
		
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer lseId = new Integer(req.getParameter("lseId"));
				
				/***************************2.開始刪除資料***************************************/
				RenLeaseService renLeaseSvc = new RenLeaseService();
				renLeaseSvc.deleteRenLease(lseId);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/frontend/ren_lease/MEMlistOneLease.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_lease/MEMlistOneLease.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
