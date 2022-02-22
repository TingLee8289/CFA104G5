package ezs.ser_ad.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.ser_ad.model.SerAdService;
import ezs.ser_ad.model.SerAdVO;
import ezs.ser_cla.model.SerClaService;
import ezs.ser_cla.model.SerClaVO;
@WebServlet("/ser_ad/getAdBySerClaID.do")
public class GetAdBySerClaID extends HttpServlet{

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		


		List<String> errorMsgs = new LinkedList<String>();
		// Store this set in the request scope, in case we need to
		// send the ErrorPage view.
		req.setAttribute("errorMsgs", errorMsgs);

		try {
			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer serClaID  = Integer.valueOf(req.getParameter("serClaID"));
			
			System.out.println(serClaID);
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/ser_cla/select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}


				/*************************** 2.開始查詢資料 *****************************************/
				SerAdService serAdSvc = new SerAdService();
				List<SerAdVO> serAdVO = serAdSvc.getAdBySerClaID(serClaID);
				if (serAdVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/ser_cla/select_page.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("serAdVO", serAdVO); // 資料庫取出的empVO物件,存入req
				String url = "/frontend/ser_ad/serAdViewPage2.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backend/ser/ser_cla/select_page.jsp");
				failureView.forward(req, res);
			}
		}
	}

