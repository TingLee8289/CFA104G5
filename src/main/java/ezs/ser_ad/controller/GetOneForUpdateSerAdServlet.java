package ezs.ser_ad.controller;

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

import ezs.ser_ad.model.SerAdService;
import ezs.ser_ad.model.SerAdVO;

@WebServlet("/frontend/ser_ad/GetOneForUpdateSerAdServlet.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class GetOneForUpdateSerAdServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer adVdrID = new Integer(req.getParameter("adVdrID"));
				Integer adSerClaID = new Integer(req.getParameter("adSerClaID"));

				/*************************** 2.開始查詢資料 ****************************************/
				SerAdService serAdSvc = new SerAdService();
				SerAdVO serAdVO = serAdSvc.getOneSerAd(adVdrID, adSerClaID);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("serAdVO", serAdVO); // 資料庫取出的empVO物件,存入req
				String url = "/frontend/ser_ad/update_SerAd_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_ad/listAllSerAd.jsp");
				failureView.forward(req, res);
			}
		}
	}}

