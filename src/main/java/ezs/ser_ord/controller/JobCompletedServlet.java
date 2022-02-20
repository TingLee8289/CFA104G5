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

import ezs.ser_ord.model.*;

@WebServlet("/ser_ord/JobCompletedServlet.do")
public class JobCompletedServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		if("JobCompleted".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			//取得參數
			try {
				Integer ordID = Integer.valueOf(req.getParameter("ordID"));
				//更新資料
				SerOrdService serOrdSvc = new SerOrdService();
				serOrdSvc.jobCompleted(ordID);
				//更新完成轉交頁面
				String url = "/frontend/ser_ord/getOrdByVdrID.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);
			} 
			 catch (Exception e) {
				 errorMsgs.add("刪除資料失敗:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serOrd/listAllSerOrd.jsp");
					failureView.forward(req, res);
			}
		}
	}
}
