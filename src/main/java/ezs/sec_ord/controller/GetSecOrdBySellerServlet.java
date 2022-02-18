package ezs.sec_ord.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.sec_ord.model.SecOrdService;
import ezs.sec_ord.model.SecOrdVO;

@WebServlet("/sec_ord/GetSecOrdBySellerServlet.do")
public class GetSecOrdBySellerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetSecOrdBySellerServlet() {
        super();
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if ("getOne_For_Display".equals(action)) { // 來自secOrdHomeSeller.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {

				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("shOrdID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入查詢訂單單號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_ord/secOrdHomeSeller.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer shOrdID = null;
				try {
					shOrdID = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("訂單單號格式不正確");
				}
							
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_ord/secOrdHomeSeller.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				SecOrdService secOrdSvc = new SecOrdService();
				SecOrdVO secOrdVO = secOrdSvc.getOneSecOrd(shOrdID);
				if (secOrdVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_ord/secOrdHomeSeller.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("secOrdVO", secOrdVO); // 資料庫取出的secOrdVO物件,存入req
				String url = "/frontend/sec_ord/listSecOrdsByShSeller.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_ord/secOrdHomeSeller.jsp");
				failureView.forward(req, res);
			}
		}

	}
}