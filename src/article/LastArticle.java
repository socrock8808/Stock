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
@WebServlet("/LastArticle")
public class LastArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		ConMysql con = new ConMysql();
		String[][] arti = new String[10][4];
		String path="links/board.jsp";
		con.conDb();
		int id = (int)session.getAttribute("ArtiCount")%10;
		if(id ==0)
			id =10;
		int count = id;
		for(int i=0;i<count;i++)
		{
			arti[i][0] = con.getArticleData("arti_id", id);
			arti[i][1] = con.getArticleData("arti_title", id);
			arti[i][2] = con.getUserDataWithAricle("User_Name", id);
			arti[i][3] = con.getArticleData("arti_update", id);
			id--;
		}
		session.setAttribute("arti_count", count);
		session.setAttribute("id", id);
		session.setAttribute("array", arti);
		//request.getRequestDispatcher(path).forward(request, response);
		response.sendRedirect(path);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
