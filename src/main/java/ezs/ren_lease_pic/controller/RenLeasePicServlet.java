package ezs.ren_lease_pic.controller;

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
import javax.servlet.http.Part;

import ezs.ren_lease_pic.model.RenLeasePicService;
import ezs.ren_lease_pic.model.RenLeasePicVO;
@WebServlet("/ren_lease/RenLeasePicServlet.do")
@MultipartConfig
public class RenLeasePicServlet extends HttpServlet {

		protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			doPost(req, res);
		}

		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
			req.setCharacterEncoding("UTF-8");
			String action = req.getParameter("action");
			
			  if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs", errorMsgs);

					try {
						/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
						RenLeasePicVO renLeasePicVO = new RenLeasePicVO();
						Integer lpLeaseId = new Integer(req.getParameter("lpLeaseId").trim());
						Part part = req.getPart("lpPic");

						byte[] lpPic = null;
						if (part == null || part.getSize() == 0) {
							req.setAttribute("renLeasePicVO", renLeasePicVO);
							RenLeasePicService renLeasePicSVC = new RenLeasePicService();
							RenLeasePicVO renLeasePicVO1 = renLeasePicSVC.getOneRenLeasePic(lpLeaseId);
							lpPic = renLeasePicVO1.getLpPic();
						} else {
							req.setAttribute("renLeasePicVO", renLeasePicVO);
							InputStream in = part.getInputStream();
							lpPic = new byte[in.available()];
							in.read(lpPic);
							in.close();
						}			
						
												
//						RenLeasePicVO renLeasePicVO1 = new RenLeasePicVO();
						renLeasePicVO.setLpLeaseId(lpLeaseId);
						renLeasePicVO.setLpPic(lpPic);

						if (!errorMsgs.isEmpty()) {
							req.setAttribute("renLeasePicVO", renLeasePicVO); // 含有輸入格式錯誤的empVO物件,也存入req
							RequestDispatcher failureView = req
									.getRequestDispatcher("/frontend/ren_lease/addLease.jsp");
							failureView.forward(req, res);
							return;
						}
						
						/***************************2.開始新增資料***************************************/
						RenLeasePicService renLeasePicSVC = new RenLeasePicService();
						renLeasePicVO = renLeasePicSVC.addRenLeasePic(lpLeaseId,lpPic);
						
						/***************************3.新增完成,準備轉交(Send the Success view)***********/
						String url = "/frontend/ren_lease/listAllLease.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
						successView.forward(req, res);				
						
						/***************************其他可能的錯誤處理**********************************/
					} catch (Exception e) {
						errorMsgs.add(e.getMessage());
						RequestDispatcher failureView = req
								.getRequestDispatcher("/frontend/ren_lease/addLease.jsp");
						failureView.forward(req, res);
					}
				}
			
		}
	}