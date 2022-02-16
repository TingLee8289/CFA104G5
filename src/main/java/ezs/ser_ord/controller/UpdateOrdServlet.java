package ezs.ser_ord.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.ser_ord.model.*;

@WebServlet("/ser_ord/UpdateOrdServlet.do")
public class UpdateOrdServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		if ("updateOneOrd".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				// 接收請求參數
				Integer ordID = Integer.valueOf(req.getParameter("ordID"));
				// 開始查詢資料
				SerOrdService serOrdSvc = new SerOrdService();
				SerOrdVO serOrdVO = serOrdSvc.getOneSerOrd(ordID);
				// 查詢完成，準備轉交
				req.setAttribute("serOrdVO", serOrdVO);
				String url = "/backend/ser/serOrd/updateSerOrd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				// 其他錯誤處理
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serOrd/listOneSerOrd.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				Integer ordID = Integer.valueOf(req.getParameter("ordID"));
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
				String ordBuyerTxt = req.getParameter("ordBuyerTxt").trim();
				Integer ordVdrScore = Integer.valueOf(req.getParameter("ordVdrScore"));
				String ordVdrTxt = req.getParameter("ordVdrTxt").trim();
				String ordNote = req.getParameter("ordNote").trim();

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
				serOrdVO.setOrdID(ordID);
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("serOrdVO", serOrdVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serOrd/updateSerOrd.jsp");
					failureView.forward(req, res);
					return;
				}
				// 2. updateord
				SerOrdService serOrdSvc = new SerOrdService();
				serOrdVO = serOrdSvc.updateSerOrd(ordStatus, ordPayStatus, ordDmdID, ordQuoID, ordMemID, ordVdrID,
						ordSerClaID, ordMemVatno, ordVdrVatno, ordClnName, ordClnTel, ordWorkDate, ordCounty, ordDist,
						ordAddr, ordItem, ordTotalPrice, ordPrePay, ordPayType, ordPayDate, ordFpay, ordFpayType,
						ordFpayDate, ordBuyerScore, ordBuyerTxt, ordVdrScore, ordVdrTxt, ordNote, ordID);

				// 3.修改完成，轉交
				String url = "/backend/ser/serOrd/listAllSerOrd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serOrd/ordBackend.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
