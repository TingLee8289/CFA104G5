package ezs.ser_dmd.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
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

import ezs.ser_dmd.model.*;

@WebServlet("/ser_dmd/SerDmdServlet.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
//當數據量大於fileSizeThreshold值時，內容將被寫入磁碟
//上傳過程中無論是單個文件超過maxFileSize值，或者上傳的總量大於maxRequestSize 值都會拋出
//IllegalStateException 異常
public class SerDmdServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {// from select_page.jsp
			List<String> errorMsgs = new LinkedList<String>();
			// LinkedList 適用可拔插的資料
			/*
			 * Store this set in the request scope, in case we need to send the ErrorPage
			 * view.
			 */
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 1.接收請求參數 - 輸入格式的錯誤處理
				String str = req.getParameter("serDmdID");
				if (str == null || (str.trim().length() == 0)) {
					errorMsgs.add("請輸入需求單編號");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serDmd/select_page.jsp");
					failureView.forward(req, res);
					return;// 中斷程式
				}
				Integer serDmdID = null;
				try {
					serDmdID = Integer.valueOf(str);
//					System.out.println(str);
				} catch (Exception e) {
					errorMsgs.add("需求單編號不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serDmd/select_page.jsp");
					failureView.forward(req, res);
					return;
				}

				// 2.開始查詢資料
				SerDmdService dao = new SerDmdService();
				SerDmdVO serDmdVO = dao.getOneSerDmd(serDmdID);
				if (serDmdVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serDmd/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				// 3.查詢完成,準備轉交(Send the Success view)
				req.setAttribute("serDmdVO", serDmdVO);// 資料庫取出的empVO物件,存入req
				String url = "/backend/ser/serDmd/listOneSerDmd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
			} catch (Exception e) {// 其他可能錯誤處理
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serDmd/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// LinkedList 適用可拔插的資料
			/*
			 * Store this set in the request scope, in case we need to send the ErrorPage
			 * view.
			 */
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				// 1.接收請求參數
				Integer serDmdID = new Integer(req.getParameter("dmdID"));
				// 2.開始查詢資料
				SerDmdService serDmdSvc = new SerDmdService();
				SerDmdVO serDmdVO = serDmdSvc.getOneSerDmd(serDmdID);

				// 3.查詢完成,準備轉交(Send the Success view)
				req.setAttribute("serDmdVO", serDmdVO);// 資料庫取出的empVO物件,存入req
				String url = "/backend/ser/serDmd/update_serDmd_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
			} catch (Exception e) {// 其他可能錯誤處理
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serDmd/select_page.jsp");
				failureView.forward(req, res);
			}

		}
		// 來自listAllEmp.jsp的請求
		if ("update".equals(action)) {// req from add
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				// 1.接收請求參數
				Integer serDmdID = new Integer(req.getParameter("dmdID"));
				Byte dmdStatus = Byte.valueOf(req.getParameter("dmdStatus"));

				Integer dmdMemID = Integer.valueOf(req.getParameter("dmdMemID"));
				Integer dmdSerClaID = Integer.valueOf(req.getParameter("dmdSerClaID"));
				String dmdName = req.getParameter("dmdName");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z_)]{2,50}$";
				if (dmdName == null || dmdName.trim().length() == 0) {
					errorMsgs.add("請輸入姓名");
				} else if (!dmdName.trim().matches(nameReg)) {
					errorMsgs.add("姓名: 只能是中、英文字母和_ , 且長度必需在2到50之間");
				}
				String dmdTel = req.getParameter("dmdTel");
