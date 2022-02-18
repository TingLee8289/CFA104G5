package ezs.sec_items.controller;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.DataSource;
@WebServlet("/sec_items/SecItemsPicReaderServlet.do")

public class SecItemsPicReaderServlet extends HttpServlet {
	
	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			Statement stmt = con.createStatement();
			String sh_id = req.getParameter("sh_id").trim();
			ResultSet rs = stmt.executeQuery("SELECT sh_pic FROM `SEC_ITEMS` s JOIN `SEC_PICS` s1 on S.sh_id=S1.sh_id WHERE s.sh_id = "+ sh_id);
			// "SELECT IMAGE FROM PICTURES WHERE PID = "+ req.getParameter("PID"));
			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("sh_pic"));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
			} else {
				res.sendError(HttpServletResponse.SC_NOT_FOUND);
//				InputStream in = getServletContext().getResourceAsStream("/NoData/null.jpg");
//														
//				byte[] b = new byte[in.available()];
//				in.read(b);
//				out.write(b);
//				in.close();
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.out.println(e);
//			InputStream in = getServletContext().getResourceAsStream("/NoData/null.jpg");
//			
//			byte[] b = new byte[in.available()];
//			in.read(b);
//			out.write(b);
//			in.close();
		}
	}

	public void init() throws ServletException {
		try {
			Context ctx = new javax.naming.InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CFA104G5");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void destroy() {
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}