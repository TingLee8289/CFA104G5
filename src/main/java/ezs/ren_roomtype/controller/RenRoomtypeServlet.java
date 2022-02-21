package ezs.ren_roomtype.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.ren_roomtype.model.RenRoomtypeService;
import ezs.ren_roomtype.model.RenRoomtypeVO;

@WebServlet("/frontend/ren_roomtype/RenRoomtypeServlet.do")
public class RenRoomtypeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String str = req.getParameter("rtID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入房型ID");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				Integer rtID = null;
				try {
					rtID = new Integer(str);

			} catch (Exception e) {
				errorMsgs.add("房源ID格式不正確");
			}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
					failureView.forward(req, res);
					return;
			}
				/****************************2.開始查詢資料***********************/
				RenRoomtypeService renRoomtypeSvc = new RenRoomtypeService();
				RenRoomtypeVO renRoomtypeVO = renRoomtypeSvc.getOneRenRoomtype(rtID);
				if (renRoomtypeVO == null) {
					errorMsgs.add("查無資料");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				/************************3.查詢完成，準備轉交******************/
				req.setAttribute("renRoomtypeVO", renRoomtypeVO);
				String url = "/frontend/ren_listing/listOneListing.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/**********************其他可能的錯誤******************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		

				

				
	}
}
