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
 * Servlet implementation class User_res
 */
@WebServlet("/User_res")
public class User_res extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		PrintWriter out = response.getWriter();
		ConMysql con = new ConMysql();
		String username = request.getParameter("User_id");
		//String username="lan";
		con.conDb();//連接資料庫
		String User_Account = username;
		String User_Password = con.getUserData("User_Password", username);
		String User_Name = con.getUserData("User_Name", username);
		String User_Gender = con.getUserData("User_Gender", username);
		String User_Email = con.getUserData("User_Email", username);
		String User_Birthday = con.getUserData("User_Birthday", username);
		session.setAttribute("username", username);
		String path = "sign_result.jsp?User_Accoun="+User_Account+"&User_Password="
				+User_Password+"&User_Name="+User_Name+"&User_Gender="+User_Gender
				+"&User_Email="+User_Email+"&User_Birthday="+User_Birthday;
		request.getRequestDispatcher(path).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
