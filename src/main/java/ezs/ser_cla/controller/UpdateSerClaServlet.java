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

@WebServlet("/backend/ser_cla/UpdateSerClaServlet.do")
public class UpdateSerClaServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer serClaID = new Integer(req.getParameter("serClaID").trim());

				String serClaName = req.getParameter("serClaName");

				SerClaVO serClaVO = new SerClaVO();

				serClaVO.setSerClaID(serClaID);
				serClaVO.setSerClaName(serClaName);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("serClaVO", serClaVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/ser_cla/update_SerCla_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				SerClaService serClaSvc = new SerClaService();
				serClaSvc.updateSerCla(serClaName, serClaID);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("serClaVO", serClaVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/backend/ser_cla/listOneSerCla.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser_cla/update_SerCla_input.jsp");
				failureView.forward(req, res);
			}
		}
	}

}