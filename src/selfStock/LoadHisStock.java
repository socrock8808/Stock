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
 * Servlet implementation class LoadHisStock
 */
@WebServlet("/LoadHisStock")
public class LoadHisStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		String path = "links/stock_history.jsp";
		ConMysql con = new ConMysql();
		con.conDb();//連接資料庫
		String stock_id = request.getParameter("stock_id");
		int SCount = con.getHisStockCount(stock_id);
		if(SCount > 9)
			SCount = 10;
		String[][] stock_his = con.getStockHistory(SCount,stock_id);
		String stock_name = URLEncoder.encode(con.getStockData("stock_name", String.valueOf(stock_id)), "utf-8");
		session.setAttribute("stock_history", stock_his);
		session.setAttribute("stock_hisCount", SCount);
		path += "?stock_id="+stock_id+"&stock_name="+stock_name;
		response.sendRedirect(path);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
