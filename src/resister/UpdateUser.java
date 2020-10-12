package resister;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.ConMysql;

/**
 * Servlet implementation class UpdateUser
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		ConMysql con = new ConMysql();
		con.conDb();
		String User_Name = request.getParameter("User_Name");
		String User_Password = request.getParameter("User_Password");
		String User_Email = request.getParameter("User_Email");
		int User_id = Integer.parseInt((String)session.getAttribute("UID"));
		con.updateUser(User_Name, User_Password, User_Email, User_id);
		String path="User_res?User_id="+User_id;
		session.setAttribute("User_Name", User_Name);
		session.setAttribute("Login", User_Name);
		response.sendRedirect(path);
	}

}
