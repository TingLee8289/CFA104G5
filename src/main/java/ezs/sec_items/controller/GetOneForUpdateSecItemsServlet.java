package ezs.sec_items.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ezs.sec_items.model.SecItemsService;
import ezs.sec_items.model.SecItemsVO;

/**
 * Servlet implementation class GetOneForUpdateSecItemsServlet
 */
@WebServlet("/sec_items/GetOneForUpdateSecItemsServlet.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)

public class GetOneForUpdateSecItemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	synchronized public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	synchronized public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession(); // 取得session
		if ("getOne_For_Update".equals(action)) { // 來自listAllSecItems.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
System.out.println(action);
			try {
				/*************************** 1.接收請求參數 ****************************************/
				Object seller = session.getAttribute("memID");

				Integer shSellerID = (Integer) seller;
System.out.println(shSellerID);
				
				
				
				Integer shID = Integer.valueOf(req.getParameter("shID"));
//				System.out.println(shID);
				/*************************** 2.開始查詢資料 ****************************************/
				SecItemsService secItemsSvc = new SecItemsService();
				SecItemsVO secItemsVO = secItemsSvc.getOneSecItems(shSellerID,shID);
System.out.println("=>>>>>>>>>>>>>>>"+secItemsVO);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("secItemsVO", secItemsVO); // 資料庫取出的secItems物件,存入req
				String url = "/frontend/sec_items/update_secItems_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);
System.out.println("=>>>"+successView);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/sec_items/listAllSecItems.jsp");
				failureView.forward(req, res);
			}
		}
		
		
	}

}
