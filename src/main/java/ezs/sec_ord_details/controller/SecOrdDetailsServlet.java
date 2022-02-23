package ezs.sec_ord_details.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.sec_ord_details.model.SecOrdDetailsService;
import ezs.sec_ord_details.model.SecOrdDetailsVO;

@WebServlet("/sec_ord/SecOrdDetailsServlet.do")
public class SecOrdDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
// 會員查詢訂單明細		
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
				req.setAttribute("listSecOrdDetails_ByShOrdID", list); // 資料庫取出的list物件,存入request

				String url = "/frontend/sec_ord/listSecOrdDetails_ByShOrdID.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}

}