//				String TelReg = "0\\\\d{2,3}[-]?\\\\d{7,8}||0\\\\d{2,3}\\\\s?\\\\d{7,8}|13[0-9]\\\\d{8}|15[1089]\\\\d{8}";
				if (dmdTel == null || dmdTel.trim().length() == 0) {
					errorMsgs.add("請輸入電話號碼");
				}
				String dmdMail = req.getParameter("dmdMail");
				String emailReg = "^\\w{1,63}@[a-zA-Z0-9]{2,63}\\.[a-zA-Z]{2,63}(\\.[a-zA-Z]{2,63})?$";
				if (dmdTel == null || dmdTel.trim().length() == 0) {
					errorMsgs.add("請輸入信箱");
				} else if (!dmdMail.trim().matches(emailReg)) {
					errorMsgs.add("信箱格式錯誤");
				}
				String dmdCounty = req.getParameter("dmdCounty");
				String dmdRegion = req.getParameter("dmdRegion");
				String dmdAddress = req.getParameter("dmdAddress");
				String dmdSpaceClass = req.getParameter("dmdSpaceClass");
				Integer dmdSquare = 0;
				try {
					dmdSquare = Integer.valueOf(req.getParameter("dmdSquare").trim());
				} catch (NumberFormatException e) {
					dmdSquare = 0;
					errorMsgs.add("坪數請填數字.");
				}
				Integer dmdBudget = 0;
				try {
					dmdBudget = Integer.valueOf(req.getParameter("dmdBudget").trim());
				} catch (NumberFormatException e) {
					dmdBudget = 0;
					errorMsgs.add("預算請填數字.");
				}
				String dmdIntro = req.getParameter("dmdIntro");
				byte[] dmdPic = null;
				Collection<Part> parts = req.getParts();
				for (Part part : parts) {
					if (part.getContentType() != null) {
						InputStream in = part.getInputStream();
						dmdPic = new byte[in.available()];
						in.read(dmdPic);
						in.close();
					}
				}

				SerDmdVO serDmdVO = new SerDmdVO();
				serDmdVO.setDmdID(serDmdID);
				serDmdVO.setDmdStatus(dmdStatus);
				serDmdVO.setDmdMemID(dmdMemID);
				serDmdVO.setDmdSerClaID(dmdSerClaID);
				serDmdVO.setDmdName(dmdName);
				serDmdVO.setDmdTel(dmdTel);
				serDmdVO.setDmdMail(dmdMail);
				serDmdVO.setDmdCounty(dmdCounty);
				serDmdVO.setDmdRegion(dmdRegion);
				serDmdVO.setDmdAddress(dmdAddress);
				serDmdVO.setDmdSpaceClass(dmdSpaceClass);
				serDmdVO.setDmdSquare(dmdSquare);
				serDmdVO.setDmdBudget(dmdBudget);
				serDmdVO.setDmdIntro(dmdIntro);
				serDmdVO.setDmdPic(dmdPic);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("serDmdVO", serDmdVO); // 含有輸入格式錯誤的VO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serDmd/addSerDmd.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始修改資料 ***************************************/
				SerDmdService serDmdSvc = new SerDmdService();
				serDmdVO = serDmdSvc.updateSerDmd(serDmdID, dmdStatus, dmdMemID, dmdSerClaID, dmdName, dmdTel, dmdMail,
						dmdCounty, dmdRegion, dmdAddress, dmdSpaceClass, dmdSquare, dmdBudget, dmdIntro, dmdPic);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				String url = "/frontend/ser_dmd/getByDmdMemID.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/serDmd/addSerDmd.jsp");
				failureView.forward(req, res);
			}

		}

		if ("insert".equals(action)) {// req from add
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				Byte dmdStatus = Byte.valueOf(req.getParameter("dmdStatus"));

				Integer dmdMemID = Integer.valueOf(req.getParameter("dmdMemID"));
				Integer dmdSerClaID = Integer.valueOf(req.getParameter("dmdSerClaID"));
				String dmdName = req.getParameter("dmdName");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z_)]{2,50}$";
				if (dmdName == null || dmdName.trim().length() == 0) {
					errorMsgs.add("請輸入姓名");
				} else if (!dmdName.trim().matches(nameReg)) {
					errorMsgs.add("姓名: 只能是中、英文字母和_ , 且長度必需在2到50之間");
				}
				String dmdTel = req.getParameter("dmdTel");
