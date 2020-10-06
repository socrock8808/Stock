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
 * Servlet implementation class LoadArticle
 */
@WebServlet("/LoadArticle")
public class LoadArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		ConMysql con = new ConMysql();
		String[][] arti = new String[10][4];
		String path="links/board.jsp";
		con.conDb();
		int id = con.getLastestArticleID();
		int count = id;
		session.setAttribute("LastestId", id);
		session.setAttribute("ArtiCount", con.getArticleCount());
		if(id < 10)
		{/*文章數少於10*/
			for(int i=0;i<count;i++)
			{
				arti[i][0] = con.getArticleData("arti_id", id);
				arti[i][1] = con.getArticleData("arti_title", id);
				arti[i][2] = con.getUserDataWithAricle("User_Name", id);
				arti[i][3] = con.getArticleData("arti_update", id);
				id--;
			}
			session.setAttribute("arti_count", count);
		}
		else
		{/*文章數大於10*/
			for(int i=0;i<10;i++)
			{
				arti[i][0] = con.getArticleData("arti_id", id);
				arti[i][1] = con.getArticleData("arti_title", id);
				arti[i][2] = con.getUserDataWithAricle("User_Name", id);
				arti[i][3] = con.getArticleData("arti_update", id);
				id--;
			}
			session.setAttribute("arti_count", 10);
		}
		session.setAttribute("id", id);
		session.setAttribute("array", arti);
		//request.getRequestDispatcher(path).forward(request, response);
		response.sendRedirect(path);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
