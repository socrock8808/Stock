package filter;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.owasp.encoder.Encode;

public class EncoderWrapper extends HttpServletRequestWrapper {
	public EncoderWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		return Optional.ofNullable(getRequest().getParameter(name))
				.map(Encode::forHtml)
				.map(e -> changetxt(e))
				.orElse(null);
	}
	
	public String changetxt(String str) {
		return str.replace("\n", "<br>")
				.replace("\s", "&nbsp");
	}
}
