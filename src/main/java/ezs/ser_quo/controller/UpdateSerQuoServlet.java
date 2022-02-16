package ezs.ser_quo.controller;

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

import ezs.ser_quo.model.SerQuoService;
import ezs.ser_quo.model.SerQuoVO;

@WebServlet("/ser_quo/UpdateQuoServlet.do")
public class UpdateSerQuoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");

		if ("updateOneQuo".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				// 接收請求參數
				Integer quoID = Integer.valueOf(req.getParameter("quoID"));
				// 開始查詢資料
				SerQuoService serQuoSvc = new SerQuoService();
				SerQuoVO serQuoVO = serQuoSvc.getOneSerQuo(quoID);
				// 查詢完成，準備轉交
				req.setAttribute("serQuoVO", serQuoVO);
				String url = "/backend/ser/serQuo/updateSerQuo.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				// 其他錯誤處理
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serQuo/listOneSerQuo.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				Integer quoID = Integer.valueOf(req.getParameter("quoID"));
				Byte quoStatus = Byte.valueOf(req.getParameter("quoStatus"));

				Integer quoDmdID = Integer.valueOf(req.getParameter("quoDmdID"));
				Integer quoVdrID = Integer.valueOf(req.getParameter("quoVdrID"));

				java.sql.Date quoDate = null;
				try {
					quoDate = java.sql.Date.valueOf(req.getParameter("quoDate").trim());
				} catch (IllegalArgumentException e) {
					quoDate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				java.sql.Date quoExpiryDate = null;
				try {
					quoExpiryDate = java.sql.Date.valueOf(req.getParameter("quoExpiryDate").trim());
				} catch (IllegalArgumentException e) {
					quoExpiryDate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				String quoItem = req.getParameter("quoItem").trim();
				BigDecimal quoTotalPrice = new BigDecimal(req.getParameter("quoTotalPrice"));

				SerQuoVO serQuoVO = new SerQuoVO();
				serQuoVO.setQuoID(quoID);
				serQuoVO.setQuoDmdID(quoDmdID);
				serQuoVO.setQuoVdrID(quoVdrID);
				serQuoVO.setQuoDate(quoDate);
				serQuoVO.setQuoExpiryDate(quoExpiryDate);
				serQuoVO.setQuoItem(quoItem);
				serQuoVO.setQuoTotalPrice(quoTotalPrice);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("serQuoVO", serQuoVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serQuo/updateSerQuo.jsp");
					failureView.forward(req, res);
					return;
				}
				// 2. addquo
				SerQuoService serQuoSvc = new SerQuoService();
				serQuoVO = serQuoSvc.updateSerQuo(quoID, quoStatus, quoDmdID, quoVdrID, quoDate, quoExpiryDate, quoItem, quoTotalPrice);
				// 3.新增完成，轉交
				String url = "/backend/ser/serQuo/listAllSerQuo.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serQuo/updateSerQuo.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
