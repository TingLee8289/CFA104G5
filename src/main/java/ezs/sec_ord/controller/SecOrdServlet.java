package ezs.sec_ord.controller;

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
				req.setAttribute("listSecOrds_ByShBuyerID", set);    // 資料庫取出的list物件,存入request

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
