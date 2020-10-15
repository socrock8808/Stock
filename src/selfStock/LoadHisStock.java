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
 * 讀取歷史股票資訊
 */
@WebServlet("/LoadHisStock")
public class LoadHisStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");//設定回應編碼
		HttpSession session=request.getSession();
		String path = "links/stock_history.jsp";//目標路徑
		ConMysql con = new ConMysql();//建立資料庫方法物件
		con.conDb();//連接資料庫
		String stock_id = request.getParameter("stock_id");//取得股票編號
		int SCount = con.getHisStockCount(stock_id);//取得股票歷史資料數量
		if(SCount > 9)//如果數量超過九個，以10個論
			SCount = 10;
		String[][] stock_his = con.getStockHistory(SCount,stock_id);//取得歷史股票資訊
		String stock_name = URLEncoder.encode(con.getStockData("stock_name", String.valueOf(stock_id)), "utf-8");//設定編碼，避免亂碼
		session.setAttribute("stock_history", stock_his);//透過session傳遞歷史股票資訊
		session.setAttribute("stock_hisCount", SCount);//傳遞歷史股票個數
		path += "?stock_id="+stock_id+"&stock_name="+stock_name;//將股票編號及股票名稱加入url當作參數
		response.sendRedirect(path);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
