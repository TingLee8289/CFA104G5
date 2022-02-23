package ezs.sec_ord.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ezs.sec_ord.model.SecOrdService;
import ezs.sec_ord.model.SecOrdVO;
import ezs.sec_ord_details.model.SecOrdDetailsVO;

@WebServlet("/sec_ord/UpdateSecOrdBySellerServlet.do")
public class UpdateSecOrdBySellerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateSecOrdBySellerServlet() {
        super();
    }

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if ("getOne_For_Update".equals(action)) { // 來自listSecOrdsByShSellerID.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer shOrdID = Integer.valueOf(req.getParameter("shOrdID"));
//				System.out.println(shOrdID);
				/***************************2.開始查詢資料****************************************/
				SecOrdService secOrdSvc = new SecOrdService();
				SecOrdVO secOrdVO = secOrdSvc.getOneSecOrd(shOrdID);
//				
//				SecOrdDetailsService secOrdDetailSvc = new SecOrdDetailsService();
//				SecOrdDetailsVO secOrdDetailsVO = secOrdSvc.getOneSecOrd(shOrdID);
//				System.out.println(shOrdID);
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("secOrdVO", secOrdVO); // 資料庫取出的secOrd物件,存入req
				

				String url = "/frontend/sec_ord/update_secord_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/sec_ord/listAllSecOrd.jsp");
				failureView.forward(req, res);
			}
		}
		
//賣家更新狀態		
		if ("update".equals(action)) { // 來自update_secord_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer shOrdID = Integer.valueOf(req.getParameter("shOrdID").trim());
				Integer shOrdStatus = Integer.valueOf(req.getParameter("shOrdStatus").trim());
			
				SecOrdVO secOrdVO = new SecOrdVO();
				secOrdVO.setShOrdID(shOrdID);
				secOrdVO.setShOrdStatus(shOrdStatus);
				System.out.println(shOrdID);
				System.out.println(shOrdStatus);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("secOrdVO", secOrdVO); // 含有輸入格式錯誤的secOrdVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/sec_ord/update_secord_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				SecOrdService secOrdSvc = new SecOrdService();
				secOrdVO = secOrdSvc.updateSecOrdStatus(shOrdID, shOrdStatus);
			
				System.out.println(shOrdStatus);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("secOrdVO", secOrdVO); // 資料庫update成功後,正確的的secOrdVO物件,存入req
				String url = "/frontend/sec_ord/listAllSecOrd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listSecOrdsByShSeller.jsp
				successView.forward(req, res);
				System.out.println(successView);
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/sec_ord/update_secord_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
	
	}

}
