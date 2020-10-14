package selfStock;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.ConMysql;

/**
 * Servlet implementation class LoadStockResult
 */
@WebServlet("/LoadStockResult")
public class LoadStockResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		String successPath = "links/search_result.jsp";
		ConMysql con = new ConMysql();
		con.conDb();//連接資料庫
		/*處理查詢結果*/
		String inq = request.getParameter("stock");
		if( inq != null) {
			String stock_id = con.getStockData("stock_id", inq);
			if(stock_id.equals(""))
			{
				session.setAttribute("InqResult", "查無資料");
				request.getRequestDispatcher(successPath).forward(request, response);
				return;
			}
			String stock_name = URLEncoder.encode(con.getStockData("stock_name", inq), "utf-8");
			String stock_trade = con.getStockData("stock_trade", inq);
			String stock_trunover = con.getStockData("stock_trunover", inq);
			String stock_open = con.getStockData("stock_open", inq);
			String stock_max = con.getStockData("stock_max", inq);
			String stock_min = con.getStockData("stock_min", inq);
			String stock_close = con.getStockData("stock_close", inq);
			String stock_diff = con.getStockData("stock_diff", inq);
			String stock_transaction = con.getStockData("stock_transaction", inq);
			successPath += "?stock_id="+stock_id+"&stock_name="+stock_name
					+"&stock_trade="+stock_trade+"&stock_trunover="+stock_trunover
					+"&stock_open="+stock_open+"&stock_max="+stock_max+"&stock_min="
					+stock_min+"&stock_close="+stock_close+"&stock_diff="+stock_diff
					+"&stock_transaction="+stock_transaction;
			session.setAttribute("InqResult", "");
		}
		/*處理自選股*/
		if( session.getAttribute("Login") != null) {
			int User_id=Integer.parseInt((String)session.getAttribute("UID"));
			int count = con.getSelfStockCount(User_id);
			String[][] result = con.getSelfStockWtihUser(count, User_id);
			session.setAttribute("stock_result", result);
			session.setAttribute("stock_count", count);
		}
		request.getRequestDispatcher(successPath).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
