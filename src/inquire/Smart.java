package inquire;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.ConMysql;

/**
 * Servlet implementation class Smart
 */
@WebServlet("/Smart")
public class Smart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String stock_inq = request.getParameter("stock_inq");
		ConMysql con = new ConMysql();
		con.conDb();
		System.out.print("dfdfd");
		if(stock_inq.matches("\\w*"))
			out.print(con.getStockidInfo(stock_inq));
		else
			out.print(con.getStocknameInfo(stock_inq));
	}
}
