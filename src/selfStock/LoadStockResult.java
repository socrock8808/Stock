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
 * 讀取股票查詢結果以及自選股資料
 */
@WebServlet("/LoadStockResult")
public class LoadStockResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");//設定請求編碼
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");//設定回應編碼
		HttpSession session=request.getSession();
		String successPath = "links/search_result.jsp";//轉換目標路徑
		ConMysql con = new ConMysql();//建立資料庫方法物件
		con.conDb();//連接資料庫
		/*處理查詢結果*/
		String inq = request.getParameter("stock");//從url取得使用者輸入的股票編號
		if( inq != null) {//判斷是否有查詢股票的動作，如果有，進行股票查詢
			String stock_id = con.getStockData("stock_id", inq);//搜尋資料庫是否有符合的股票編號
			if(stock_id.equals(""))//如果為空字串，代表使用者輸入錯誤，跳轉畫面
			{
				session.setAttribute("InqResult", "查無資料");
				request.getRequestDispatcher(successPath).forward(request, response);
				return;
			}
			/*取得股票相關資訊*/
			String stock_name = URLEncoder.encode(con.getStockData("stock_name", inq), "utf-8");//轉換編碼，避免亂碼問題
			String stock_trade = con.getStockData("stock_trade", inq);
			String stock_trunover = con.getStockData("stock_trunover", inq);
			String stock_open = con.getStockData("stock_open", inq);
			String stock_max = con.getStockData("stock_max", inq);
			String stock_min = con.getStockData("stock_min", inq);
			String stock_close = con.getStockData("stock_close", inq);
			String stock_diff = con.getStockData("stock_diff", inq);
			String stock_transaction = con.getStockData("stock_transaction", inq);
			/*將取出的資料加入url當作參數傳遞*/
			successPath += "?stock_id="+stock_id+"&stock_name="+stock_name
					+"&stock_trade="+stock_trade+"&stock_trunover="+stock_trunover
					+"&stock_open="+stock_open+"&stock_max="+stock_max+"&stock_min="
					+stock_min+"&stock_close="+stock_close+"&stock_diff="+stock_diff
					+"&stock_transaction="+stock_transaction;
			session.setAttribute("InqResult", "");//此為有查詢動作的token
		}
		/*處理自選股*/
		if( session.getAttribute("Login") != null) {//如果登入的token為空，代表沒有登入，則不處理自選股資料
			int User_id=Integer.parseInt((String)session.getAttribute("UID"));//取得使用者編號
			int count = con.getSelfStockCount(User_id);//取得該使用者的自選股總數
			String[][] result = con.getSelfStockWtihUser(count, User_id);//取得自選股資料
			session.setAttribute("stock_result", result);//用session傳遞自選股資料
			session.setAttribute("stock_count", count);//傳遞自選股數量
		}
		request.getRequestDispatcher(successPath).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
