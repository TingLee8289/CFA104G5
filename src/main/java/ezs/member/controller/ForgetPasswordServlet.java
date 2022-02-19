package ezs.member.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.member.model.ResetPasswordMailService;

@WebServlet("/member/ForgetPasswordServlet.do")
public class ForgetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ForgetPasswordServlet() {
		super();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
		
		String page = "resetpassword.jsp";
        req.getRequestDispatcher(page).forward(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		
		
		ResetPasswordMailService resetPasswordMailService = new ResetPasswordMailService();
		
		
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("reset_Password_Email".equals(action)) { // 來自resetpassword.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
		
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
//				呼叫 email service
				
				
				
				
				
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/member/resetpassword.jsp");
				failureView.forward(req, res);
			}
		}
			
			
			
		}
	}

