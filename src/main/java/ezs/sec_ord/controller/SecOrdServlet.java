package ezs.sec_ord.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
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

import ezs.member.model.MemberService;
import ezs.sec_ord.model.SecOrdService;
import ezs.sec_ord.model.SecOrdVO;

@WebServlet("/sec_ord/SecOrdServlet.do")
public class SecOrdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

// 買家會員查詢自己的訂單
		if ("listSecOrd_ByShBuyerID".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer shBuyerID = Integer.valueOf(req.getParameter("shBuyerID"));

				/*************************** 2.開始查詢資料 ****************************************/
				SecOrdService secOrdSvc = new SecOrdService();
				Set<SecOrdVO> set = secOrdSvc.getSecOrdByShBuyerID(shBuyerID);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				HttpSession session = req.getSession();
				session.setAttribute("listSecOrds_ByShBuyerID", set); // 資料庫取出的list物件,存入request

				String url = "/frontend/sec_ord/listSecOrds_ByShBuyerID.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
// 買家會員新增訂單

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer shBuyerID = Integer.valueOf(req.getParameter("memID"));
				Integer shSellerID = Integer.valueOf(req.getParameter("shSellerID"));
				Integer shPostcode = Integer.valueOf(req.getParameter("shPostcode"));
				String shCounty = (String) req.getParameter("shCounty");
				String shDist = (String) req.getParameter("shDist");
				String shRoad = (String) req.getParameter("shRoad");
				Integer shPayment = 11;
				Integer shOrdStatus = 2;
				BigDecimal shPrice = new BigDecimal(req.getParameter("shPrice"));
				Date shDate = (Date) new java.util.Date();
				String shNotes = (String) req.getParameter("shNotes");
				
				SecOrdVO secOrdVO = new SecOrdVO();
				secOrdVO.setShBuyerID(shBuyerID);
				secOrdVO.setShSellerID(shSellerID);
				secOrdVO.setShPostcode(shPostcode);
				secOrdVO.setShCounty(shCounty);
				secOrdVO.setShDist(shDist);
				secOrdVO.setShRoad(shRoad);
				secOrdVO.setShPayment(shPayment);
				secOrdVO.setShOrdStatus(shOrdStatus);
				secOrdVO.setShPrice(shPrice);
				secOrdVO.setShDate(shDate);
				secOrdVO.setShNotes(shNotes);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("secOrdVO", secOrdVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/memberRegister.jsp");
					failureView.forward(req, res);
					return;
				}
				

				/*************************** 2.開始新增資料 ***************************************/
				SecOrdService secOrdSvc = new SecOrdService();
				secOrdVO = secOrdSvc.addSecOrd(shBuyerID, shSellerID, shPostcode, shCounty, shDist, shRoad,
						shPayment, shOrdStatus, shPrice, shDate, shNotes);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ************/
				req.setAttribute("secOrdVO", secOrdVO);

				String url = "/frontend/EZ_home.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
		
		
// 買家會員完成訂單或申請退款
		if ("completeOrder".equals(action) || "refundOrder".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer secOrdID = Integer.valueOf(req.getParameter("secOrdID"));

				/*************************** 2.開始修改資料 ****************************************/
				
				if("completeOrder".equals(action)) {
					SecOrdService secOrdSvc = new SecOrdService();
					secOrdSvc.updateCompleteOrder(secOrdID);
				} else if ("refundOrder".equals(action)) {
					SecOrdService secOrdSvc = new SecOrdService();
					secOrdSvc.refundOrder(secOrdID);
				}
				
				/*************************** 3.修改完成,準備轉交(Send the Success view) ************/

				String url = "/frontend/sec_ord/listSecOrds_ByShBuyerID.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		

	}

}
