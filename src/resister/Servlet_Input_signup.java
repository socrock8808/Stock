package resister;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.ConMysql;

/**
 * Servlet implementation class Servlet_Input_signup
 */
@WebServlet("/Servlet_Input_signup")
public class Servlet_Input_signup extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		ConMysql con = new ConMysql();
		con.conDb();
		String successPath = "links/user_login.jsp";

		String account = request.getParameter("User_Account");
		String upassword = request.getParameter("User_Password");
		String name = request.getParameter("User_Name");
		String uGender = request.getParameter("User_Gender");
		String email = request.getParameter("User_Email");
		String birthday = request.getParameter("User_Birthday");
		con.insert_signup(account, upassword, name, uGender, email, birthday);
//		out.print(account);
//		out.print(upassword);
//		out.print(name);
//		out.print(uGender);
//		out.print(email);
//		out.print(birthday);

//		successPath += "?User_id=" + account;
		response.sendRedirect(successPath);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
