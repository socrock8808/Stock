

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Test
 */
@WebServlet("/Test")
public class Test extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*設定編碼*/
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		Connection conn = null;
		Statement stat = null;
		ResultSet res = null;
		
		/*參數設定*/
		String sDriver="com.mysql.cj.jdbc.Driver";
		String sCon = "";
		String url = "jdbc:mysql://localhost:3306/TestDB?serverTimezone=CST";
		String user = "root";
		String password = "12345678";
		String sql = "";
		
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
		sql = "select * From ttaa";
		try {
			res = stat.executeQuery(sql);
		} catch (SQLException e) {
			System.out.print("sql執行失敗");
		}
		
		/*輸出*/
		try {
			while(res.next())
			{
				out.print(res.getString("id"));
				out.print("\t");
				out.print(res.getString("haha"));
				out.print("\t");
				out.println(res.getString("yaya"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		out.print("haha");
	}

	

}
