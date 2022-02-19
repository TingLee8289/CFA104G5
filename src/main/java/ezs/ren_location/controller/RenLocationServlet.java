package ezs.ren_location.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.ren_location.model.RenLocationService;
import ezs.ren_listing.model.*;
import ezs.ren_location.model.*;

@WebServlet("/frontend/ren_listing/RenLocationServlet.do")
public class RenLocationServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");   //<--- 已經由 SetCharacterEncodingFilter 濾器解決 Query String 之編碼問題了
		String action = req.getParameter("action");
		
		if("listLocations_BylisAreaID".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*****************1.接收請求參數_輸入格式的錯誤處理******************/
				Integer lisAreaID = new Integer(req.getParameter("lisAreaID"));
				/*************************** 2.開始查詢資料 ****************************************/
				RenLocationService renLocationSvc = new RenLocationService();
				Set<RenListingVO> set = renLocationSvc.getRenListingByLisAreaID(lisAreaID);
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("listEmps_ByLocID", set);    // 資料庫取出的list物件,存入request
				String urlString = null;
//				if ("listLocations_BylisAreaID".equals(action))
//					url = "/frontend/renLocation/listEmps_ByDeptno.jsp";        // 成功轉交 dept/listEmps_ByDeptno.jsp
//				else if ("istLocations_ByLocID_B".equals(action))
//					url = "/dept/listAllDept.jsp";              // 成功轉交 dept/listAllDept.jsp
//
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
//
                 }catch (Exception e) {
					// TODO: handle exception
				}
		}
			}
			}
