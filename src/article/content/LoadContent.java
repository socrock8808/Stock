package article.content;


import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import login.ConMysql;

@WebServlet("/LoadContent")
public class LoadContent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		ConMysql con = new ConMysql();
		con.conDb();
		int arti_id = Integer.parseInt(request.getParameter("arti_id"));
		String path = "links/post_content.jsp";
		
		int num = Integer.parseInt(con.getArticleData("arti_viewNum", arti_id))+1;
		con.updateViewNum(num, arti_id);
		String title = URLEncoder.encode(con.getArticleData("arti_title", arti_id), "utf-8");
		String content = URLEncoder.encode(con.getArticleData("arti_txt", arti_id), "utf-8");
		String user = URLEncoder.encode(con.getUserDataWithAricle("User_Name", arti_id), "utf-8");
		String time = URLEncoder.encode(con.getArticleData("arti_update", arti_id), "utf-8");
		String photo = con.getArticleData("arti_img", arti_id);
		String User_id = con.getArticleData("user_id", arti_id);
		path += "?arti_title="+title+"&arti_txt="+content
				+"&User_Name="+user+"&arti_viewNum="+num
				+"&arti_update="+time+"&arti_id="+arti_id
				+"&User_id="+User_id;
		if(photo != null)
			path += "&arti_img="+photo;
		
		int RCount = con.getReplyCount(arti_id);
		String[][] reply = con.getReply(RCount, arti_id);
		session.setAttribute("reply", reply);
		path += "&reply_count="+RCount;
		response.sendRedirect(path);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
