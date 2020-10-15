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
 * 讀取使用者資料
 */
@WebServlet("/User_res")
public class User_res extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		ConMysql con = new ConMysql();//建立資料庫方法物件
		String username = (String) session.getAttribute("account");//取得使用者帳號
		con.conDb();//連接資料庫
		/*從資料庫取得使用者資料*/
		String User_Account = username;
		String User_Password = con.getUserData("User_Password", username);
		String User_Name = con.getUserData("User_Name", username);
		String User_Gender = con.getUserData("User_Gender", username);
		String User_Email = con.getUserData("User_Email", username);
		String User_Birthday = con.getUserData("User_Birthday", username);
		/*傳遞參數*/
		session.setAttribute("User_Name", User_Name);//透過session傳遞可以避免編碼問題
		String path = "links/sign_result.jsp?User_Account="+User_Account+"&User_Password="
				+User_Password+"&User_Gender="+User_Gender
				+"&User_Email="+User_Email+"&User_Birthday="+User_Birthday;
		response.sendRedirect(path);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
