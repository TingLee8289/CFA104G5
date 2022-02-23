package ezs.member.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import ezs.member.model.*;

@WebServlet("/member/ResetPasswordServlet.do")
public class ResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// from updateMemberPasswor.jsp
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);
			System.out.println(action);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				String str = req.getParameter("memID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入會員編號");
				}
				

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/updateMemberPassword.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer memID = null;
				try {
					memID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}

				
				
				String memPassword = req.getParameter("memPassword");
				if (memPassword == null || memPassword.trim().length() == 0) {
					errorMsgs.add("密碼請勿空白");
				}

				MemberVO memberVO = new MemberVO();
				memberVO.setMemID(memID);
				memberVO.setMemPassword(memPassword);
System.out.println(memPassword);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的memberVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/member/updateMemberPassword.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				MemberService memberSvc = new MemberService();
				 memberSvc.updateMemberPassword(memberVO);
				 System.out.println("=======================");
				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("memberVO", memberVO); // 資料庫update成功後,正確的的memberVO物件,存入req
				String url = "/frontend/EZ_home.jsp"; // 更新完成跳轉至首頁
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				System.out.println(successView);
				
				
				
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/updateMemberPassword.jsp");
				failureView.forward(req, res);
			}
		}

	}
}
