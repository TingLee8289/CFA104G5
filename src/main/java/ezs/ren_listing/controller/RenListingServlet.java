package ezs.ren_listing.controller;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ezs.ren_listing.model.RenListingService;
import ezs.ren_listing.model.RenListingVO;
import ezs.ren_listing_pic.model.RenListingPicService;
import ezs.ren_listing_pic.model.RenListingPicVO;

/**
 * Servlet implementation class RenListingServlet
 */
@WebServlet("/frontend/ren_listing/RenListingServlet.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class RenListingServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");   //<--- 已經由 SetCharacterEncodingFilter 濾器解決 Query String 之編碼問題了
		String action = req.getParameter("action");
		
		if("getOne_For_Display".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*****************1.接收請求參數_輸入格式的錯誤處理******************/
				String str = req.getParameter("lisID");
				if(str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入房源ID");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
							
					failureView.forward(req, res);
					return;
				}
				
				Integer lisID = null;
				try {
					lisID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("房源ID格式不正確");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
							
					failureView.forward(req, res);
					return;
				}
				/**********************2.開始查詢資料*************************/
				RenListingService renListingSvc = new RenListingService();
				RenListingVO renListingVO = renListingSvc.getOneRenListing(lisID);
				if (renListingVO == null) {
					errorMsgs.add("查無資料");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
									
					failureView.forward(req, res);
					return;
				}
				
				
				
				/********************3.查詢完成,準備轉交*****************/
				req.setAttribute("renListingVO", renListingVO);
				String url = "/frontend/ren_listing/listOneListing.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/*********************其他可能的錯誤*************/	
				
				
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
						
				failureView.forward(req, res);
			}
		}
//查房東房源
if("listRenListing_ByLisLddID".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*****************1.接收請求參數_輸入格式的錯誤處理******************/
				String str = req.getParameter("lisLddID");
				if(str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入房東ID");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_listing/listingView.jsp");
					failureView.forward(req, res);
					return;
				}
				
				Integer lisLddID = null;
				try {
					lisLddID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("房東ID格式不正確");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_listing/listingView.jsp");
					failureView.forward(req, res);
					return;
				}
				/**********************2.開始查詢資料*************************/
				RenListingService renListingSvc = new RenListingService();
				Set<RenListingVO> set = renListingSvc.getRenListingByLisLddID(lisLddID);
				if (set == null) {
					errorMsgs.add("查無資料");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_listing/listingView.jsp");
					failureView.forward(req, res);
					return;
				}
				
				
				
				/********************3.查詢完成,準備轉交*****************/
				HttpSession session = req.getSession();
				session.setAttribute("listRenListing_ByLisLddID", set);
				String url = "/frontend/ren_listing/listingViewByLddID.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/*********************其他可能的錯誤*************/	
				
				
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_listing/listing_select_page.jsp");
				failureView.forward(req, res);
			}
		}
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
//		        System.out.println(lisID);
				Integer lisID =  new Integer(req.getParameter("lisID"));
		        /***************************2.開始查詢資料****************************************/
		        RenListingService renListingSvc = new RenListingService();
//		        System.out.println(lisID);
		        RenListingVO renListingVO = renListingSvc.getOneRenListing(lisID);
