package ezs.ser_ad.controller;

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

import ezs.ser_ad.model.SerAdService;
import ezs.ser_ad.model.SerAdVO;

@WebServlet("/frontend/ser_ad/UpdateSerAdServlet.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class UpdateSerAdServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer adVdrID = new Integer(req.getParameter("adVdrID"));

				Byte adStatus = Byte.valueOf(req.getParameter("adStatus"));
				Integer adSerClaID = new Integer(req.getParameter("adSerClaID"));

				String adDist = req.getParameter("adDist");
				String adDistReg = "^[(\u4e00-\u9fa5)(0-9)]{2,20}$";
				if (adDist == null || adDist.trim().length() == 0) {
					errorMsgs.add("員工姓名: 請勿空白");
				} else if (!adDist.trim().matches(adDistReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("服務地區: 只能是中文、數字, 且長度必需在2到20之間");
				}

				String adTxt = req.getParameter("adTxt");
				String adTxtReg = "^[(\u4e00-\u9fa5)(0-9)]{5,500}$";
				if (adTxt == null || adTxt.trim().length() == 0) {
					errorMsgs.add("服務內容: 請勿空白");
				} else if (!adDist.trim().matches(adDistReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("服務內容: 只能是中文、數字, 且長度必需在5到500字之間");
				}

//				InputStream in = req.getPart("adPic").getInputStream();// 廠商可以不上傳照片
				byte[] adPic = null;
//				if (in.available() != 0) {
//					adPic = new byte[in.available()];
//					in.read(adPic);
//					in.close();
//				}

				SerAdVO serAdVO = new SerAdVO();
				serAdVO.setAdVdrID(adVdrID);
				serAdVO.setAdStatus(adStatus);
				serAdVO.setAdSerClaID(adSerClaID);
				serAdVO.setAdDist(adDist);
				serAdVO.setAdTxt(adTxt);
				serAdVO.setAdPic(adPic);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("serAdVO", serAdVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_ad/update_SerAd_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				SerAdService serAdSvc = new SerAdService();
				serAdSvc.updateSerAd(adStatus, adDist, adTxt, adPic, adVdrID, adSerClaID);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("serAdVO", serAdVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/frontend/ser_ad/listAllSerAd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/ser_ad/update_SerAd_input.jsp");
				failureView.forward(req, res);
			}
		}

	}

}
