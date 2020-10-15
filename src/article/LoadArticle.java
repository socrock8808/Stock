package article;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.ConMysql;

/**
 * 讀取討論版
 */
@WebServlet("/LoadArticle")
public class LoadArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		ConMysql con = new ConMysql();//建立資料庫方法物件
		String[][] arti = new String[10][4];//建立放置文章資料的陣列
		String path="links/board.jsp";//目標位置
		con.conDb();//連接資料庫
		int id = con.getLastestArticleID();//取得最新文章id
		int count = id;
		session.setAttribute("LastestId", id);//傳遞最新文章編號
		session.setAttribute("ArtiCount", con.getArticleCount());//傳遞文章數量
		if(id < 10)
		{/*文章數少於10*/
			for(int i=0;i<count;i++)//取得文章資料
			{
				arti[i][0] = con.getArticleData("arti_id", id);
				arti[i][1] = con.getArticleData("arti_title", id);
				arti[i][2] = con.getUserDataWithAricle("User_Name", id);
				arti[i][3] = con.getArticleData("arti_update", id);
				id--;
			}
			session.setAttribute("arti_count", count);//傳遞文章數量
		}
		else
		{/*文章數大於10*/
			for(int i=0;i<10;i++)//取得文章資料
			{
				arti[i][0] = con.getArticleData("arti_id", id);
				arti[i][1] = con.getArticleData("arti_title", id);
				arti[i][2] = con.getUserDataWithAricle("User_Name", id);
				arti[i][3] = con.getArticleData("arti_update", id);
				id--;
			}
			session.setAttribute("arti_count", 10);//傳遞文章數量
		}
		session.setAttribute("LastestArticle", "");//建立最新文章token
		session.setAttribute("id", id);//傳遞下一頁第一個文章編號
		session.setAttribute("array", arti);//傳遞文章資料
		response.sendRedirect(path);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
