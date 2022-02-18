package ezs.ren_listing_pic.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import ezs.ren_listing.controller.RenListingServlet;
import ezs.ren_listing.model.RenListingService;
import ezs.ren_listing_pic.model.RenListingPicService;
import ezs.ren_listing_pic.model.RenListingPicVO;

@WebServlet("/ren_listing/RenListingPicServlet.do")
public class RenListingPicServlet extends HttpServlet{
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");   //<--- 已經由 SetCharacterEncodingFilter 濾器解決 Query String 之編碼問題了
		String action = req.getParameter("action");
		
		if("getOne_For_Display".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*************1.接收請求參數_輸入格式的錯誤處理********************/
				String str = req.getParameter("lspID");
				if (str == null || (str.trim().length() == 0)) {
					errorMsgs.add("請輸入房源照片ID格式不正確");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
					failureView.forward(req, res);
					return;// 中斷程式
				}
				
				Integer lspID = null;
				try{
					lspID = Integer.valueOf(str);
				}catch (Exception e) {
					if (str == null || (str.trim().length() == 0)) {
						errorMsgs.add("房源照片ID編號");
					}
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
						failureView.forward(req, res);
						return;// 中斷程式
					}
				}
				
				RenListingPicService renListingPicSvc = new RenListingPicService();
				RenListingPicVO renListingPicVO = renListingPicSvc.getOneRenListingPic(lspID);
				if(renListingPicVO ==null) {
					errorMsgs.add("查無資料");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				/*****************3.查詢完成，準備轉交*************/
				req.setAttribute("renListingPicVO", renListingPicVO);
				String url = "/frontend/ren_listing/listOneListing.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			}catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
				failureView.forward(req, res);
			}
		}
		if("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
			/*******************	1.接收請求參數 ***************/
				Integer lspID = new Integer(req.getParameter("lspID"));
			/******************     2.開始查詢	資料 ***************/
				RenListingPicService renListingPicSvc = new RenListingPicService();
				RenListingPicVO renListingVO = renListingPicSvc.getOneRenListingPic(lspID);
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
					failureView.forward(req,res);
					return;
				}
			/******************	    3.查詢完成準備 ********************/
				req.setAttribute("renListingVO", renListingVO);
				String url = "/frontend/ren_listing/listOneListing.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/*******************其他可能的錯誤*****************/
				
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
				failureView.forward(req, res);
			}
		}
		if("update".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/******************1.接收請求參數***********************/
				Integer lspID = new Integer(req.getParameter("lspID"));
				Integer lspLisID = new Integer(req.getParameter("lspLisID").trim());
				byte[] lspPic = null;
				Collection<Part> parts = req.getParts();
				for (Part part : parts) {
					if (part.getContentType() != null) {
						InputStream in = part.getInputStream();
						lspPic = new byte[in.available()];
						in.read(lspPic);
						in.close();
					}
				
				}
				RenListingPicVO renListingPicVO = new RenListingPicVO();
				renListingPicVO.setLspID(lspLisID);
				renListingPicVO.setLspPic(lspPic);
				renListingPicVO.setLspID(lspID);
				
				if(!errorMsgs.isEmpty()) {
				req.setAttribute("renListingPicVO", renListingPicVO);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_listing/addListing.jsp");
				failureView.forward(req,res);
				return;
				
				}
				
				/*********************2.開始修改資料************************/
				RenListingPicService renListingPicSvc = new RenListingPicService();
				renListingPicVO = renListingPicSvc.updateRenListingPic(lspID,lspLisID,lspPic);
				
				req.setAttribute("renListingPicVO", renListingPicVO);
				String url = "/frontend/ren_listing/listOneListing.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				
				/*****************************其他可能錯誤處理****************/
			}catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/update_renListing_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		if ("insert".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
			Integer lspLisID = new Integer(req.getParameter("lspLisID").trim()); 	 
			
			byte[] lspPic = null;
			Collection<Part> parts = req.getParts();
			for (Part part : parts) {
				if (part.getContentType() != null) {
					InputStream in = part.getInputStream();
					lspPic = new byte[in.available()];
					in.read(lspPic);
					in.close();
				}
			}
			
			RenListingPicVO renListingPicVO = new RenListingPicVO();
			renListingPicVO.setLspID(lspLisID);
			renListingPicVO.setLspPic(lspPic);
			
			if(!errorMsgs.isEmpty()) {
			req.setAttribute("renListingPicVO", renListingPicVO);
			RequestDispatcher failureView = req
					.getRequestDispatcher("/frontend/ren_listing/addListing.jsp");
			failureView.forward(req,res);
			return;
			
			}
			
			/***********************2.開始修改資料****************/
			RenListingPicService renListingPicSvc = new RenListingPicService();
			renListingPicVO = renListingPicSvc.addRenListingPic(lspLisID,lspPic);
			
			/********************3.新增完成，準備轉交**************/
			String url = "/frontend/listAllListing.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
			/************************其他可能的錯誤處理*****************/
			}catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/emp/addEmp.jsp");
				failureView.forward(req, res);
				
			}
			
			
		}		
			
	}

}
