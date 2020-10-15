package resister;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.ConMysql;

/**
 * 接收註冊資料，加到資料庫中
 */
@WebServlet("/Servlet_Input_signup")
public class Servlet_Input_signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");//設定請求編碼
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");//設定回應編碼
		ConMysql con = new ConMysql();//建立資料庫方法物件
		con.conDb();//連線資料庫
		String successPath = "links/user_login.jsp";//目標位置
		/*取得註冊資料*/
		String account = request.getParameter("User_Account");
		String upassword = request.getParameter("User_Password");
		String name = request.getParameter("User_Name");
		String uGender = request.getParameter("User_Gender");
		String email = request.getParameter("User_Email");
		String birthday = request.getParameter("User_Birthday");
		con.insert_signup(account, upassword, name, uGender, email, birthday);//加入資料庫
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
