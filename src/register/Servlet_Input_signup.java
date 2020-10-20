package register;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		HttpSession session = request.getSession();
		con.conDb();//連線資料庫
		String successPath = "links/user_login.jsp";//目標位置
		/*驗證圖片驗證碼*/
		String getckimg = request.getParameter("LoginCheckImage");//接收使用者驗證碼
		String ckimg = (String)session.getAttribute("LoginCheckImage");//接收系統驗證碼
		if( !getckimg.equals(ckimg)) {
			session.setAttribute("RegisterResult", "驗證碼填寫錯誤");//回傳錯誤訊息
			response.sendRedirect("links/user_signup.jsp");
			return;
		}
		/*取得註冊資料*/
		String account = request.getParameter("User_Account");
		String upassword = request.getParameter("User_Password");
		String name = request.getParameter("User_Name");
		String uGender = request.getParameter("User_Gender");
		String email = request.getParameter("User_Email");
		String birthday = request.getParameter("User_Birthday");
		con.insert_signup(account, upassword, name, uGender, email, birthday);//加入資料庫
		session.setAttribute("RegisterResult", "註冊成功");//回傳成功訊息
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
