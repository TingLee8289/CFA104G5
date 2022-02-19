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

@WebServlet("/ser_quo/DeleteQuoServlet.do")
public class DeleteQuoServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		if("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			//取得參數
			try {
				Integer quoID = Integer.valueOf(req.getParameter("quoID"));
				//刪除資料
				SerQuoService serQuoSvc = new SerQuoService();
				serQuoSvc.deleteSerQuo(quoID);
				//刪除完成轉交頁面
				String url = "/frontend/ser_quo/getQuoByVdrID.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);
			} 
			 catch (Exception e) {
				 errorMsgs.add("資料失敗:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serQuo/listAllSerQuo.jsp");
					failureView.forward(req, res);
			}
		}
	}
}
