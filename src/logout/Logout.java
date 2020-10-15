package logout;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*登出*/

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String path="links/user_login.jsp";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*如果登入token存在，則刪除所有session*/
		if(request.getSession().getAttribute("Login") != null)
		{
			request.getSession().invalidate();
		}
		response.sendRedirect(path);
	}
}
