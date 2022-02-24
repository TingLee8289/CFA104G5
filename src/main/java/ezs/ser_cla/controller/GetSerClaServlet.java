package ezs.ser_cla.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.ser_cla.model.SerClaService;
import ezs.ser_cla.model.SerClaVO;

@WebServlet("/ser_cla/GetSerClaServlet.do")
public class GetSerClaServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");


			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("serClaID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入服務類別編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/ser_cla/readSerCla.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer serClaID = null;
				try {
					serClaID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("服務類別編號格式不正確，請重新輸入數字");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/ser_cla/readSerCla.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				SerClaService serClaSvc = new SerClaService();
				SerClaVO serClaVO = serClaSvc.getoneSerCla(serClaID);
				if (serClaVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/ser_cla/readSerCla.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("serClaVO", serClaVO); // 資料庫取出的empVO物件,存入req
				String url = "/backend/ser/ser_cla/listOneSerCla.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/ser_cla/select_page.jsp");
				failureView.forward(req, res);
			}
		}
	

}
