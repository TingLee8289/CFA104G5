package ezs.ren_lease.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.ren_landlord.model.RenLandlordVO;
import ezs.ren_lease.model.*;

@WebServlet("/ren_lease/RenLeaseServlet.do")

public class RenLeaseServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("lseId");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入租賃單編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_lease/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer lseId = null;
				try {
					lseId = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("租賃單編號格式不正確");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_lease/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				/***************************2.開始查詢資料*****************************************/
				RenLeaseService renLeaseSvc = new RenLeaseService();
				RenLeaseVO renLeaseVO = renLeaseSvc.getOneRenLease(lseId);

				if (renLeaseVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_lease/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("renLeaseVO", renLeaseVO); // 資料庫取出的empVO物件,存入req
				String url = "/frontend/ren_lease/listOneLease.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_lease/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
//		
//		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			try {
//				/***************************1.接收請求參數****************************************/
//				Integer empno = new Integer(req.getParameter("empno"));
//				
//				/***************************2.開始查詢資料****************************************/
//				EmpService empSvc = new EmpService();
//				EmpVO empVO = empSvc.getOneEmp(empno);
//								
//				/***************************3.查詢完成,準備轉交(Send the Success view)************/
//				req.setAttribute("empVO", empVO);         // 資料庫取出的empVO物件,存入req
//				String url = "/emp/update_emp_input.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
//				successView.forward(req, res);
//
//				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/listAllEmp.jsp");
//				failureView.forward(req, res);
//			}
//		}
//		
//		
//		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
//			
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//		
//			try {
//				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
//				Integer empno = new Integer(req.getParameter("empno").trim());
//				
//				String ename = req.getParameter("ename");
//				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//				if (ename == null || ename.trim().length() == 0) {
//					errorMsgs.add("員工姓名: 請勿空白");
//				} else if(!ename.trim().matches(enameReg)) { //以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//	            }
//				
//				String job = req.getParameter("job").trim();
//				if (job == null || job.trim().length() == 0) {
//					errorMsgs.add("職位請勿空白");
//				}	
//				
//				java.sql.Date hiredate = null;
//				try {
//					hiredate = java.sql.Date.valueOf(req.getParameter("hiredate").trim());
//				} catch (IllegalArgumentException e) {
//					hiredate=new java.sql.Date(System.currentTimeMillis());
//					errorMsgs.add("請輸入日期!");
//				}
//
//				Double sal = null;
//				try {
//					sal = new Double(req.getParameter("sal").trim());
//				} catch (NumberFormatException e) {
//					sal = 0.0;
//					errorMsgs.add("薪水請填數字.");
//				}
//
//				Double comm = null;
//				try {
//					comm = new Double(req.getParameter("comm").trim());
//				} catch (NumberFormatException e) {
//					comm = 0.0;
//					errorMsgs.add("獎金請填數字.");
//				}
//
//				Integer deptno = new Integer(req.getParameter("deptno").trim());
//
//				EmpVO empVO = new EmpVO();
//				empVO.setEmpno(empno);
//				empVO.setEname(ename);
//				empVO.setJob(job);
//				empVO.setHiredate(hiredate);
//				empVO.setSal(sal);
//				empVO.setComm(comm);
//				empVO.setDeptno(deptno);
//
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("empVO", empVO); // 含有輸入格式錯誤的empVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/emp/update_emp_input.jsp");
//					failureView.forward(req, res);
//					return; //程式中斷
//				}
//				
//				/***************************2.開始修改資料*****************************************/
//				EmpService empSvc = new EmpService();
//				empVO = empSvc.updateEmp(empno, ename, job, hiredate, sal,comm, deptno);
//				
//				/***************************3.修改完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("empVO", empVO); // 資料庫update成功後,正確的的empVO物件,存入req
//				String url = "/emp/listOneEmp.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
//				successView.forward(req, res);
//
//				/***************************其他可能的錯誤處理*************************************/
//			} catch (Exception e) {
//				errorMsgs.add("修改資料失敗:"+e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/update_emp_input.jsp");
//				failureView.forward(req, res);
//			}
//		}

        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				Integer lseId = new Integer(req.getParameter("lseId"));
				Integer lseMemId = new Integer(req.getParameter("lseMemId"));
				Integer lseLisId = new Integer(req.getParameter("lseLisId"));
				Integer lseLddId = new Integer(req.getParameter("lseLddId"));
				Integer lseLddScore = new Integer(req.getParameter("lseLddScore"));
				
				String lseLddTxt = req.getParameter("lseLddTxt").trim();
				if (lseLddTxt == null || lseLddTxt.trim().length() == 0) {
					errorMsgs.add("職位請勿空白");
				}
				
				Integer lseTntScore = new Integer(req.getParameter("lseTntScore"));

				
				String lseTntTxt = req.getParameter("lseTntTxt").trim();
				if (lseTntTxt == null || lseTntTxt.trim().length() == 0) {
					errorMsgs.add("職位請勿空白");
				}
				
				Integer lseStatus = new Integer(req.getParameter("lseStatus").trim());

				java.sql.Timestamp lseTimestamp = null;
				try {
					lseTimestamp = java.sql.Timestamp.valueOf(req.getParameter("lseTimestamp").trim());
				} catch (IllegalArgumentException e) {
					lseTimestamp=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				
				java.sql.Date lseStart = null;
				try {
					lseStart = java.sql.Date.valueOf(req.getParameter("lseStart").trim());
				} catch (IllegalArgumentException e) {
					lseStart=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				java.sql.Date lseEnd = null;
				try {
					lseEnd = java.sql.Date.valueOf(req.getParameter("lseEnd").trim());
				} catch (IllegalArgumentException e) {
					lseEnd=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				
				
				
				RenLeaseVO renLeaseVO = new RenLeaseVO();
				renLeaseVO.setLseId(lseId);
				renLeaseVO.setLseMemId(lseMemId);
				renLeaseVO.setLseLisId(lseLisId);
				renLeaseVO.setLseLddId(lseLddId);
				renLeaseVO.setLseLddScore(lseLddScore);
				renLeaseVO.setLseLddTxt(lseLddTxt);
				renLeaseVO.setLseTntScore(lseTntScore);
				renLeaseVO.setLseTntTxt(lseTntTxt);
				renLeaseVO.setLseStatus(lseStatus);
				renLeaseVO.setLseTimestamp(lseTimestamp);
				renLeaseVO.setLseStart(lseStart);
				renLeaseVO.setLseEnd(lseEnd);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("renLeaseVO", renLeaseVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_lease/addLease.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				RenLeaseService renLeaseSvc = new RenLeaseService();
				renLeaseVO = renLeaseSvc.addRenLease(lseMemId,lseLisId,lseLddId,lseLddScore,lseLddTxt,lseTntScore,lseTntTxt,lseStatus,lseTimestamp,lseStart, lseEnd);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/frontend/ren_lease/listAllLease.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_lease/addLease.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer lseId = new Integer(req.getParameter("lseId"));
				
				/***************************2.開始刪除資料***************************************/
				RenLeaseService renLeaseSvc = new RenLeaseService();
				renLeaseSvc.deleteRenLease(lseId);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/frontend/ren_lease/listAllLease.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_lease/listAllLease.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
