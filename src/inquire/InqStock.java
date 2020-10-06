package inquire;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.ConMysql;

/**
 * Servlet implementation class InqStock
 */
@WebServlet("/InqStock")
public class InqStock extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		PrintWriter out = response.getWriter();
		ConMysql con = new ConMysql();
		con.conDb();//連接資料庫
		String inq = request.getParameter("stock"); 
		String successPath = "links/search_result.jsp";
		String errorPath="index.jsp";
		
		//獲得資料庫內的參數
		String stock_id = con.getStockData("stock_id", inq);
		if(stock_id.equals(""))
		{
			session.setAttribute("InqResult", "查無資料");
			request.getRequestDispatcher(errorPath).forward(request, response);
		}
		String stock_name = con.getStockData("stock_name", inq);
		String stock_trade = con.getStockData("stock_trade", inq);
		String stock_trunover = con.getStockData("stock_trunover", inq);
		String stock_open = con.getStockData("stock_open", inq);
		String stock_max = con.getStockData("stock_max", inq);
		String stock_min = con.getStockData("stock_min", inq);
		String stock_close = con.getStockData("stock_close", inq);
		String stock_diff = con.getStockData("stock_diff", inq);
		String stock_transaction = con.getStockData("stock_transaction", inq);
		session.setAttribute("stock_name", stock_name);
		successPath += "?stock_id="+stock_id
				+"&stock_trade="+stock_trade+"&stock_trunover="+stock_trunover
				+"&stock_open="+stock_open+"&stock_max="+stock_max+"&stock_min="
				+stock_min+"&stock_close="+stock_close+"&stock_diff="+stock_diff
				+"&stock_transaction="+stock_transaction;
		//要用forward帶參數
		request.getRequestDispatcher(successPath).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
