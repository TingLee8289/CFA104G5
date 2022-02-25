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
import ezs.sec_ord_details.model.SecOrdDetailsVO;

@WebServlet("/sec_ord/GetSecOrdDetailsBySellerServlet.do")
public class GetSecOrdDetailsBySellerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetSecOrdDetailsBySellerServlet() {
		super();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println(action);

		// 來自secOrdHomeSeller.jsp的請求 // 來自 SecOrd/listAllSecOrd.jsp的請求
		if ("listSecOrdDetails_BySecOrd_A".equals(action) || "listSecOrdDetails_BySecOrd_B".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer shOrdID = new Integer(req.getParameter("shOrdID"));

				/*************************** 2.開始查詢資料 ****************************************/
				SecOrdService secOrdSvc = new SecOrdService();
				Set<SecOrdDetailsVO> set = secOrdSvc.getSecAllOrdDeatails(shOrdID);
					System.out.println(shOrdID);
					System.out.println("shOrdID"+set.size());
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("list", set); // 資料庫取出的list物件,存入request

				String url = null;
				if ("listSecOrdDetails_BySecOrd_A".equals(action)) 
					url = "/frontend/sec_ord/listSecOrdDetails.jsp"; // 成功轉交
				
															// /frontend/sec_ord/listSecOrdDetails_BySecOrd.jsp
				else if ("listSecOrdDetails_BySecOrd_B".equals(action)) 
					url = "/frontend/sec_ord/listAllSecOrd.jsp"; // 成功轉交 /frontend/sec_ord/listAllDept.jsp
				
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println(successView);
				/*************************** 其他可能的錯誤處理 ***********************************/
			} catch (Exception e) {
				e.printStackTrace();
				throw new ServletException(e);
			}
		}

		if ("delete_secord".equals(action)) { // 來自/frontend/sec_ord/listAllDept.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer shOrdID = new Integer(req.getParameter("shOrdID"));
				System.out.println(shOrdID);
				/*************************** 2.開始刪除資料 ***************************************/

				SecOrdService secOrdSvc = new SecOrdService();
				secOrdSvc.updateCancleOrder(shOrdID);
				System.out.println(shOrdID);
				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/frontend/sec_ord/listAllSecOrd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後, 成功轉交 回到
																				// /frontend/sec_ord/listAllSecOrd.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 ***********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_ord/listAllSecOrd.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
