package article.reply;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import article.content.FileNameTool;
import login.ConMysql;

@MultipartConfig(location="/Users/Aspretica/eclipse-workspace/Stock/WebContent/images/reply_img",
maxFileSize=1024*1024*5)//超過大小會丟出例外
@WebServlet("/NewReply")
public class NewReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		FileNameTool fnt = new FileNameTool();
		ConMysql con = new ConMysql();
		String path = "LoadContent";
		con.conDb();
		int arti_id = Integer.parseInt(request.getParameter("arti_id"));
		int user_id = Integer.parseInt((String)session.getAttribute("UID"));
		String reply_txt= request.getParameter("reply_txt");
		con.addReply(reply_txt, arti_id, user_id);
		
		Part photo = request.getPart("photo");
		String ck = fnt.getPhotoName(photo);
		int reply_id = con.getLastestReplyID();
		if(!ck.equals("")) 
		{
			String location = "/Stock/images/reply_img/";
			String filename = arti_id+"_"+reply_id+ck;
			photo.write(filename);
			con.updateReplyPhoto(location+filename, reply_id);
		}
		path += "?arti_id="+arti_id;
		request.getRequestDispatcher(path).forward(request, response);
	}

}
