package ezs.ser_repo.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.ser_repo.model.SerRepVO;
import ezs.ser_repo.model.SerRepoService;

@WebServlet("/ser_repo/GetSerRepoServlet.do")
public class GetSerRepoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("rpID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入檢舉單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/ser_repo/readSerRepo.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer rpID = null;
				try {
					rpID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("檢舉單編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/ser_repo/readSerRepo.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				SerRepoService serRepoSvc = new SerRepoService();
				SerRepVO serRepVO = serRepoSvc.getoneSerRep(rpID);
				if (serRepVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/ser_repo/readSerRepo.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("serRepVO", serRepVO); // 資料庫取出的empVO物件,存入req
				String url = "/backend/ser/ser_repo/listOneSerRepo.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/ser_repo/readSerRepo.jsp");
				failureView.forward(req, res);
			}
		}
	}
		
       
   

}
