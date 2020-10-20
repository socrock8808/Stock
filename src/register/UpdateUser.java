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
 * 更新使用者資料
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");//設定請求編碼
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");//設定回應編碼
		HttpSession session=request.getSession();
		ConMysql con = new ConMysql();//建立資料庫方法物件
		con.conDb();//連接資料庫
		String User_Name = request.getParameter("User_Name");//取的使用者暱稱
		String User_Password = request.getParameter("User_Password");//取得密碼
		String User_Email = request.getParameter("User_Email");//取的信箱
		int User_id = Integer.parseInt((String)session.getAttribute("UID"));//取得使用者編號
		con.updateUser(User_Name, User_Password, User_Email, User_id);//更新資料庫
		String path="User_res?User_id="+User_id;//傳遞參數
		session.setAttribute("User_Name", User_Name);//設定使用者暱稱
		session.setAttribute("Login", User_Name);//重新設定登入token
		response.sendRedirect(path);
	}

}
