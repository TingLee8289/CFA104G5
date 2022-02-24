package ezs.sec_items.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ezs.sec_items.model.SecItem;

@WebServlet("/sec_items/ShoppingServlet.do")
public class ShoppingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();

		@SuppressWarnings("unchecked")
		List<SecItem> buylist = (Vector<SecItem>) session.getAttribute("shoppingcart");
		String action = req.getParameter("action");

		
// 新增或刪除商品
		if (!"CHECKOUT".equals(action)) {

			if ("DELETE".equals(action)) {
				String del = req.getParameter("del");
				int d = Integer.parseInt(del);
				buylist.remove(d);
			} else if ("ADD".equals(action)) {
				SecItem asecItem = getSecItem(req);

				if (buylist == null) {
					buylist = new Vector<SecItem>();
					buylist.add(asecItem);
				} else {
					if (buylist.contains(asecItem)) {
						SecItem innerSecItem = buylist.get(buylist.indexOf(asecItem));
						innerSecItem.setShQTY(innerSecItem.getShQTY() + asecItem.getShQTY());
					} else {
						buylist.add(asecItem);
					}
				}
			}

			session.setAttribute("shoppingcart", buylist);
			String url = "/frontend/sec_items/shoppingCart.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
		}

//	結帳
		else if (action.equals("CHECKOUT")) {
			
			/*************************** 0.確認使用者已登入 ****************************************/
			try{
				session.getAttribute("memID").toString();
			} catch (Exception e) {
				RequestDispatcher failureView = req.getRequestDispatcher("/frontend/member/login.jsp");
				failureView.forward(req, res);
				return;
			}
			
			/*************************** 1.接收請求參數 ****************************************/
			if (buylist!= null) {
				BigDecimal total = new BigDecimal(BigInteger.ZERO, 0); // 此行相當於 Integer total = 0;
				for (int i = 0; i < buylist.size(); i++) {
					SecItem order = buylist.get(i);
					BigDecimal price = order.getShPrice();
					Integer quantity = order.getShQTY();
					total = total.add(price.multiply(new BigDecimal(quantity))); // 此行相當於 total += (price*quantity);
				}
				String amount = String.valueOf(total);
				req.setAttribute("amount", amount);
				String url = "/frontend/sec_items/Checkout.jsp";
				RequestDispatcher rd = req.getRequestDispatcher(url);
				rd.forward(req, res);
				
			} else {
				String url = "/frontend/sec_items/shoppingCart.jsp";
				RequestDispatcher rd = req.getRequestDispatcher(url);
				rd.forward(req, res);
			}

		}

	}

	private SecItem getSecItem(HttpServletRequest req) {

		String shID = req.getParameter("shID");
		String shName = req.getParameter("shName");
		String shPrice = req.getParameter("shPrice");
		String shQTY = req.getParameter("shQTY");

		SecItem secItem = new SecItem();

		secItem.setShID(Integer.valueOf(shID));
		secItem.setShName(shName);
		secItem.setShPrice(new BigDecimal(shPrice));
		secItem.setShQTY(Integer.valueOf(shQTY));
		return secItem;

	}

}
