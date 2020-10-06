

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		Connection conn = null;
		Statement stat = null;
		ResultSet res = null;
		HttpSession session=request.getSession();
		
		String sDriver="com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/TestDB?serverTimezone=CST";
		String user = "root"; //資料庫使用者
		String password = "12345678"; //資料庫密碼
		String sql = "";
		//String getur = "andy"; 
		String getur = request.getParameter("user"); 
		//String getpd = "123"; 
		String getpd = request.getParameter("password");
		String ckpd = ""; //撈出來的密碼
		String username = ""; //暱稱
		String right = ""; //權限
		String id = ""; //使用者編碼
		String nul = ""; //空字串
		/*載入驅動*/
		try {
			Class.forName(sDriver);
		} catch (ClassNotFoundException e) {
			System.out.print("驅動器載入失敗");
		}
		
		/*進行連線*/
		try {
			conn = DriverManager.getConnection(url, user, password);
			
			stat = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print("資料庫連接失敗");
		}
		
		/*執行指令*/
		sql = "SELECT * FROM user WHERE User_Account='"+ getur +"';";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		
		/*取出資料*/
		try {
			while(res.next())
			{
				ckpd = res.getString("User_Password");
				username = res.getString("User_Name");
				right = res.getString("Account_right");
				id = res.getNString("User_Account");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*認證&控制器*/
		if ( ckpd.equals(getpd) )
		{
			//out.print("登入成功");
			session.setAttribute("result", "登入成功");
			session.setAttribute("id",id);
			session.setAttribute("name",username);
			session.setAttribute("right",right);
			response.sendRedirect("index.html");
		}
		else if( ckpd.equals(nul))
		{
			//out.print("查無此帳號");
			session.setAttribute("result", "查無此帳號");
			response.sendRedirect("links/user_login.html");
		}
		else
		{
			out.print("帳號或密碼輸入錯誤");
			session.setAttribute("result", "帳號或密碼輸入錯誤");
			response.sendRedirect("links/user_login.html");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
