package ezs.member.controller;

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

import ezs.member.model.MemberService;
import ezs.member.model.MemberVO;

@WebServlet("/member/MemberServletUpdate.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MemberServletUpdate extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		// getOneMemInfo Frontend
		if ("getOneMem_DisplayFrontEnd".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("memID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer memID = null;
				try {
					memID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/select_page.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始查詢資料 *****************************************/
				MemberService memSvc = new MemberService();
				MemberVO memberVO = memSvc.getOneMember(memID);
				if (memberVO == null) {
					errorMsgs.add("查無資料");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/select_page.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("memberVO", memberVO);
				String url = "/frontend/member/listOneMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		// getOneMemInfo Backend
		if ("getOneMem_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("memID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/member/listAllMember.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer memID = null;
				try {
					memID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/member/listAllMember.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始查詢資料 *****************************************/
				MemberService memSvc = new MemberService();
				MemberVO memberVO = memSvc.getOneMember(memID);
				if (memberVO == null) {
					errorMsgs.add("查無資料");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/member/listAllMember.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("memberVO", memberVO);
				String url = "/backend/member/listOneMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/member/listAllMember.jsp");
				failureView.forward(req, res);
			}
		}

		// frontend member update
		if ("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer memID = new Integer(req.getParameter("memID").trim());

				/*************************** 2.開始新增資料 ***************************************/
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMember(memID);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("memberVO", memberVO);
				String url = "/frontend/member/updateMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/listOneMember.jsp");
				failureView.forward(req, res);
			}
		}

		// frontend member update
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

			try {
				
				String memPhoneReg = "^09[0-9]{8}$";
				String memEmailReg = "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z]+$";
				
			Integer memID = new Integer(req.getParameter("memID").trim());

			String memPassword = req.getParameter("memPassword");
			if (memPassword == null || memPassword.trim().length() == 0) {
				errorMsgs.add("密碼請勿空白");
			}

			String memName = req.getParameter("memName");
			if (memName == null || memName.trim().length() == 0) {
				errorMsgs.add("會員名稱請勿空白");
			}
			String memPhone = req.getParameter("memPhone");
			if (memPhone == null || memPhone.trim().length() == 0) {
				errorMsgs.add("電話請勿空白");
			}else if (!memPhone.trim().matches(memPhoneReg)) {
				errorMsgs.add("電話格式不符，請重新輸入");
			}
			String memAddress = req.getParameter("memAddress");
			if (memAddress == null || memAddress.trim().length() == 0) {
				errorMsgs.add("地址請勿空白");
			}
			String memEmail = req.getParameter("memEmail");
			if (memEmail == null || memEmail.trim().length() == 0) {
				errorMsgs.add("email請勿空白");
			}else if (!memEmail.trim().matches(memEmailReg)){
				errorMsgs.add("email格式不符，請重新輸入");
			}
			
			String memUsername = new String(req.getParameter("memUsername"));
			

//				byte[] memHeadshot = null;
//				Collection<Part> parts = req.getParts();
//				for (Part part: parts) {
//					if(part.getContentType()!= null) {
//						InputStream in = part.getInputStream();
//						memHeadshot = new byte[in.available()];
//						in.read(memHeadshot);
//						in.close();
//					}
//				}

			byte[] memHeadshot = null;
			Collection<Part> parts = req.getParts();
			for (Part part : parts) {
				String str = part.getContentType();
//				System.out.println("part.getContentType()=" + str);
				if (str != null) {
					if (str.equals("application/octet-stream")) {					
						MemberService memSvc = new MemberService();
						MemberVO memberVO = memSvc.getOneMember(memID);
						memHeadshot = memberVO.getMemHeadshot();
					} else {
						InputStream in = part.getInputStream();
						memHeadshot = new byte[in.available()];
						in.read(memHeadshot);
						in.close();
					}
				}
			}
			
			
			String memVatno = req.getParameter("memVatno");
			if (!(memVatno == null)) {
			if (memVatno.trim().length() == 0) {
				memVatno = "不須統編";
			}}

			MemberVO memberVO = new MemberVO();
			memberVO.setMemID(memID);
			memberVO.setMemPassword(memPassword);
			memberVO.setMemName(memName);
			memberVO.setMemPhone(memPhone);
			memberVO.setMemAddress(memAddress);
			memberVO.setMemEmail(memEmail);
			memberVO.setMemVatno(memVatno);
			memberVO.setMemHeadshot(memHeadshot);
			memberVO.setMemUsername(memUsername);
			

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memberVO", memberVO);
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/updateMember.jsp");
				failureView.forward(req, res);
				return;
			}
			/*************************** 2.開始新增資料 ***************************************/
			MemberService memberSvc = new MemberService();
			memberVO = memberSvc.updateMember(memID, memPassword, memName, memPhone, memAddress, memEmail, memHeadshot,
					memVatno, memUsername);

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			req.setAttribute("memberVO", memberVO);
			String url = "/frontend/member/listOneMember.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/updateMember.jsp");
				failureView.forward(req, res);
			}
		}

		
		
