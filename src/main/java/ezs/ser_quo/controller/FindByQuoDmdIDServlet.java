package ezs.ser_quo.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.ser_quo.model.SerQuoService;
import ezs.ser_quo.model.SerQuoVO;

@WebServlet("/ser_quo/FindByQuoDmdIDServlet.do")
public class FindByQuoDmdIDServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");

		if ("findByDmdID".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String str = req.getParameter("quoDmdID");
			if (str == null || (str.trim().length() == 0)) {
				errorMsgs.add("請輸入估價單編號");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_quo/findByQuoDmdID.jsp");
				failureView.forward(req, res);
				return;// 中斷程式
			}
			Integer quoDmdID = null;
			try {
				quoDmdID = Integer.valueOf(str);
//			System.out.println(str);
			} catch (Exception e) {
				errorMsgs.add("估價單編號不正確");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_quo/findByQuoDmdID.jsp");
				failureView.forward(req, res);
				return;
			}
			// 開始查詢資料
			SerQuoService serQuoSvc = new SerQuoService();
			List<SerQuoVO> serQuoVOList= serQuoSvc.findByDmdID(quoDmdID);
			if (serQuoVOList == null) {
				errorMsgs.add("查無資料");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_quo/findByQuoDmdID.jsp");
				failureView.forward(req, res);
				return;
			}
			// 3.查詢完成,準備轉交(Send the Success view)
			req.setAttribute("serQuoVOList", serQuoVOList);// 資料庫取出的serQuoVOList物件,存入req
			String url = "/frontend/ser_quo/showQuoByQuoDmdID.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 showQuoByQuoDmdID.jsp
			successView.forward(req, res);
		}

	}
}
