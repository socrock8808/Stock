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

import filter.EncoderWrapper;
import login.ConMysql;
/**
 * 建立新文章
 */
//此tag為檔案長傳專用tag
@MultipartConfig(location="/Users/Aspretica/eclipse-workspace/Stock/WebContent/images/arti_img",
					maxFileSize=1024*1024*5)//超過大小會丟出例外
@WebServlet("/NewArticle")
public class NewArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//設定請求編碼
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		ConMysql con = new ConMysql();//建立資料庫方法物件
		FileNameTool fnt = new FileNameTool();//建立取得檔案的型態如(.jpg)的物件
		con.conDb();//連接資料庫
		String path = "LoadContent";//目的位置
		String title = request.getParameter("arti_title");//取得文章標題
		String content = request.getParameter("arti_txt");//取得文章內容
		int arti_id = con.getLastestArticleID()+1;//取得最新文章編號
		int uid = Integer.parseInt((String)session.getAttribute("UID"));//取得發文者編號
		con.addArticle(title, content, uid);//將文章加入資料庫
		
		Part photo = request.getPart("photo");//取得檔案
		String ck = fnt.getPhotoName(photo);//取得檔案的型態如(.jpg)
		if(!ck.equals(""))  //如果為空，表示沒有上傳檔案
		{
			String location = "/Stock/images/arti_img/";//檔案讀取路徑
			String filename = arti_id+ck;//設定檔案名稱
			photo.write(filename);//寫入檔案
			con.updatePhoto(location+filename, arti_id);//將檔案路徑寫入資料庫
		}
		session.removeAttribute("LastestArticle");//此為目前討論區是否為最新文章的token，有新文章後，討論區文章就不再是最新文章
		path += "?arti_id="+arti_id;//傳遞參數
		request.getRequestDispatcher(path).forward(request, response);
	}
}