//==========================================================================================================
		// backend member update
		if ("getOneMemUpdate".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("getOneMemUpdate");
			
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer memID = new Integer(req.getParameter("memID").trim());

				/*************************** 2.開始新增資料 ***************************************/
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMember(memID);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				req.setAttribute("memberVO", memberVO);
				String url = "/backend/member/updateMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/member/listOneMember.jsp");
				failureView.forward(req, res);
			}
		}

		// backend member update status
		if ("updateADM".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println("admin update");
			
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			try {
			Integer memID = new Integer(req.getParameter("memID").trim());

			Byte memStatus = new Byte(req.getParameter("memStatus"));
			Integer memReported = new Integer(req.getParameter("memReported"));
			if (memReported == null) {
				errorMsgs.add("被檢舉數請勿空白");
			}
			
			Byte memLandlord = new Byte(req.getParameter("memLandlord"));
			Byte memSupplier = new Byte(req.getParameter("memSupplier"));
			Byte memSeller = new Byte(req.getParameter("memSeller"));
			Integer memSupReported = new Integer(req.getParameter("memSupReported"));
			if (memSupReported == null) {
				errorMsgs.add("廠商被檢舉數請勿空白");
			}

			String memUsername = new String(req.getParameter("memUsername"));
			String memName = new String(req.getParameter("memName"));
			String memPhone = new String(req.getParameter("memPhone"));
			String memAddress = new String(req.getParameter("memAddress"));
			String memEmail = new String(req.getParameter("memEmail"));
			Integer memRedCount = new Integer(req.getParameter("memRedCount"));
			Integer memRedScore = new Integer(req.getParameter("memRedScore"));
		
			
			MemberVO memberVO = new MemberVO();
			memberVO.setMemID(memID);
			memberVO.setMemStatus(memStatus);
			memberVO.setMemReported(memReported);
			memberVO.setMemLandlord(memLandlord);
			memberVO.setMemSupplier(memSupplier);
			memberVO.setMemSeller(memSeller);
			memberVO.setMemSupReported(memSupReported);
			
			memberVO.setMemUsername(memUsername);
			memberVO.setMemName(memName);
			memberVO.setMemPhone(memPhone);
			memberVO.setMemAddress(memAddress);
			memberVO.setMemEmail(memEmail);
			memberVO.setMemRedCount(memRedCount);
			memberVO.setMemRedScore(memRedScore);
			

			if (!errorMsgs.isEmpty()) {
				req.setAttribute("memberVO", memberVO);
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/member/listOneMember.jsp");
				failureView.forward(req, res);
				return;
			}
			/*************************** 2.開始新增資料 ***************************************/
			MemberService memberSvc = new MemberService();
			memberVO = memberSvc.updateMemberADM(memID, memLandlord, memSupplier, memSeller,
					 memStatus, memReported, memSupReported, memUsername, memName,memPhone,
					 memAddress, memEmail,memRedCount,memRedScore );

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			req.setAttribute("memberVO", memberVO);
			String url = "/backend/member/listOneMember.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);

			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/member/listAllMember.jsp");
				failureView.forward(req, res);
			}
		}

		
		
		
		

//		if ("delete".equals(action)) { 
//
//			List<String> errorMsgs = new LinkedList<String>();
//		
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			String requestURL = req.getParameter("requestURL"); 
//			
//			try {
//				/***************************1.接收請求參數***************************************/
//				Integer memID = new Integer(req.getParameter("memID"));
//				
//				/***************************2.開始刪除資料***************************************/
//				MemberService memberserivce = new MemberService();
//				MemberVO memberVO = memberserivce.getOneMember(memID);
//				memberserivce.deleteMember(memID);
//				
//				/***************************3.刪除完成,準備轉交(Send the Success view)***********/
//				String url = "/frontend/member/listAllMember.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
//
//				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add("刪除資料失敗:"+e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher(requestURL);
//				failureView.forward(req, res);
//			}
//		}

	}
}
