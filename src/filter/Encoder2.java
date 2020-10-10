package filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Encoder2
 */
@WebFilter("/UpdateArticle")
public class Encoder2 extends HttpFilter {
	public void doFilter(HttpServletRequest request,
			HttpServletResponse response, FilterChain chain)
					throws IOException, ServletException {
		chain.doFilter(new EncoderWrapper(request), response);
	}

}
