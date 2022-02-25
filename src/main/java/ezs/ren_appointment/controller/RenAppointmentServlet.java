package ezs.ren_appointment.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.apache.jasper.tagplugins.jstl.core.If;

import ezs.member.model.MemberService;
import ezs.member.model.MemberVO;
import ezs.ren_appointment.model.RenAppointmentService;
import ezs.ren_appointment.model.RenAppointmentVO;

@WebServlet("/RenAppointmentServlet.do")
public class RenAppointmentServlet extends HttpServlet {

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
				String str = req.getParameter("aptId");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入預約單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_appointment/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer aptId = null;
				try {
					aptId = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("預約訂單ID編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_appointment/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				RenAppointmentService renAppSvc = new RenAppointmentService();
				RenAppointmentVO renAppointmentVO = renAppSvc.getOneRenApp(aptId);
				if (renAppointmentVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/ren_appointment/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("renAppointmentVO", renAppointmentVO); // 資料庫取出的renAppointmentVO物件,存入req
				String url = "/frontend/ren_appointment/listOneRenAppointment.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/ren_appointment/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer aptId = new Integer(req.getParameter("aptId"));

				/*************************** 2.開始查詢資料 ****************************************/
				RenAppointmentService renAppSvc = new RenAppointmentService();
				RenAppointmentVO renAppointmentVO = renAppSvc.getOneRenApp(aptId);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("renAppointmentVO", renAppointmentVO); // 資料庫取出的VO物件,存入req
				String url = "/frontend/ren_appointment/update_ren_appointment_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ren_appointment/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("LDDgetOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer aptId = new Integer(req.getParameter("aptId"));

				/*************************** 2.開始查詢資料 ****************************************/
				RenAppointmentService renAppSvc = new RenAppointmentService();
				RenAppointmentVO renAppointmentVO = renAppSvc.getOneRenApp(aptId);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("renAppointmentVO", renAppointmentVO); // 資料庫取出的VO物件,存入req
				String url = "/frontend/ren_appointment/LDDupdate_ren_appointment_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ren_appointment/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL"); 

			System.out.println("update");
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer aptId = new Integer(req.getParameter("aptId").trim());
				Integer aptMemId = new Integer(req.getParameter("aptMemId").trim());
				Integer aptLddId = new Integer(req.getParameter("aptLddId").trim());
				Integer aptLisId = new Integer(req.getParameter("aptLisId").trim());
				Integer aptStatus = 3;
				java.sql.Timestamp aptTime = null;
				try {
					aptTime = java.sql.Timestamp.valueOf(req.getParameter("aptTime").trim());
				} catch (IllegalArgumentException e) {
					aptTime = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期及時間!");
				}

				RenAppointmentVO renAppointmentVO = new RenAppointmentVO();
				renAppointmentVO.setAptId(aptId);
				renAppointmentVO.setAptMemId(aptMemId);
				renAppointmentVO.setAptLddId(aptLddId);
				renAppointmentVO.setAptLisId(aptLisId);
				renAppointmentVO.setAptStatus(aptStatus);
				renAppointmentVO.setAptTime(aptTime);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("renAppointmentVO", renAppointmentVO); // 含有輸入格式錯誤的VO,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/ren_appointment/update_ren_appointment_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				RenAppointmentService renAppSvc = new RenAppointmentService();
				renAppointmentVO = renAppSvc.updateRenApp(aptId, aptMemId, aptLddId, aptLisId, aptStatus, aptTime);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("renAppointmentVO", renAppointmentVO); // 資料庫update成功後,正確的的VO物件,存入req
				String url = "/frontend/ren_appointment/listOneRenAppointment.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_appointment/update_ren_appointment_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("LDDupdate".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL"); 

			System.out.println("update");
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer aptId = new Integer(req.getParameter("aptId").trim());
				Integer aptMemId = new Integer(req.getParameter("aptMemId").trim());
				Integer aptLddId = new Integer(req.getParameter("aptLddId").trim());
				Integer aptLisId = new Integer(req.getParameter("aptLisId").trim());
				Integer aptStatus = 3;
				java.sql.Timestamp aptTime = null;
				try {
					aptTime = java.sql.Timestamp.valueOf(req.getParameter("aptTime").trim());
				} catch (IllegalArgumentException e) {
					aptTime = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期及時間!");
				}

				RenAppointmentVO renAppointmentVO = new RenAppointmentVO();
				renAppointmentVO.setAptId(aptId);
				renAppointmentVO.setAptMemId(aptMemId);
				renAppointmentVO.setAptLddId(aptLddId);
				renAppointmentVO.setAptLisId(aptLisId);
				renAppointmentVO.setAptStatus(aptStatus);
				renAppointmentVO.setAptTime(aptTime);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("renAppointmentVO", renAppointmentVO); // 含有輸入格式錯誤的VO,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/ren_appointment/update_ren_appointment_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				RenAppointmentService renAppSvc = new RenAppointmentService();
				renAppointmentVO = renAppSvc.updateRenApp(aptId, aptMemId, aptLddId, aptLisId, aptStatus, aptTime);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("renAppointmentVO", renAppointmentVO); // 資料庫update成功後,正確的的VO物件,存入req
				String url = "/frontend/ren_appointment/LDDlistOneRenAppointment.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_appointment/update_ren_appointment_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("MemConfirm".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);		
			System.out.println("MemConfirm");

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer aptId = new Integer(req.getParameter("aptId").trim());
				Integer aptMemId = new Integer(req.getParameter("aptMemId").trim());
				Integer aptLddId = new Integer(req.getParameter("aptLddId").trim());
				Integer aptLisId = new Integer(req.getParameter("aptLisId").trim());
				Integer aptStatus = 1;
				java.sql.Timestamp aptTime = null;
				try {
					aptTime = java.sql.Timestamp.valueOf(req.getParameter("aptTime").trim());
				} catch (IllegalArgumentException e) {
					aptTime = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期及時間!");
				}

				RenAppointmentVO renAppointmentVO = new RenAppointmentVO();
				renAppointmentVO.setAptId(aptId);
				renAppointmentVO.setAptMemId(aptMemId);
				renAppointmentVO.setAptLddId(aptLddId);
				renAppointmentVO.setAptLisId(aptLisId);
				renAppointmentVO.setAptStatus(aptStatus);
				renAppointmentVO.setAptTime(aptTime);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("renAppointmentVO", renAppointmentVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/ren_appointment/listRenAppByMEM.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				RenAppointmentService renAppSvc = new RenAppointmentService();
				renAppointmentVO = renAppSvc.updateRenApp(aptId, aptMemId, aptLddId, aptLisId, aptStatus, aptTime);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("renAppointmentVO", renAppointmentVO); 
				RequestDispatcher successView = req
						.getRequestDispatcher("/frontend/ren_appointment/listRenAppByMEM.jsp");
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_appointment/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("LddConfirm".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);		
			System.out.println("LddConfirm");

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer aptId = new Integer(req.getParameter("aptId").trim());
				Integer aptMemId = new Integer(req.getParameter("aptMemId").trim());
				Integer aptLddId = new Integer(req.getParameter("aptLddId").trim());
				Integer aptLisId = new Integer(req.getParameter("aptLisId").trim());
				Integer aptStatus = 1;
				java.sql.Timestamp aptTime = null;
				try {
					aptTime = java.sql.Timestamp.valueOf(req.getParameter("aptTime").trim());
				} catch (IllegalArgumentException e) {
					aptTime = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期及時間!");
				}

				RenAppointmentVO renAppointmentVO = new RenAppointmentVO();
				renAppointmentVO.setAptId(aptId);
				renAppointmentVO.setAptMemId(aptMemId);
				renAppointmentVO.setAptLddId(aptLddId);
				renAppointmentVO.setAptLisId(aptLisId);
				renAppointmentVO.setAptStatus(aptStatus);
				renAppointmentVO.setAptTime(aptTime);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("renAppointmentVO", renAppointmentVO); // 含有輸入格式錯誤的VO,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/ren_appointment/listRenAppByLDD.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				RenAppointmentService renAppSvc = new RenAppointmentService();
				renAppointmentVO = renAppSvc.updateRenApp(aptId, aptMemId, aptLddId, aptLisId, aptStatus, aptTime);
				
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("renAppointmentVO", renAppointmentVO); // 資料庫取出的list物件,存入request
				RequestDispatcher successView = req
						.getRequestDispatcher("/frontend/ren_appointment/listRenAppByLDD.jsp");
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_appointment/listRenAppByLDD.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("MemCancel".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("MemCancel");

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer aptId = new Integer(req.getParameter("aptId").trim());

				Integer aptMemId = new Integer(req.getParameter("aptMemId").trim());

				Integer aptLddId = new Integer(req.getParameter("aptLddId").trim());

				Integer aptLisId = new Integer(req.getParameter("aptLisId").trim());

				Integer aptStatus = 2;

				java.sql.Timestamp aptTime = null;
				try {
					aptTime = java.sql.Timestamp.valueOf(req.getParameter("aptTime").trim());
				} catch (IllegalArgumentException e) {
					aptTime = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期及時間!");
				}

				RenAppointmentVO renAppointmentVO = new RenAppointmentVO();
				renAppointmentVO.setAptId(aptId);
				renAppointmentVO.setAptMemId(aptMemId);
				renAppointmentVO.setAptLddId(aptLddId);
				renAppointmentVO.setAptLisId(aptLisId);
				renAppointmentVO.setAptStatus(aptStatus);
				renAppointmentVO.setAptTime(aptTime);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("renAppointmentVO", renAppointmentVO); // 含有輸入格式錯誤的VO,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/ren_appointment/listRenAppByMEM.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				RenAppointmentService renAppSvc = new RenAppointmentService();
				renAppointmentVO = renAppSvc.updateRenApp(aptId, aptMemId, aptLddId, aptLisId, aptStatus, aptTime);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("renAppointmentVO", renAppointmentVO); // 資料庫取出的list物件,存入request
				RequestDispatcher successView = req
						.getRequestDispatcher("/frontend/ren_appointment/listRenAppByMEM.jsp");
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_appointment/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("LddCancel".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);		
			System.out.println("LddCancel");

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer aptId = new Integer(req.getParameter("aptId").trim());
				Integer aptMemId = new Integer(req.getParameter("aptMemId").trim());
				Integer aptLddId = new Integer(req.getParameter("aptLddId").trim());
				Integer aptLisId = new Integer(req.getParameter("aptLisId").trim());
				Integer aptStatus = 2;
				java.sql.Timestamp aptTime = null;
				try {
					aptTime = java.sql.Timestamp.valueOf(req.getParameter("aptTime").trim());
				} catch (IllegalArgumentException e) {
					aptTime = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期及時間!");
				}

				RenAppointmentVO renAppointmentVO = new RenAppointmentVO();
				renAppointmentVO.setAptId(aptId);
				renAppointmentVO.setAptMemId(aptMemId);
				renAppointmentVO.setAptLddId(aptLddId);
				renAppointmentVO.setAptLisId(aptLisId);
				renAppointmentVO.setAptStatus(aptStatus);
				renAppointmentVO.setAptTime(aptTime);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("renAppointmentVO", renAppointmentVO); // 含有輸入格式錯誤的VO,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/ren_appointment/listRenAppByLDD.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				RenAppointmentService renAppSvc = new RenAppointmentService();
				renAppointmentVO = renAppSvc.updateRenApp(aptId, aptMemId, aptLddId, aptLisId, aptStatus, aptTime);
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("renAppointmentVO", renAppointmentVO); // 資料庫取出的list物件,存入request
				RequestDispatcher successView = req
						.getRequestDispatcher("/frontend/ren_appointment/listRenAppByLDD.jsp");
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_appointment/listRenAppByLDD.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
//			try {

				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				Integer aptMemId = new Integer(req.getParameter("aptMemId").trim());
				Integer aptLddId = new Integer(req.getParameter("aptLddId").trim());
				Integer aptLisId = new Integer(req.getParameter("aptLisId").trim());
				Integer aptStatus = 0;

				java.sql.Timestamp aptTime = null;
				try {
					aptTime = java.sql.Timestamp.valueOf(req.getParameter("aptTime").trim());
				} catch (IllegalArgumentException e) {
					aptTime = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期及時間!");
				}

				java.sql.Timestamp aptTimestamp = null;
				try {
					aptTimestamp = new java.sql.Timestamp(System.currentTimeMillis());
				} catch (IllegalArgumentException e) {
					aptTimestamp = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期及時間!");
				}

				RenAppointmentVO renAppointmentVO = new RenAppointmentVO();
				renAppointmentVO.setAptLddId(aptLddId);
				renAppointmentVO.setAptLisId(aptLisId);
				renAppointmentVO.setAptStatus(aptStatus);
				renAppointmentVO.setAptTime(aptTime);
				renAppointmentVO.setAptTimestamp(aptTimestamp);

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("renAppointmentVO", renAppointmentVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/ren_appointment/addRenAppointment.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				RenAppointmentService renAppSvc = new RenAppointmentService();
				renAppointmentVO = renAppSvc.addRenApp(aptMemId, aptLddId, aptLisId, aptStatus, aptTime, aptTimestamp);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/frontend/ren_appointment/listRenAppByMEM.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/frontend/ren_appointment/addRenAppointment.jsp");
//				failureView.forward(req, res);
//			}
		}

		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer aptId = new Integer(req.getParameter("aptId"));

				/*************************** 2.開始刪除資料 ***************************************/
				RenAppointmentService renAppSvc = new RenAppointmentService();
				renAppSvc.deleteRenApp(aptId);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/frontend/ren_appointment/listRenAppByMEM.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ren_appointment/listRenAppByMEM.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("LDDdelete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer aptId = new Integer(req.getParameter("aptId"));

				/*************************** 2.開始刪除資料 ***************************************/
				RenAppointmentService renAppSvc = new RenAppointmentService();
				renAppSvc.deleteRenApp(aptId);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/frontend/ren_appointment/listRenAppByLDD.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ren_appointment/listRenAppByLDD.jsp");
				failureView.forward(req, res);
			}
		}

		
//		// 所有房客的預約單
//		if ("listRenAppByMEM".equals(action)) { // 來自select_page.jsp的複合查詢請求
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//			System.out.println("listrenappbymem test");
//			System.out.println("listrenappbymem test");
//
//			try {
//				/*************************** 1.將輸入資料轉為Map **********************************/
//				String str = req.getParameter("aptMemId");
//				System.out.println(str);
//				System.out.println("check1");
//				if (str == null || (str.trim()).length() == 0) {
//					errorMsgs.add("請輸入會員編號");
//					System.out.println("checknull");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/frontend/ren_appointment/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
//				
//				Integer aptMemId = null;
//				try {
//					aptMemId = new Integer(str);
//					System.out.println("check3");
//					System.out.println(aptMemId);
//				} catch (Exception e) {
//					errorMsgs.add("會員編號格式不正確");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/frontend/ren_appointment/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
//				
//				/*************************** 2.開始複合查詢 ***************************************/
//				System.out.println("check4");
//				RenAppointmentService renAppSvc = new RenAppointmentService();
//				List<RenAppointmentVO> list = renAppSvc.getAllMEM(aptMemId);
//				
//				if (list == null) {
//					errorMsgs.add("查無資料");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/frontend/ren_appointment/select_page.jsp");
//					failureView.forward(req, res);
//					return;//程式中斷
//				}
//				
//			
//				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
//				req.setAttribute("listRenAppByMEM", list); // 資料庫取出的list物件,存入request
//				RequestDispatcher successView = req
//						.getRequestDispatcher("/frontend/ren_appointment/listRenAppByMEM.jsp");
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ren_appointment/select_page.jsp");
//				failureView.forward(req, res);
//			}
//		}
//		
//		
//		
//		/// 所有房東的預約單
//		if ("listRenAppByLDD".equals(action)) { // 來自select_page.jsp的複合查詢請求
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//
//				/*************************** 1.將輸入資料轉為Map **********************************/
//				Map<String, String[]> map = req.getParameterMap();
//				
//				if(map.containsKey("apt_ldd_id")) {
//					String[] strs = map.get("apt_ldd_id");
//					String[] actions = map.get("action");
//					HttpSession session = req.getSession();
//					session.setAttribute("strs", strs);
//					session.setAttribute("actions", actions);
//				}
//
//				/*************************** 2.開始複合查詢 ***************************************/
//				RenAppointmentService renAppSvc = new RenAppointmentService();
//				List<RenAppointmentVO> list = renAppSvc.getAll(map);
//
//				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
//				req.setAttribute("listRenAppByLDD", list); // 資料庫取出的list物件,存入request
//				RequestDispatcher successView = req
//						.getRequestDispatcher("/frontend/ren_appointment/listRenAppByLDD.jsp");
//				successView.forward(req, res);
//
//				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ren_appointment/select_page.jsp");
//				failureView.forward(req, res);
//			}
//		}
	}
}