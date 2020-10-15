package filter;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 過濾文章的包裹器
 */
@WebFilter("/NewArticle")
public class Encoder extends HttpFilter {
	public void doFilter(HttpServletRequest request,
			HttpServletResponse response, FilterChain chain)
					throws IOException, ServletException {
		chain.doFilter(new EncoderWrapper(request), response);
	}
}
