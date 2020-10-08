package login;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String SuccessPath = "index.jsp";
	private final String ErrorPath = "links/user_login.jsp";
	
	private final Pattern usernameRegex = Pattern.compile("^\\w{1,16}$");
	private final Pattern passwordRegex = Pattern.compile("^\\w{8,16}$");;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		ConMysql con = new ConMysql();
		String getur = request.getParameter("user"); 
		String getpd = request.getParameter("password");
		String ckpd = ""; //撈出來的密碼
		String path = ErrorPath; //轉發路徑
		String errors = "";
		/*驗證帳密*/
		if(!validusername(getur) || !validpassword(getpd))
			errors = "帳號或密碼填寫錯誤";

		if(errors.isEmpty())
		{
			con.conDb();//連接資料庫
			ckpd = con.getUserData("User_Password",getur);//資料庫密碼
			if( ckpd.equals(getpd) )
			{
				path=SuccessPath;
				session.setAttribute("UID", con.getUserData("User_id", getur));
				session.setAttribute("account",con.getUserData("User_Account",getur));
				session.setAttribute("right",con.getUserData("Account_right",getur));//權限
				session.setAttribute("Login",con.getUserData("User_Name",getur));
				response.sendRedirect(path);
				
			}
			else
			{
				session.setAttribute("LoginResult", "帳號或密碼填寫錯誤");
				response.sendRedirect(path);
			}
		}
		else
		{
			session.setAttribute("LoginResult", errors);
			response.sendRedirect(path);
		}
	}
	/*檢驗帳號*/
	private boolean validusername(String username) {
		return  username != null && usernameRegex.matcher(username).find();
	}
	
	/*檢驗密碼*/
	private boolean validpassword(String password) {
		return  password != null && passwordRegex.matcher(password).find();
	}
}
