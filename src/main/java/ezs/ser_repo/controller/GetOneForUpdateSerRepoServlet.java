package ezs.ser_repo.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.ser_repo.model.SerRepVO;
import ezs.ser_repo.model.SerRepoService;

@WebServlet("/ser_repo/GetOneForUpdateSerRepoServlet.do")
public class GetOneForUpdateSerRepoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer rpID = new Integer(req.getParameter("rpID"));

				/*************************** 2.開始查詢資料 ****************************************/
				SerRepoService serRepoSvc = new SerRepoService();
				SerRepVO serRepVO = serRepoSvc.getoneSerRep(rpID);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("serRepVO", serRepVO); // 取的到ID,但無法SET---資料庫取出的VO物件,存入req
				String url = "/backend/ser/ser_repo/update_SerRepo_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/ser_repo/select_page.jsp");
				failureView.forward(req, res);
			}
		}
	}
	

}
