package ezs.ser_vdr.controller;

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

import ezs.ser_vdr.model.SerVdrService;
import ezs.ser_vdr.model.SerVdrVO;


@WebServlet("/frontend/ser_vdr/InsertSerVdrServlet.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class InsertSerVdrServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				Integer vdrID = Integer.valueOf(req.getParameter("vdrID"));
				
				
				Byte vdrStatus =  Byte.valueOf(req.getParameter("vdrStatus"));
				
				

				String vdrName = req.getParameter("vdrName");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9)]{2,50}$";
				if (vdrName == null || vdrName.trim().length() == 0) {
					errorMsgs.add("廠商名稱: 請勿空白");
				} else if (!vdrName.trim().matches(nameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("廠商名稱: 只能是中、英文字母、數字 , 且長度必需在2到50之間");
				}

				String vdrTel = req.getParameter("vdrTel").trim();
				String telReg = "^[(0-9)]{10}$";// 檢查手機看市話需不需要
				if (vdrTel == null || vdrTel.trim().length() == 0) {
					errorMsgs.add("電話請勿空白");
				} else if (!vdrTel.trim().matches(telReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("請重新輸入電話");
				}

				String vdrVatno = req.getParameter("vdrVatno").trim();
				String vatnoReg = "^[(0-8)]{8}$";// 統一編號可以null
				if (!vdrTel.trim().matches(telReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("請重新輸入統一編號");
				}
				

				String vdrCounty = req.getParameter("vdrCounty").trim();
				String countyReg = "^[(\\u4e00-\\u9fa5)]{3,20}$";// 檢查縣市三個字?
				if (vdrCounty == null || vdrCounty.trim().length() == 0) {
					errorMsgs.add("縣市名稱請勿空白");
				} else if (!vdrCounty.trim().matches(countyReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("請重新輸入縣市名稱");
				}

				String vdrDist = req.getParameter("vdrDist").trim();
				String distReg = "^[(\\u4e00-\\u9fa5)]{3,20}$";// 檢查地區三個字?
				if (vdrDist == null || vdrDist.trim().length() == 0) {
					errorMsgs.add("地區請勿空白");
				} else if (!vdrDist.trim().matches(distReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("請重新輸入地區");
				}

				String vdrAddr = req.getParameter("vdrAddr").trim();
				String addrReg = "^[(\\u4e00-\\u9fa5)(0-9)]{5,50}$";
				if (vdrAddr == null || vdrAddr.trim().length() == 0) {
					errorMsgs.add("詳細地址請勿空白");
				} else if (!vdrAddr.trim().matches(addrReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("請重新輸入詳細地址，最少五個字");
				}

				String vdrOpen = req.getParameter("vdrOpen").trim();
			//	String openReg = "^[(0-12){1}:(0-59){1}-(0-24){1}:(0-59){1}]$";// 檢查語法有沒有問題
//				if (vdrOpen == null || vdrOpen.trim().length() == 0) {
//					errorMsgs.add("營業時間請勿空白");
			//	} else if (!vdrOpen.trim().matches(openReg)) { // 以下練習正則(規)表示式(regular-expression)
			//		errorMsgs.add("請重新輸入營業時間，使用24小時制表示，例如8:00-17:00");
			//	}

				String vdrIntro = req.getParameter("vdrIntro").trim();
//				String introReg = "^[(\\u4e00-\\u9fa5)]{20,300}$";
//				if (vdrIntro == null || vdrIntro.trim().length() == 0) {
//					errorMsgs.add("廠商簡介請勿空白");
//				} else if (!vdrIntro.trim().matches(introReg)) { // 以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("請重新輸入廠商簡介，不得少於20個字以內");
//				}

				// byte[] vdrPic = new Byte(req.getParameter("vdrPic"));
				InputStream in = req.getPart("vdrPic").getInputStream();// 廠商可以不上傳照片
				byte[] vdrPic = null;
				if (in.available() != 0) {
					vdrPic = new byte[in.available()];
					in.read(vdrPic);
					in.close();
				}

				Integer vdrRevCount = new Integer(req.getParameter("vdrRevCount").trim());

				Integer vdrRevScore = new Integer(req.getParameter("vdrRevScore").trim());
				
				SerVdrVO serVdrVO = new SerVdrVO();
				
				serVdrVO.setVdrID(vdrID);
				serVdrVO.setVdrStatus(vdrStatus);
				serVdrVO.setVdrName(vdrName);
				serVdrVO.setVdrTel(vdrTel);
				serVdrVO.setVdrVatno(vdrVatno);
				serVdrVO.setVdrCounty(vdrCounty);
				serVdrVO.setVdrDist(vdrDist);
				serVdrVO.setVdrAddr(vdrAddr);
				serVdrVO.setVdrOpen(vdrOpen);
				serVdrVO.setVdrIntro(vdrIntro);
				serVdrVO.setVdrPic(vdrPic);
				serVdrVO.setVdrRevCount(vdrRevCount);
				serVdrVO.setVdrRevScore(vdrRevScore);
				
				
				
				
			


				/*************************** 2.開始新增資料 ***************************************/
				SerVdrService servdrSvc = new SerVdrService();
				try {
					servdrSvc.addSerVdr(vdrID, vdrStatus, vdrName, vdrTel, vdrVatno, vdrCounty, vdrDist, vdrAddr, vdrOpen, vdrIntro, vdrPic, vdrRevCount, vdrRevScore);
				} catch(RuntimeException e) {
					errorMsgs.add("該廠商編號已重複註冊");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("serVdrVO", serVdrVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_vdr/addSerVdr.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/frontend/ser_vdr/listOneSerVdr.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_vdr/addSerVdr.jsp");
				failureView.forward(req, res);
			}
		}
	}
	
}
