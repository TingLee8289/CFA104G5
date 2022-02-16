package filters;

import java.io.*;
import javax.servlet.*;

public class SetCharacterEncodingFilter implements Filter {

	protected String encoding = null;
	protected FilterConfig config = null;

	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
		this.encoding = config.getInitParameter("encoding");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		// 使用 Filter 解決 Query String 之編碼問題
		// request.setCharacterEncoding("特定的字碼集");
		request.setCharacterEncoding(encoding);
		// 將程式控制權交給後續的過濾器
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		this.encoding = null;
		this.config = null;

	}

}
