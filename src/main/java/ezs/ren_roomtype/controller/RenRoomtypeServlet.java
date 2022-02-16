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

@WebServlet("/frontend/ren_roomtype/RenRoomtypeServlet.do")
public class RenRoomtypeServlet extends HttpServlet{
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("getOne_For_Display".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String str = req.getParameter("rtID");
				if(str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入房型ID");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				
				Integer rtID = null;
				try {
					rtID = new Integer(str);
				
			}catch(Exception e) {
				
				
				
			}
		
		}
		
		
		
		
	}

}
