package article.content;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import login.ConMysql;

/**
 * Servlet implementation class NewArticle
 */
@MultipartConfig(location="/Users/Aspretica/eclipse-workspace/Stock/WebContent/images/arti_img",
					maxFileSize=1024*1024*5)//超過大小會丟出例外
@WebServlet("/NewArticle")
public class NewArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		ConMysql con = new ConMysql();
		FileNameTool fnt = new FileNameTool();
		con.conDb();
		String path = "LoadContent";
		String title = request.getParameter("arti_title");
		String content = request.getParameter("arti_txt");
		int arti_id = con.getLastestArticleID()+1;
		int uid = Integer.parseInt((String)session.getAttribute("UID"));
		con.addArticle(title, content, uid);
		
		Part photo = request.getPart("photo");
		String ck = fnt.getPhotoName(photo);
		if(!ck.equals("")) 
		{
			String location = "/Stock/images/arti_img/";
			String filename = arti_id+ck;
			photo.write(filename);
			con.updatePhoto(location+filename, arti_id);
		}
		session.removeAttribute("LastestArticle");
		path += "?arti_id="+arti_id;
		request.getRequestDispatcher(path).forward(request, response);
	}
}
