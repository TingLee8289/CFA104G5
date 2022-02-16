package ezs.ser_ord.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.ser_ord.model.SerOrdService;
import ezs.ser_ord.model.SerOrdVO;

@WebServlet("/ser_ord/GetOneOrdServlet.do")
public class GetOneOrdServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	String action = req.getParameter("action");
	
	if("getOneOrd".equals(action)) {
		List<String> errorMsgs = new LinkedList<String>();
		req.setAttribute("errorMsgs", errorMsgs);
		
		String str = req.getParameter("serOrdID");
		if (str == null || (str.trim().length() == 0)) {
			errorMsgs.add("請輸入估價單編號");
		}
		if (!errorMsgs.isEmpty()) {
			RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serOrd/ordBackend.jsp");
			failureView.forward(req, res);
			return;// 中斷程式
		}
		Integer serOrdID = null;
		try {
			serOrdID = Integer.valueOf(str);
//			System.out.println(str);
		} catch (Exception e) {
			errorMsgs.add("估價單編號不正確");
		}
		// Send the use back to the form, if there were errors
		if (!errorMsgs.isEmpty()) {
			RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serOrd/ordBackend.jsp");
			failureView.forward(req, res);
			return;
		}
		//開始查詢資料
		SerOrdService serOrdSvc = new SerOrdService();
		SerOrdVO serOrdVO = serOrdSvc.getOneSerOrd(serOrdID);
		if (serOrdVO == null) {
			errorMsgs.add("查無資料");
		}
		if (!errorMsgs.isEmpty()) {
			RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serOrd/ordBackend.jsp");
			failureView.forward(req, res);
			return;
		}
		// 3.查詢完成,準備轉交(Send the Success view)
		req.setAttribute("serOrdVO", serOrdVO);// 資料庫取出的empVO物件,存入req
		String url = "/backend/ser/serOrd/listOneSerOrd.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 listOneEmp.jsp
		successView.forward(req, res);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
}