//		        System.out.println(renListingVO);
		        /***************************3.查詢完成,準備轉交(Send the Success view)************/
		        req.setAttribute("renListingVO", renListingVO);
		        String url = "/frontend/ren_listing/update_listing_input.jsp";
		        RequestDispatcher successView = req.getRequestDispatcher(url);
		        successView.forward(req, res);
		    
		        /***************************其他可能的錯誤處理**********************************/
		        
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("無法取得修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_listing/listAllListing.jsp");
				failureView.forward(req, res);
			}
				
		}
			
	
	
		
		if("update".equals(action)) {
		
			List<String> errorMsgs = new LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/**********************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer lisID = new Integer(req.getParameter("lisID").trim());
				
				Integer lisLddID = new Integer(req.getParameter("lisLddID").trim());
				Integer lisRtID = new Integer(req.getParameter("lisRtID").trim());
				Integer lisAreaID = new Integer(req.getParameter("lisAreaID").trim()); 
				String lisTitle = req.getParameter("lisTitle");
				String lisTitleReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,25}$";
				if (lisTitle == null || lisTitle.trim().length() == 0) {
					errorMsgs.add("房源標題: 請勿空白");
				} else if(!lisTitle.trim().matches(lisTitleReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("房源標題: 只能是中、英文字母、數字和_ , 且長度必需在2到25之間");
	            }
				String lisAbt = req.getParameter("lisAbt");
				String lisAbtReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,255}$";
				if (lisTitle == null || lisTitle.trim().length() == 0) {
					errorMsgs.add("房源介紹: 請勿空白");
				} else if(!lisTitle.trim().matches(lisTitleReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("房源介紹: 只能是中、英文字母、數字和_ , 且長度必需在2到255之間");
	            }
				String lisAddress = req.getParameter("lisAddress").trim();
				if (lisAddress == null || lisAddress.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				}	
				BigDecimal lisRent = null;
				try {
					lisRent = new BigDecimal(req.getParameter("lisRent").trim());
				} catch (NumberFormatException e) {
					lisRent = BigDecimal.valueOf(0);
					errorMsgs.add("租金請填數字.");
				}
				BigDecimal lisMngFee = null;
				try {
					lisMngFee = new BigDecimal(req.getParameter("lisMngFee").trim());
				} catch (NumberFormatException e) {
					lisRent = BigDecimal.valueOf(0);
					errorMsgs.add("管理費請填數字.");
				}
				BigDecimal lisPfee = null;
				try {
					lisPfee = new BigDecimal(req.getParameter("lisPfee").trim());
				} catch (NumberFormatException e) {
					lisPfee = BigDecimal.valueOf(0);
					errorMsgs.add("停車費請填數字.");
				}
				Double lisSqft = null;
				try {		
					lisSqft = new Double(req.getParameter("lisSqft").trim());
				}catch (NumberFormatException e) {
					lisSqft = 0.0;
					errorMsgs.add("坪數請填數字.");
				}
				String lisFlr = req.getParameter("lisFlr").trim();
				if (lisFlr == null || lisFlr.trim().length() == 0) {
					errorMsgs.add("樓層請勿空白");
				}	
				Integer lisRmNo = null;
				try {		
					lisRmNo = new Integer(req.getParameter("lisRmNo").trim());
				}catch (NumberFormatException e) {
					lisRmNo = 0;
					errorMsgs.add("房間數請填數字.");
				}
				Integer lisCmnArea = null;
				try {		
					lisCmnArea = new Integer(req.getParameter("lisCmnArea").trim());
				}catch (NumberFormatException e) {
					lisCmnArea = 0;
					errorMsgs.add("廳數請填數字.");
				}
				Integer lisBrNo = null;
				try {		
					lisBrNo = new Integer(req.getParameter("lisBrNo").trim());
				}catch (NumberFormatException e) {
					lisBrNo = 0;
					errorMsgs.add("衛數請填數字.");
				}
				Integer lisEthernet = new Integer(req.getParameter("lisEthernet").trim());
				Integer lisWifi = new Integer(req.getParameter("lisWifi").trim());
				Integer lisWh = new Integer(req.getParameter("lisWh").trim());
				Integer lisShenc = new Integer(req.getParameter("lisShenc").trim());
				Integer lisAc = new Integer(req.getParameter("lisAc").trim());
				Integer lisFridge = new Integer(req.getParameter("lisFridge").trim());
				Integer lisTv = new Integer(req.getParameter("lisTv").trim());
				Integer lisWasher = new Integer(req.getParameter("lisWasher").trim());
				Integer lisDryer = new Integer(req.getParameter("lisDryer").trim());
				Integer lisTc = new Integer(req.getParameter("lisTc").trim());
				Integer lisBed = new Integer(req.getParameter("lisCabinet").trim());
				Integer lisCabinet = new Integer(req.getParameter("lisCabinet").trim());
				Integer lisSofa = new Integer(req.getParameter("lisSofa").trim());
				Integer lisParking = new Integer(req.getParameter("lisParking").trim());
				Integer lisCook = new Integer(req.getParameter("lisCook").trim());
				Integer lisPet = new Integer(req.getParameter("lisPet").trim());
				Integer lisSmoking = new Integer(req.getParameter("lisSmoking").trim());
				Integer lisMonly = new Integer(req.getParameter("lisMonly").trim());
				Integer lisFonly = new Integer(req.getParameter("lisFonly").trim());
				Integer lisSonly = new Integer(req.getParameter("lisSonly").trim());			
				
				Integer lisStatus = new Integer(req.getParameter("lisStatus").trim());
				Integer lisApproval = new Integer(req.getParameter("lisApproval").trim());
				//圖片
				Integer lspID = new Integer(req.getParameter("lspID").trim());
				Integer lspLisID = new Integer(req.getParameter("lspLisID").trim());
				
				
				//.....update抓取圖片的code
				InputStream in = req.getPart("lspPic").getInputStream();   //servlet 3.0Part物件
				byte[] lspPic = null;
				if(in.available()!=0) {
//				part是拿到inputStream   要轉成陣列
					lspPic = new byte[in.available()];
				in.read(lspPic);
				in.close();
				}else {
					errorMsgs.add("請上傳圖片");
				}
				
				
				RenListingVO renListingVO = new RenListingVO();
				renListingVO.setLisID(lisID);
				renListingVO.setLisLddID(lisLddID);
				renListingVO.setLisRtID(lisRtID);
				renListingVO.setLisAreaID(lisAreaID);
				renListingVO.setLisTitle(lisTitle);
				renListingVO.setLisAbt(lisAbt);
				renListingVO.setLisAddress(lisAddress);
				renListingVO.setLisRent(lisRent);
				renListingVO.setLisMngFee(lisMngFee);
				renListingVO.setLisMngFee(lisPfee);
				renListingVO.setLisPfee(lisMngFee);
				renListingVO.setLisSqft(lisSqft);
				renListingVO.setLisFlr(lisFlr);
				renListingVO.setLisRmNo(lisRmNo);
				renListingVO.setLisCmnArea(lisCmnArea);
				renListingVO.setLisBrNo(lisBrNo);
				renListingVO.setLisEthernet(lisEthernet);
				renListingVO.setLisWifi(lisWifi);
				renListingVO.setLisWh(lisWh);
				renListingVO.setLisShenc(lisShenc);
				renListingVO.setLisAc(lisAc);
				renListingVO.setLisFridge(lisFridge);
				renListingVO.setLisTv(lisTv);
				renListingVO.setLisWasher(lisWasher);
				renListingVO.setLisDryer(lisDryer);
				renListingVO.setLisTc(lisTc);
				renListingVO.setLisBed(lisBed);
				renListingVO.setLisCabinet(lisCabinet);
				renListingVO.setLisSofa(lisSofa);
				renListingVO.setLisParking(lisParking);
				renListingVO.setLisCook(lisCook);
				renListingVO.setLisPet(lisPet);
				renListingVO.setLisSmoking(lisSmoking);
				renListingVO.setLisFonly(lisFonly);
				renListingVO.setLisSonly(lisSonly);
				renListingVO.setLisStatus(lisStatus);
				renListingVO.setLisApproval(lisApproval);
				
				RenListingPicVO renListingPicVO = new RenListingPicVO();
				renListingPicVO.setLspID(lspID);
				renListingPicVO.setLspLisID(lspLisID);
				renListingPicVO.setLspPic(lspPic);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("renListingVO", renListingVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
								.getRequestDispatcher("/front/ren_listing/update_listing_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
//				System.out.print(renListingVO);
				/***************************2.開始修改資料*****************************************/
				RenListingService renListingSvc = new RenListingService();
				renListingVO = renListingSvc.updateRenListing(lisID,lisLddID,lisRtID,lisAreaID,lisTitle,lisAbt,
						lisAddress,lisRent,lisMngFee,lisPfee,lisSqft,lisFlr,lisRmNo,
						lisCmnArea,lisBrNo,lisEthernet,lisWifi,lisWh,lisShenc,lisAc,lisFridge,
						lisTv,lisWasher,lisDryer,lisTc,lisBed,lisCabinet,lisSofa,lisParking,
						lisCook,lisPet,lisSmoking,lisMonly,lisFonly,lisSonly,lisStatus,lisApproval);
				
				RenListingPicService renListingPicSvc = new RenListingPicService();
				renListingPicSvc.updateRenListingPic(lspID, lspLisID,lspPic);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("renListingVO", renListingVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/frontend/ren_listing/listOneListing.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
//				System.out.print(renListingVO);
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_listing/update_listing_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("insert".equals(action)) { // 來自addListing.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/**********************1.接收請求參數 - 輸入格式的錯誤處理****************************/
			Integer lisLddID = new Integer(req.getParameter("lisLddID").trim());
			Integer lisRtID = new Integer(req.getParameter("lisRtID").trim());
			Integer lisAreaID = new Integer(req.getParameter("lisAreaID").trim());
			String lisTitle = req.getParameter("lisTitle").trim();
		
			if (lisTitle == null || lisTitle.trim().length() == 0) {
				errorMsgs.add("房源標題: 請勿空白");			
            }
			
			String lisAbt = req.getParameter("lisAbt").trim();
			if (lisTitle == null || lisTitle.trim().length() == 0) {
				errorMsgs.add("房源介紹: 請勿空白");
			} 
			
			String lisAddress = req.getParameter("lisAddress").trim();
			if (lisAddress == null || lisAddress.trim().length() == 0) {
				errorMsgs.add("地址請勿空白");
			}	
			BigDecimal lisRent = null;
			try {
				lisRent = new BigDecimal(req.getParameter("lisRent").trim());
			} catch (NumberFormatException e) {
				lisRent = BigDecimal.valueOf(0);
				errorMsgs.add("租金請填數字.");
			}
			BigDecimal lisMngFee = null;
			try {
				lisMngFee = new BigDecimal(req.getParameter("lisMngFee").trim());
			} catch (NumberFormatException e) {
				lisRent = BigDecimal.valueOf(0);
				errorMsgs.add("管理費請填數字.");
			}
			BigDecimal lisPfee = null;
			try {
				lisPfee = new BigDecimal(req.getParameter("lisPfee").trim());
			} catch (NumberFormatException e) {
				lisPfee = BigDecimal.valueOf(0);
				errorMsgs.add("停車費請填數字.");
			}
			Double lisSqft = null;
			try {		
				lisSqft = new Double(req.getParameter("lisSqft").trim());
			}catch (NumberFormatException e) {
				lisSqft = 0.0;
				errorMsgs.add("坪數請填數字.");
			}
			String lisFlr = req.getParameter("lisFlr").trim();
			if (lisFlr == null || lisFlr.trim().length() == 0) {
				errorMsgs.add("樓層請勿空白");
			}	
			Integer lisRmNo = null;
			try {		
				lisRmNo = new Integer(req.getParameter("lisRmNo").trim());
			}catch (NumberFormatException e) {
				lisRmNo = 0;
				errorMsgs.add("房間數請填數字.");
			}
			Integer lisCmnArea = null;
			try {		
				lisCmnArea = new Integer(req.getParameter("lisCmnArea").trim());
			}catch (NumberFormatException e) {
				lisCmnArea = 0;
				errorMsgs.add("廳數請填數字.");
			}
			Integer lisBrNo = null;
			try {		
				lisBrNo = new Integer(req.getParameter("lisBrNo").trim());
			}catch (NumberFormatException e) {
				lisBrNo = 0;
				errorMsgs.add("衛數請填數字.");
			}
			
			
			
			Integer lisEthernet = new Integer(req.getParameter("lisEthernet").trim());
			Integer lisWifi = new Integer(req.getParameter("lisWifi").trim());
			Integer lisWh = new Integer(req.getParameter("lisWh").trim());
			Integer lisShenc = new Integer(req.getParameter("lisShenc").trim());
			Integer lisAc = new Integer(req.getParameter("lisAc").trim());
			Integer lisFridge = new Integer(req.getParameter("lisFridge").trim());
			Integer lisTv = new Integer(req.getParameter("lisTv").trim());
			Integer lisWasher = new Integer(req.getParameter("lisWasher").trim());
			Integer lisDryer = new Integer(req.getParameter("lisDryer").trim());
			Integer lisTc = new Integer(req.getParameter("lisTc").trim());
			Integer lisBed = new Integer(req.getParameter("lisCabinet").trim());
			Integer lisCabinet = new Integer(req.getParameter("lisCabinet").trim());
			Integer lisSofa = new Integer(req.getParameter("lisSofa").trim());
			Integer lisParking = new Integer(req.getParameter("lisParking").trim());
			Integer lisCook = new Integer(req.getParameter("lisCook").trim());
			Integer lisPet = new Integer(req.getParameter("lisPet").trim());
			Integer lisSmoking = new Integer(req.getParameter("lisSmoking").trim());
			Integer lisMonly = new Integer(req.getParameter("lisMonly").trim());
			Integer lisFonly = new Integer(req.getParameter("lisFonly").trim());
			Integer lisSonly = new Integer(req.getParameter("lisSonly").trim());
//			Integer lisStatus = new Integer(req.getParameter("lisStatus").trim());
//			Integer lisApproval = new Integer(req.getParameter("lisApproval").trim());
			
			//.....新增抓取圖片的code
			
			InputStream in = req.getPart("lspPic").getInputStream();   //servlet 3.0Part物件
			byte[] lspPic = null;
			if(in.available()!=0) {
//			part是拿到inputStream   要轉成陣列
				lspPic = new byte[in.available()];
			in.read(lspPic);
			in.close();
			}else {
				errorMsgs.add("請上傳圖片");
			}
			//房源
			RenListingVO renListingVO = new RenListingVO();
			
			renListingVO.setLisLddID(lisLddID);
			renListingVO.setLisRtID(lisRtID);
			renListingVO.setLisAreaID(lisAreaID);
			renListingVO.setLisTitle(lisTitle);
			renListingVO.setLisAbt(lisAbt);
			renListingVO.setLisAddress(lisAddress);
			renListingVO.setLisRent(lisRent);
			renListingVO.setLisMngFee(lisMngFee);
			renListingVO.setLisMngFee(lisPfee);
			renListingVO.setLisPfee(lisMngFee);
			renListingVO.setLisSqft(lisSqft);
			renListingVO.setLisFlr(lisFlr);
			renListingVO.setLisRmNo(lisRmNo);
			renListingVO.setLisCmnArea(lisCmnArea);
			renListingVO.setLisBrNo(lisBrNo);
			renListingVO.setLisEthernet(lisEthernet);
			renListingVO.setLisWifi(lisWifi);
			renListingVO.setLisWh(lisWh);
			renListingVO.setLisShenc(lisShenc);
			renListingVO.setLisAc(lisAc);
			renListingVO.setLisFridge(lisFridge);
			renListingVO.setLisTv(lisTv);
			renListingVO.setLisWasher(lisWasher);
			renListingVO.setLisDryer(lisDryer);
			renListingVO.setLisTc(lisTc);
			renListingVO.setLisBed(lisBed);
			renListingVO.setLisCabinet(lisCabinet);
			renListingVO.setLisSofa(lisSofa);
			renListingVO.setLisParking(lisParking);
			renListingVO.setLisCook(lisCook);
			renListingVO.setLisPet(lisPet);
			renListingVO.setLisSmoking(lisSmoking);
			renListingVO.setLisFonly(lisFonly);
			renListingVO.setLisSonly(lisSonly);
//			renListingVO.setLisStatus(lisStatus);
//			renListingVO.setLisApproval(lisApproval);	
			//圖片
			RenListingPicVO renListingPicVO = new RenListingPicVO();
			
		
			renListingPicVO.setLspPic(lspPic);
				
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("renListingVO", renListingVO);
				// 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/ren_listing/addListing.jsp");
				failureView.forward(req, res);
				return; //程式中斷
			}	
			System.out.print(12345);	
			/*******************************2.開始新增資料************************/
			RenListingService renListingSvc = new RenListingService();
			renListingVO = renListingSvc.addRenListing(lisLddID,lisRtID,lisAreaID,lisTitle,lisAbt,
					lisAddress,lisRent,lisMngFee,lisPfee,lisSqft,lisFlr,lisRmNo,
					lisCmnArea,lisBrNo,lisEthernet,lisWifi,lisWh,lisShenc,lisAc,lisFridge,
					lisTv,lisWasher,lisDryer,lisTc,lisBed,lisCabinet,lisSofa,lisParking,
					lisCook,lisPet,lisSmoking,lisMonly,lisFonly,lisSonly);
			System.out.print(renListingPicVO);
			renListingPicVO.setLspLisID(renListingVO.getLisID());
			renListingSvc.addRenListing(renListingPicVO);
			
			/*****************************3.新增完成，準備轉交(send the Success view)*********/
			String url = "/frontend/ren_listing/listingView.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllListing.jsp
			successView.forward(req, res);
			
			/*****************************其他可能的錯誤處理*******************************/
			
			}catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_listing/addListing.jsp");
				failureView.forward(req, res);
			}
			
		}
		
		if ("delete".equals(action)) { // 來自listRenListing_ByLisLddID.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer lisID = Integer.valueOf(req.getParameter("lisID"));
				
				Integer lspLisID=lisID;
				
				
				/***************************2.開始刪除資料***************************************/
				RenListingService renListingSvc = new RenListingService();
				RenListingPicService renListingPicSvc = new RenListingPicService();
			
				
				renListingPicSvc.deleteRenListingPic(lspLisID);
				renListingSvc.deleteRenListing(lisID);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/frontend/ren_listing/listAllListing.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/ren_listing/listRenListing_ByLisLddID.jsp");
				failureView.forward(req, res);
			}
		}
		
	}

}
