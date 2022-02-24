package ezs.ser_quo.controller;

import java.io.IOException;
import java.math.BigDecimal;
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

@WebServlet("/ser_quo/RejectQuoServlet.do")
public class RejectQuoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");

		if ("rejectQuo".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				// 接收請求參數
				Integer quoID = Integer.valueOf(req.getParameter("quoID"));
				// 開始查詢資料
				SerQuoService serQuoSvc = new SerQuoService();
				SerQuoVO serQuoVO = serQuoSvc.getOneSerQuo(quoID);
				
				serQuoVO.setQuoID(quoID);
				Byte quoStatus = ((byte) 2);

				// 2. addquo

				serQuoVO = serQuoSvc.updateSerQuo(quoID, quoStatus, serQuoVO.getQuoDmdID(), serQuoVO.getQuoVdrID(),
						serQuoVO.getQuoDate(), serQuoVO.getQuoExpiryDate(), serQuoVO.getQuoItem(),
						serQuoVO.getQuoTotalPrice());
				// 3.新增完成，轉交
				String url = "/frontend/ser_dmd/getByDmdMemID.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);
				// 其他錯誤處理
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serQuo/listOneSerQuo.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
