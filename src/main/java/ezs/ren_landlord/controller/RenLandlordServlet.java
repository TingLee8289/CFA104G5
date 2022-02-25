package ezs.ren_landlord.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import ezs.ren_landlord.model.*;

@WebServlet("/ren_landlord/RenLandlordServlet.do")
@MultipartConfig
public class RenLandlordServlet extends HttpServlet {

		protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			doPost(req, res);
		}
		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
			req.setCharacterEncoding("UTF-8");
			String action = req.getParameter("action");
			
			if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);

				try {
//					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					String str = req.getParameter("lddId");
//					if (!errorMsgs.isEmpty()) {
//						RequestDispatcher failureView = req
//								.getRequestDispatcher("/backend/ren/select.jsp");
//						failureView.forward(req, res);
//						return;//程式中斷
//					}
					
					Integer lddId = null;
						lddId = new Integer(str);
//					if (!errorMsgs.isEmpty()) {
//						RequestDispatcher failureView = req
//								.getRequestDispatcher("/backend/ren/select.jsp");
//						failureView.forward(req, res);
//						return;//程式中斷
//					}
					
					/***************************2.開始查詢資料*****************************************/
					RenLandlordService renlandlordSvc = new RenLandlordService();
					RenLandlordVO  renLandlordVO = renlandlordSvc.getOneLandlord(lddId);
					if (renLandlordVO == null) {
						errorMsgs.add("查無資料");
					}
					
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/backend/ren/select.jsp");
						failureView.forward(req, res);
						return;//程式中斷
					}

					/***************************3.查詢完成,準備轉交(Send the Success view)*************/
					req.setAttribute("renLandlordVO", renLandlordVO); // 資料庫取出的LandlordVO物件,存入req
					String url = "/backend/ren/listOneLandlord.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理*************************************/
				} catch (Exception e) {
					errorMsgs.add("無法取得資料:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/ren/select.jsp");
					failureView.forward(req, res);
				}
			}
			
			if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				
				try {
					/***************************1.接收請求參數****************************************/
					Integer lddId = new Integer(req.getParameter("lddId"));
					
					/***************************2.開始查詢資料****************************************/
					RenLandlordService renlandlordSvc = new RenLandlordService();
					RenLandlordVO renLandlordVO = renlandlordSvc.getOneLandlord(lddId);
									
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					req.setAttribute("renLandlordVO", renLandlordVO);         // 資料庫取出的LandlordVO物件,存入req
					String url = "/backend/ren/update_landlord_input.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/ren/listAllLandlord.jsp");
					failureView.forward(req, res);
				}
			}
			
			
			if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
				
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);

				try {
//					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					Integer lddId = new Integer(req.getParameter("lddId").trim());
					Integer lddMemId = new Integer(req.getParameter("lddMemId").trim());
					Integer lddApproval =new Integer(req.getParameter("lddApproval").trim());
					
					RenLandlordVO renLandlordVO = new RenLandlordVO();
					renLandlordVO.setLddId(lddId);
					renLandlordVO.setLddMemId(lddMemId);
					renLandlordVO.setLddApproval(lddApproval);
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("renLandlordVO", renLandlordVO); // 含有輸入格式錯誤的LandlordVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/backend/ren/update_landlord_input.jsp");
						failureView.forward(req, res);
						return; //程式中斷
					}
					
					/***************************2.開始修改資料*****************************************/
					RenLandlordService renLandlordSvc = new RenLandlordService();
					renLandlordVO = renLandlordSvc.updateLandlord(lddId,lddMemId,lddApproval);
					
					/***************************3.修改完成,準備轉交(Send the Success view)*************/
					req.setAttribute("renLandlordVO", renLandlordVO); // 資料庫update成功後,正確的的LandlordVO物件,存入req
					String url = "/backend/ren/listOneLandlord.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理*************************************/
				} catch (Exception e) {
					errorMsgs.add("修改資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/ren/update_landlord_input.jsp");
					failureView.forward(req, res);
				}
			}
			
			 if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs", errorMsgs);

					try {
						/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
						RenLandlordVO renLandlordVO = new RenLandlordVO();
						Integer lddMemId = new Integer(req.getParameter("lddMemId").trim());
						Part part = req.getPart("lddPic");

						byte[] lddPic = null;
						if (part == null || part.getSize() == 0) {
							req.setAttribute("renLandlordVO", renLandlordVO);
							RenLandlordService renLandlordSvc2 = new RenLandlordService();
							RenLandlordVO RenLandlordVO2 = renLandlordSvc2.getOneLandlord(lddMemId);
							lddPic = RenLandlordVO2.getLddPic();

						} else {
							req.setAttribute("renLandlordVO", renLandlordVO);
							InputStream in = part.getInputStream();
							lddPic = new byte[in.available()];
							in.read(lddPic);
							in.close();
						}						
						renLandlordVO.setLddMemId(lddMemId);
						renLandlordVO.setLddPic(lddPic);
						
						if (!errorMsgs.isEmpty()) {
							req.setAttribute("renLandlordVO", renLandlordVO); // 含有輸入格式錯誤的empVO物件,也存入req
							RequestDispatcher failureView = req
									.getRequestDispatcher("/frontend/ren_landlord/applyToLandlord.jsp");
							failureView.forward(req, res);
							return;
						}
						
						/***************************2.開始新增資料***************************************/
						RenLandlordService renLandlordSvc = new RenLandlordService();
						renLandlordVO = renLandlordSvc.addLandlord(lddMemId, lddPic);
						
						/***************************3.新增完成,準備轉交(Send the Success view)***********/
						String url = "/frontend/member/memberCenter/sellerMemberCenter.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
						successView.forward(req, res);				
						
						/***************************其他可能的錯誤處理**********************************/
					} catch (Exception e) {
						errorMsgs.add(e.getMessage());
						RequestDispatcher failureView = req
								.getRequestDispatcher("/frontend/ren_landlord/applyToLandlord.jsp");
						failureView.forward(req, res);
					}
				}
			
			
			
			if ("delete".equals(action)) { // 來自listAllEmp.jsp

				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
		
				try {
					/***************************1.接收請求參數***************************************/
					Integer lddId = new Integer(req.getParameter("lddId"));
					
					/***************************2.開始刪除資料***************************************/
					RenLandlordService renLandlordSvc = new RenLandlordService();
					renLandlordSvc.deleteLandlord(lddId);
					
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
					String url = "/backend/ren/listAllLandlord.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(req, res);
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("刪除資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backend/ren/listAllLandlord.jsp");
					failureView.forward(req, res);
				}
			}
			
		}
	}