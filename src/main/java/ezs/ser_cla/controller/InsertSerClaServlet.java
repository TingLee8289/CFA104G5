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

@WebServlet("/ser_cla/InsertSerClaServlet.do")
public class InsertSerClaServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				String serClaName = req.getParameter("serClaName");
				String nameReg = "^[(\u4e00-\u9fa5)]{2,10}$";
				if (serClaName == null || (serClaName.trim()).length() == 0) {
					errorMsgs.add("服務類別: 請勿空白");
				}else if (!serClaName.trim().matches(nameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("服務類別名稱: 請輸入中文 , 且長度必需在2到10之間");
				}


				SerClaVO serClaVO = new SerClaVO();

			
				serClaVO.setSerClaName(serClaName);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("serClaVO", serClaVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/ser_cla/addSerCla.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				SerClaService serClaSvc = new SerClaService();
				serClaSvc.addSerCla(serClaName);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/backend/ser/ser_cla/listAllSerCla.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/ser_cla/addSerCla.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
