package login;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*處理登入請求、驗證參數*/
/*密碼尚未加密*/
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String SuccessPath = "index.jsp";//登入成功位置
	private final String ErrorPath = "links/user_login.jsp";//登入失敗位置
	
	private final Pattern usernameRegex = Pattern.compile("^\\w{1,16}$");//正規表示法驗證
	private final Pattern passwordRegex = Pattern.compile("^\\w{8,16}$");//正規表示法驗證
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		ConMysql con = new ConMysql();//建立資料庫方法物件
		String getur = request.getParameter("user"); //接收使用者帳號
		String getpd = request.getParameter("password");//接收使用者密碼
		String getckimg = request.getParameter("LoginCheckImage");//接收使用者驗證碼
		String ckimg = (String)session.getAttribute("LoginCheckImage");//接收系統驗證碼
		String ckpd = ""; //撈出來的密碼
		String path = ErrorPath; //轉發路徑
		String errors = "";
		/*驗證驗證碼*/
		if( !getckimg.equals(ckimg)) {
			session.setAttribute("LoginResult", "驗證碼填寫錯誤");//回傳錯誤訊息
			response.sendRedirect(path);
			return;
		}
		/*驗證帳密*/
		if(!validusername(getur) || !validpassword(getpd))
			errors = "帳號或密碼填寫錯誤";
		/*如果error為空，表示正規表示法驗證皆正確*/
		if(errors.isEmpty())
		{
			con.conDb();//連接資料庫
			ckpd = con.getUserData("User_Password",getur);//資料庫密碼
			if( ckpd.equals(getpd) )//驗證密碼是否相同
			{
				path=SuccessPath;//設定目標位置
				session.setAttribute("UID", con.getUserData("User_id", getur));//設定使用者編碼
				session.setAttribute("account",con.getUserData("User_Account",getur));//設定使用者帳號
				session.setAttribute("right",con.getUserData("Account_right",getur));//權限
				session.setAttribute("Login",con.getUserData("User_Name",getur));//設定登入token
				response.sendRedirect(path);
				
			}
			else//密碼不相同
			{
				session.setAttribute("LoginResult", "帳號或密碼填寫錯誤");//回傳錯誤訊息
				response.sendRedirect(path);
			}
		}
		else//正規表示法驗證失敗
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
