package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ezs.admin_priv.model.*;

public class BackendSecurityRen implements Filter{
	private FilterConfig config;

	public void init(FilterConfig config) {
		this.config = config;
	}

	public void destroy() {
		config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws ServletException, IOException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 【取得 session】
		HttpSession session = req.getSession();
		//【從 session 判斷此user是否有相關功能】
		Object admID = session.getAttribute("admID");
		AdminPrivService admPsvc = new AdminPrivService();
		int admid = (Integer)admID;
		
		System.out.println(admid);
		if(admPsvc.getoneAdminFunc(admid, 3)==null) {
			res.sendRedirect(req.getContextPath() + "/backend/index.jsp");
			return;
		}else {
			chain.doFilter(request, response);
		}
			
	}
}
