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

@WebServlet("/ser_repo/InsertSerRepoServlet.do")
public class InsertSerRepoServlet extends HttpServlet {

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

				
				Integer rpOrdID = new Integer(req.getParameter("rpOrdID"));
				Integer rpMemID = new Integer(req.getParameter("rpMemID"));

				String rpTxt = req.getParameter("rpTxt").trim();
				String txtReg = "^[(\\u4e00-\\u9fa5)]{5,50}$";
				if (rpTxt == null || rpTxt.trim().length() == 0) {
					errorMsgs.add("檢舉內容請勿空白");
				}else if (!rpTxt.trim().matches(txtReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("請重新輸入檢舉內容，只能為中文，最少五個字");
				}

				java.sql.Date rpDate = null;
				try {
					rpDate = java.sql.Date.valueOf(req.getParameter("rpDate").trim());
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
					rpDate = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}

				Integer rpStatus = new Integer(req.getParameter("rpStatus").trim());

				SerRepVO serRepVO = new SerRepVO();
				
				serRepVO.setRpMemID(rpMemID);
				serRepVO.setRpTxt(rpTxt);
				serRepVO.setRpDate(rpDate);
				serRepVO.setRpStatus(rpStatus);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("serRepVO", serRepVO); // 含有輸入格式錯誤的empVO物件,也存入req
					req.setAttribute("ordID", rpOrdID);
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_repo/addSerRepo.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				SerRepoService serRepoSvc = new SerRepoService();
				serRepoSvc.addSerRepo(rpOrdID, rpMemID, rpTxt, rpDate, rpStatus);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/frontend/member/memberCenter/buyerMemberCenter.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_repo/addSerRepo.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
