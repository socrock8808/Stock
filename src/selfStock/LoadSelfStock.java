package selfStock;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.ConMysql;

@WebServlet("/LoadSelfStock")
public class LoadSelfStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		ConMysql con = new ConMysql();
		String path="links/";
		int User_id=Integer.parseInt((String)session.getAttribute("UID"));
		con.conDb();
		int count = con.getSelfStockCount(User_id);
		String[][] result = con.getSelfStockWtihUser(count, User_id);
		session.setAttribute("result", result);
		response.sendRedirect(path);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
