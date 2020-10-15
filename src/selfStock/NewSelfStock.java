package selfStock;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.ConMysql;

/**
 * 處理新增加的自選股
 */
@WebServlet("/NewSelfStock")
public class NewSelfStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		ConMysql con = new ConMysql();
		String path="/LoadStockResult";//轉換路徑
		String User_id=(String)session.getAttribute("UID");//取得使用者編號
		String stock_id = request.getParameter("stock_id");//取得股票編號
		con.conDb();//連接資料庫
		con.addSelfStock(stock_id, User_id);//將自選股加入資料庫
		request.getRequestDispatcher(path).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
