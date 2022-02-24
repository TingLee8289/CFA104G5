package ezs.ser_ord.controller;

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

import ezs.ser_ord.model.SerOrdDAO;
import ezs.ser_ord.model.SerOrdService;
import ezs.ser_ord.model.SerOrdVO;
import ezs.ser_quo.model.SerQuoService;
import ezs.ser_quo.model.SerQuoVO;

@WebServlet("/ser_ord/AddOrdServlet.do")
public class AddOrdServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) {// req from add
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				Byte ordStatus = Byte.valueOf(req.getParameter("ordStatus"));
				Byte ordPayStatus = Byte.valueOf(req.getParameter("ordPayStatus"));

				Integer ordDmdID = Integer.valueOf(req.getParameter("ordDmdID"));
				Integer ordQuoID = Integer.valueOf(req.getParameter("ordQuoID"));
				Integer ordMemID = Integer.valueOf(req.getParameter("ordMemID"));
				Integer ordVdrID = Integer.valueOf(req.getParameter("ordVdrID"));
				Integer ordSerClaID = Integer.valueOf(req.getParameter("ordSerClaID"));

				String ordMemVatno = req.getParameter("ordMemVatno").trim();
				String ordVdrVatno = req.getParameter("ordVdrVatno").trim();
				String ordClnName = req.getParameter("ordClnName").trim();
				String ordClnTel = req.getParameter("ordClnTel").trim();
				
				java.sql.Date ordWorkDate = null;
				try {
					ordWorkDate = java.sql.Date.valueOf(req.getParameter("ordWorkDate").trim());
				} catch (IllegalArgumentException e) {
					ordWorkDate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				String ordCounty = req.getParameter("ordCounty").trim();
				String ordDist = req.getParameter("ordDist").trim();
				String ordAddr = req.getParameter("ordAddr").trim();
				String ordItem = req.getParameter("ordItem").trim();
				
				BigDecimal ordTotalPrice = new BigDecimal(req.getParameter("ordTotalPrice"));
				BigDecimal ordPrePay = new BigDecimal(req.getParameter("ordPrePay"));
				Byte ordPayType = Byte.valueOf(req.getParameter("ordPayType"));
				java.sql.Date ordPayDate = null;
				try {
					ordPayDate = java.sql.Date.valueOf(req.getParameter("ordPayDate").trim());
				} catch (IllegalArgumentException e) {
					ordPayDate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				BigDecimal ordFpay = new BigDecimal(req.getParameter("ordFpay"));
				Byte ordFpayType = Byte.valueOf(req.getParameter("ordFpayType"));
				java.sql.Date ordFpayDate = null;
				try {
					ordFpayDate = java.sql.Date.valueOf(req.getParameter("ordFpayDate").trim());
				} catch (IllegalArgumentException e) {
					ordFpayDate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				Integer ordBuyerScore = Integer.valueOf(req.getParameter("ordBuyerScore"));
				String ordBuyerTxt = req.getParameter("ordBuyerTxt");
				Integer ordVdrScore = Integer.valueOf(req.getParameter("ordVdrScore"));
				String ordVdrTxt = req.getParameter("ordVdrTxt");
				String ordNote = req.getParameter("ordNote");

				SerOrdVO serOrdVO = new SerOrdVO();
				serOrdVO.setOrdStatus(ordStatus);
				serOrdVO.setOrdPayStatus(ordPayStatus);
				serOrdVO.setOrdDmdID(ordDmdID);
				serOrdVO.setOrdQuoID(ordQuoID);
				serOrdVO.setOrdMemID(ordMemID);
				serOrdVO.setOrdVdrID(ordVdrID);
				serOrdVO.setOrdSerClaID(ordSerClaID);
				serOrdVO.setOrdMemVatno(ordMemVatno);
				serOrdVO.setOrdVdrVatno(ordVdrVatno);
				serOrdVO.setOrdClnName(ordClnName);
				serOrdVO.setOrdClnTel(ordClnTel);
				serOrdVO.setOrdWorkDate(ordWorkDate);
				serOrdVO.setOrdCounty(ordCounty);
				serOrdVO.setOrdDist(ordDist);
				serOrdVO.setOrdAddr(ordAddr);
				serOrdVO.setOrdItem(ordItem);
				serOrdVO.setOrdTotalPrice(ordTotalPrice);
				serOrdVO.setOrdPrePay(ordPrePay);
				serOrdVO.setOrdPayType(ordPayType);
				serOrdVO.setOrdPayDate(ordPayDate);
				serOrdVO.setOrdFpay(ordFpay);
				serOrdVO.setOrdFpayType(ordFpayType);
				serOrdVO.setOrdFpayDate(ordFpayDate);
				serOrdVO.setOrdBuyerScore(ordBuyerScore);
				serOrdVO.setOrdBuyerTxt(ordBuyerTxt);
				serOrdVO.setOrdVdrScore(ordVdrScore);
				serOrdVO.setOrdVdrTxt(ordVdrTxt);
				serOrdVO.setOrdNote(ordNote);
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("serOrdVO", serOrdVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_quo/addSerQuo.jsp");
					failureView.forward(req, res);
					return;
				}
				// 2. addquo
				SerOrdService serOrdSvc = new SerOrdService();
				serOrdVO = serOrdSvc.addSerOrd(ordStatus, ordPayStatus, ordDmdID, ordQuoID, ordMemID, ordVdrID, ordSerClaID, ordMemVatno, ordVdrVatno, ordClnName, ordClnTel, ordWorkDate, ordCounty, ordDist, ordAddr, ordItem, ordTotalPrice, ordPrePay, ordPayType, ordPayDate, ordFpay, ordFpayType, ordFpayDate, ordBuyerScore, ordBuyerTxt, ordVdrScore, ordVdrTxt, ordNote);
						
				
				// 3.新增完成，轉交
				String url = "/frontend/ser_ord/getOrdByVdrID.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_ord/addSerOrd.jsp");
				failureView.forward(req, res);
			}

		}
	}
}
