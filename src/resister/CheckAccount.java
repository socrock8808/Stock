package resister;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.ConMysql;

/**
 * 檢應是否有重複帳號，為應前端ajax
 */
@WebServlet("/CheckAccount")
public class CheckAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		ConMysql con = new ConMysql();//建立資料庫方法物件
		con.conDb();//連接資料庫
		String account = request.getParameter("User_Account");//取得使用者輸入的帳號
		String check = con.getUserData("User_Account", account);//查詢資料庫
		if( check.equals("")) //若為空字串，表示無重複之帳號
			out.print("<font color='green'>可以使用此帳號</font>");
		else
			out.print("<font color='red'>此帳號已被使用</font>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
