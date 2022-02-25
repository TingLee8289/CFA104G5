package ezs.ren_favorites.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import ezs.member.model.MemberVO;
import ezs.ren_favorites.model.RenFavoritesService;
import ezs.ren_favorites.model.RenFavoritesVO;

@WebServlet("/RenFavoritesServlet.do")
public class RenFavoritesServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Map<String, String[]> map = req.getParameterMap();
				
				/*************************** 2.開始查詢資料 *****************************************/
				RenFavoritesService renFavSvc = new RenFavoritesService();
				List<RenFavoritesVO> list  = renFavSvc.getAll(map);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("listOneRenFavorites", list);
				RequestDispatcher successView = req.getRequestDispatcher("/frontend/ren_favorites/listOneRenFavorites.jsp");
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ren_favorites/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllRenFavorites.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer favLisId = new Integer(req.getParameter("favLisId"));
				Integer favMemId = new Integer(req.getParameter("favMemId"));

				/*************************** 2.開始查詢資料 ****************************************/
				RenFavoritesService renFavSvc = new RenFavoritesService();
				RenFavoritesVO renFavoritesVO = renFavSvc.getOneRenFav(favLisId, favMemId);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("renFavoritesVO", renFavoritesVO); // 資料庫取出的VO物件,存入req
				String url = "/frontend/ren_favorites/update_ren_favorites_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_ren_favorites_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ren_favorites/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("COLLECTION".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			Integer favLisId = new Integer(req.getParameter("lisID"));
			
//			Integer favLisId = new Integer(req.getParameter("favLisId"));
			
			MemberVO memberVO = (MemberVO) req.getSession().getAttribute("memberVO");
			Integer favMemId =	memberVO.getMemID();
			java.sql.Timestamp favAddTime = null;
			try {
				favAddTime = new java.sql.Timestamp(System.currentTimeMillis());
//				favAddTime = java.sql.Timestamp.valueOf(req.getParameter("favAddTime").trim());
			} catch (IllegalArgumentException e) {
				favAddTime = new java.sql.Timestamp(System.currentTimeMillis());
				errorMsgs.add("請輸入日期及時間!");
			}
			int i = 0;
			try {
				RenFavoritesService renFavSvc = new RenFavoritesService();
				renFavSvc.addRenFav(favLisId, favMemId, favAddTime);
				i=1;
				//如果已收藏將會移除收藏
			} catch (Exception e) {
				if(i==0) {
					RenFavoritesService renFavSvc = new RenFavoritesService();
					renFavSvc.deleteRenFav(favLisId, favMemId);
				}
			}
		}
		
		

//		if ("update".equals(action)) { // 來自update_ren_favorites_input.jsp的請求
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//				Integer favLisId = new Integer(req.getParameter("favLisId").trim());
//				Integer favMemId = new Integer(req.getParameter("favMemId").trim());
//
//				java.sql.Timestamp favAddTime = null;
//				try {
//					favAddTime = java.sql.Timestamp.valueOf(req.getParameter("favAddTime").trim());
//				} catch (IllegalArgumentException e) {
//					favAddTime = new java.sql.Timestamp(System.currentTimeMillis());
//					errorMsgs.add("請輸入日期及時間!");
//				}
//
//				RenFavoritesVO renFavoritesVO = new RenFavoritesVO();
//				renFavoritesVO.setFavLisId(favLisId);
//				renFavoritesVO.setFavMemId(favMemId);
//				renFavoritesVO.setFavAddTime(favAddTime);
//				
//
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("renFavoritesVO", renFavoritesVO); // 含有輸入格式錯誤的VO物件,也存入req
//					RequestDispatcher failureView = req.getRequestDispatcher("/ren_favorites/update_ren_favorites_input.jsp");
//					failureView.forward(req, res);
//					return; // 程式中斷
//				}
//
//				/*************************** 2.開始修改資料 *****************************************/
//				RenFavoritesService renFavSvc = new RenFavoritesService();
//				renFavoritesVO = renFavSvc.updateRenFav(favLisId, favMemId, favAddTime);
//
//				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
//				req.setAttribute("renFavoritesVO", renFavoritesVO); // 資料庫update成功後,正確的的VO物件,存入req
//				String url = "/frontend/ren_favorites/listOneRenFavorites.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneRenFavorites.jsp
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 *************************************/
//			} catch (Exception e) {
//				errorMsgs.add("修改資料失敗:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ren_favorites/update_ren_favorites_input.jsp");
//				failureView.forward(req, res);
//			}
//		}

		if ("insert".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
//				MemberVO memberVO = (MemberVO) req.getSession().getAttribute("memberVO");
//				Integer favMemId =	memberVO.getMemID();				
//				Integer favLisId = new Integer(req.getParameter("favLisId").trim());
				
				Integer favMemId = new Integer(req.getParameter("favMemId").trim());
				Integer favLisId = new Integer(req.getParameter("favLisId").trim());


				java.sql.Timestamp favAddTime = null;
				try {
					favAddTime = new java.sql.Timestamp(System.currentTimeMillis());
//					favAddTime = java.sql.Timestamp.valueOf(req.getParameter("favAddTime").trim());
				} catch (IllegalArgumentException e) {
					favAddTime = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期及時間!");
				}

	
				RenFavoritesVO renFavoritesVO = new RenFavoritesVO();
				renFavoritesVO.setFavLisId(favLisId);
				renFavoritesVO.setFavMemId(favMemId);
				renFavoritesVO.setFavAddTime(favAddTime);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("renFavoritesVO", renFavoritesVO); // 含有輸入格式錯誤的VO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/ren_favorites/addRenFavorites.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				RenFavoritesService renFavSvc = new RenFavoritesService();
				renFavoritesVO = renFavSvc.addRenFav(favLisId, favMemId, favAddTime);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/frontend/ren_favorites/listOneRenFavorites.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllRenFavorites.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ren_favorites/addRenFavorites.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer favLisId = new Integer(req.getParameter("favLisId"));
				Integer favMemId = new Integer(req.getParameter("favMemId"));

				/*************************** 2.開始刪除資料 ***************************************/
				RenFavoritesService renFavSvc = new RenFavoritesService();
				renFavSvc.deleteRenFav(favLisId, favMemId);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/frontend/ren_favorites/listOneRenFavorites.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ren_favorites/listOneRenFavorites.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
