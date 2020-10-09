package article.content;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import login.ConMysql;


/**
 * Servlet implementation class UpdateArticle
 */
@MultipartConfig(location="/Users/Aspretica/eclipse-workspace/Stock/WebContent/files/arti_img",
					maxFileSize=1024*1024*5)//超過大小會丟出例外
@WebServlet("/UpdateArticle")
public class UpdateArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		ConMysql con = new ConMysql();
		FileNameTool fnt = new FileNameTool();
		con.conDb();
		String path = "LoadContent";
		String title = request.getParameter("arti_title");
		String content = request.getParameter("arti_txt");
		int arti_id = Integer.parseInt(request.getParameter("arti_id"));
		con.updateArticle(title, content, arti_id);
		Part photo = request.getPart("photo");
		String ck = fnt.getPhotoName(photo);
		if(!ck.equals("")) 
		{
			String location = "/Users/Aspretica/eclipse-workspace/Stock/WebContent/files/arti_img/";
			String filename = arti_id+ck;
			photo.write(filename);
			con.updatePhoto(location+filename, arti_id);
		}
		path += "?arti_id="+arti_id;
		response.sendRedirect(path);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
