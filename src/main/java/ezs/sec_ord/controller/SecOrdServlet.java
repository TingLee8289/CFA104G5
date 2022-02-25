package ezs.sec_ord.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ezs.sec_items.model.SecItem;
import ezs.sec_ord.model.SecOrdJDBCDAO;
import ezs.sec_ord.model.SecOrdService;
import ezs.sec_ord.model.SecOrdVO;
import ezs.sec_ord_details.model.SecOrdDetailsService;
import ezs.sec_ord_details.model.SecOrdDetailsVO;

@WebServlet("/sec_ord/SecOrdServlet.do")
public class SecOrdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		res.setHeader("Cache-Control", "no-store");
		res.setHeader("Pragma", "no-cache");
		res.setDateHeader("Expires", 0);

// 買家會員查詢自己的訂單
		if ("listSecOrd_ByShBuyerID".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				HttpSession session = req.getSession();
				Integer shBuyerID = Integer.valueOf(session.getAttribute("memID").toString());

				/*************************** 2.開始查詢資料 ****************************************/
				SecOrdService secOrdSvc = new SecOrdService();
				Set<SecOrdVO> set = secOrdSvc.getSecOrdByShBuyerID(shBuyerID);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				session.setAttribute("listSecOrds_ByShBuyerID", set); // 資料庫取出的list物件,存入request

				String url = "/frontend/sec_ord/listSecOrds_ByShBuyerID.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
// 用訂單編號查詢明細
		if ("getSecOrdDetails".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer shOrdID = Integer.valueOf(req.getParameter("shOrdID"));
				
				/*************************** 2.開始查詢資料 ****************************************/
				SecOrdDetailsService secOrdDetailsSvc = new SecOrdDetailsService();
				List<SecOrdDetailsVO> list = secOrdDetailsSvc.findByShOrdID(shOrdID);
				
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("list", list); // 資料庫取出的list物件,存入request
				
				String url = "/frontend/sec_ord/listSecOrdDetails_ByShOrdID_ShBuyer.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/*************************** 其他可能的錯誤處理 ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
// 買家會員結帳並新增訂單 (接收來自Checkout.jsp請求)

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();
			
				/*************************** 0.確認使用者已登入 ****************************************/
			try{
				String memID = session.getAttribute("memID").toString();
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/login.jsp");
				failureView.forward(req, res);
				return;
			}
			
			/*************************** 1.接收請求參數 ****************************************/
			try {
				String shRecipName = (String) req.getParameter("shRecipName");
				if (shRecipName == null || shRecipName.trim().length() == 0) {
					errorMsgs.add("收件人姓名請勿空白");
				}
				String shRecipPhone = (String) req.getParameter("shRecipPhone");
				if (shRecipPhone == null || shRecipPhone.trim().length() == 0) {
					errorMsgs.add("收件人電話請勿空白");
				}
				
				Integer shSellerID = 1;
				
				Integer shPostcode = null;
				try {
					shPostcode = Integer.valueOf(req.getParameter("shPostcode"));
				} catch (Exception e){
					errorMsgs.add("郵遞區號請勿空白");
				}
					
				String shCounty = (String) req.getParameter("shCounty");
					if (shCounty == null || shCounty.trim().length() == 0) {
						errorMsgs.add("縣市請勿空白");
					}
				String shDist = (String) req.getParameter("shDist");
					if (shDist == null || shDist.trim().length() == 0) {
						errorMsgs.add("區域請勿空白");
					}
				String shRoad = (String) req.getParameter("shRoad");
					if (shRoad == null || shRoad.trim().length() == 0) {
						errorMsgs.add("地址請勿空白");
					}
				Integer shPayment = 11;
				Integer shOrdStatus = 2;
				BigDecimal shPrice = new BigDecimal(1000);
				Date shDate = new java.sql.Date(new java.util.Date().getTime()) ;
				String shNotes = (String) req.getParameter("shNotes");
				
				SecOrdVO secOrdVO = new SecOrdVO();
				secOrdVO.setShRecipName(shRecipName);
				secOrdVO.setShRecipPhone(shRecipPhone);
				secOrdVO.setShBuyerID(Integer.valueOf(session.getAttribute("memID").toString()));
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
					req.setAttribute("secOrdVO", secOrdVO); // 含有輸入格式錯誤的secOrdVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_items/Checkout.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/*************************** 2.開始新增資料 ***************************************/
				SecOrdJDBCDAO dao = new SecOrdJDBCDAO();
				@SuppressWarnings("unchecked")
				Vector<SecItem> buylist = (Vector<SecItem>) session.getAttribute("shoppingcart");
				List<SecOrdDetailsVO> testList = new ArrayList<SecOrdDetailsVO>(); // 準備置入明細數筆
				
				for (int i = 0; i < buylist.size(); i++) {
					SecItem order = buylist.get(i);
					Integer shID = order.getShID();
					String shName = order.getShName();
					BigDecimal shSubPrice = order.getShPrice();
					Integer shQTY = order.getShQTY();
					
					SecOrdDetailsVO secOrdDetailsVO = new SecOrdDetailsVO(); // 明細POJO
					secOrdDetailsVO.setShID(shID);
					secOrdDetailsVO.setShName(shName);
					secOrdDetailsVO.setShPrice(shSubPrice);
					secOrdDetailsVO.setShQty(shQTY);
					
					testList.add(secOrdDetailsVO); // 加入明細
				}
				
				dao.insertWithSecOrdDetails(secOrdVO, testList);
				session.removeAttribute("shoppingcart");

				/*************************** 3.新增完成,準備轉交(Send the Success view) ************/

				String url = "/frontend/EZ_home.jsp"; // 暫時設定跳轉到首頁
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
