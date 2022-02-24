package ezs.ser_quo.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.ser_dmd.model.SerDmdService;
import ezs.ser_quo.model.*;

@WebServlet("/ser_quo/AddQuoServlet.do")
public class AddQuoServlet extends HttpServlet {

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
				serQuoVO.setQuoDmdID(quoDmdID);
				serQuoVO.setQuoVdrID(quoVdrID);
				serQuoVO.setQuoDate(quoDate);
				serQuoVO.setQuoExpiryDate(quoExpiryDate);
				serQuoVO.setQuoItem(quoItem);
				serQuoVO.setQuoTotalPrice(quoTotalPrice);
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("serQuoVO", serQuoVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_quo/addSerQuo.jsp");
					failureView.forward(req, res);
					return;
				}
				//2. addquo
				SerQuoService serQuoSvc = new SerQuoService();
				serQuoVO= serQuoSvc.addSerQuo(quoStatus, quoDmdID, quoVdrID, quoDate, quoExpiryDate, quoItem, quoTotalPrice);
				SerDmdService serDmdSvc= new SerDmdService();	
				serDmdSvc.setDmdStatus(quoDmdID);
				//3.新增完成，轉交
				String url = "/frontend/ser_dmd/getByDmdMemID.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_quo/addSerQuo.jsp");
				failureView.forward(req, res);
			}

		}
	}

}