//				String TelReg = "0\\\\d{2,3}[-]?\\\\d{7,8}||0\\\\d{2,3}\\\\s?\\\\d{7,8}|13[0-9]\\\\d{8}|15[1089]\\\\d{8}";
				if (dmdTel == null || dmdTel.trim().length() == 0) {
					errorMsgs.add("請輸入電話號碼");
				}
				String dmdMail = req.getParameter("dmdMail");
				String emailReg = "^\\w{1,63}@[a-zA-Z0-9]{2,63}\\.[a-zA-Z]{2,63}(\\.[a-zA-Z]{2,63})?$";
				if (dmdTel == null || dmdTel.trim().length() == 0) {
					errorMsgs.add("請輸入信箱");
				} else if (!dmdMail.trim().matches(emailReg)) {
					errorMsgs.add("信箱格式錯誤");
				}
				String dmdCounty = req.getParameter("dmdCounty");
				String dmdRegion = req.getParameter("dmdRegion");
				String dmdAddress = req.getParameter("dmdAddress");
				String dmdSpaceClass = req.getParameter("dmdSpaceClass");
				Integer dmdSquare = 0;
				try {
					dmdSquare = Integer.valueOf(req.getParameter("dmdSquare").trim());
				} catch (NumberFormatException e) {
					dmdSquare = 0;
					errorMsgs.add("坪數請填數字.");
				}
				Integer dmdBudget = 0;
				try {
					dmdBudget = Integer.valueOf(req.getParameter("dmdBudget").trim());
				} catch (NumberFormatException e) {
					dmdBudget = 0;
					errorMsgs.add("預算請填數字.");
				}
				String dmdIntro = req.getParameter("dmdIntro");

				byte[] dmdPic = null;
				Collection<Part> parts = req.getParts();
				for (Part part : parts) {
					if (part.getContentType() != null) {
						InputStream in = part.getInputStream();
						dmdPic = new byte[in.available()];
						in.read(dmdPic);
						in.close();
					}
				}

				SerDmdVO serDmdVO = new SerDmdVO();
				serDmdVO.setDmdStatus(dmdStatus);
				serDmdVO.setDmdMemID(dmdMemID);
				serDmdVO.setDmdSerClaID(dmdSerClaID);
				serDmdVO.setDmdName(dmdName);
				serDmdVO.setDmdTel(dmdTel);
				serDmdVO.setDmdMail(dmdMail);
				serDmdVO.setDmdCounty(dmdCounty);
				serDmdVO.setDmdRegion(dmdRegion);
				serDmdVO.setDmdAddress(dmdAddress);
				serDmdVO.setDmdSpaceClass(dmdSpaceClass);
				serDmdVO.setDmdSquare(dmdSquare);
				serDmdVO.setDmdBudget(dmdBudget);
				serDmdVO.setDmdIntro(dmdIntro);
				serDmdVO.setDmdPic(dmdPic);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("serDmdVO", serDmdVO); // 含有輸入格式錯誤的VO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_dmd/addSerDmd.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				SerDmdService serDmdSvc = new SerDmdService();
				serDmdVO = serDmdSvc.addSerDmd(dmdStatus, dmdMemID, dmdSerClaID, dmdName, dmdTel, dmdMail, dmdCounty,
						dmdRegion, dmdAddress, dmdSpaceClass, dmdSquare, dmdBudget, dmdIntro, dmdPic);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/frontend/ser_dmd/getByDmdMemID.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_dmd/addSerDmd.jsp");
				failureView.forward(req, res);
			}

		}
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer dmdID = new Integer(req.getParameter("dmdID"));

				/*************************** 2.開始刪除資料 ***************************************/
				SerDmdService serDmdSvc = new SerDmdService();
				serDmdSvc.deleteSerDmd(dmdID);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/frontend/ser_dmd/getByDmdMemID.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_dmd/getByDmdMemID.jsp");
				failureView.forward(req, res);
			}
		}
	}
//	//取出上傳的檔案名稱 (因為API未提供method,所以必須自行撰寫)
//	  public String getFileNameFromPart(Part part) { 
//	    String header = part.getHeader("content-disposition"); //從前面第一個範例(版本1-基本測試)可得知此head的值
//	    String filename = header.substring(header.lastIndexOf("=") + 2, header.length() - 1);
//	    if (filename.length() == 0) { 
//	        return null; 
//	    } 
//	    return filename; 
//	  }
}
