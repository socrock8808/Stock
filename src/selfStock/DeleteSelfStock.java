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
 * 刪除自選股
 */
@WebServlet("/DeleteSelfStock")
public class DeleteSelfStock extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		ConMysql con = new ConMysql();//建立資料庫方法物件
		String path="/LoadStockResult";//目標位置
		String User_id=(String)session.getAttribute("UID");//取得使用者編號
		String stock_id = request.getParameter("stock_id");//取得御刪除的自選股編號
		con.conDb();//連接資料庫
		con.deleteSelfStock(stock_id, User_id);//刪除自選股
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
