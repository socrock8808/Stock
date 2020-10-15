package filter;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.owasp.encoder.Encode;
/*處理字串的包裹器*/
public class EncoderWrapper extends HttpServletRequestWrapper {
	public EncoderWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		return Optional.ofNullable(getRequest().getParameter(name))
				.map(Encode::forHtml)//轉換html tag
				.map(e -> changetxt(e))//轉換換行跟空白
				.orElse(null);
	}
	//轉換換行跟空白
	public String changetxt(String str) {
		return str.replace("\n", "<br>")
				.replace("\s", "&nbsp");
	}
}
