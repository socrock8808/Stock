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
/*建立新回覆*/
/*此tag為上傳檔案專用的tag，路徑為檔案儲存絕對路徑*/
@MultipartConfig(location="/Users/Aspretica/eclipse-workspace/Stock/WebContent/images/reply_img",
maxFileSize=1024*1024*5)//超過大小會丟出例外
@WebServlet("/NewReply")
public class NewReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//設定請求編碼
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");//設定回應編碼
		HttpSession session = request.getSession();
		FileNameTool fnt = new FileNameTool();//建立取得檔案的型態如(.jpg)的物件
		ConMysql con = new ConMysql();//建立資料庫方法物件
		String path = "LoadContent";//目的位置
		con.conDb();//連接資料庫
		int arti_id = Integer.parseInt(request.getParameter("arti_id"));//取得文章id
		int user_id = Integer.parseInt((String)session.getAttribute("UID"));//取得回覆者編號
		String reply_txt= request.getParameter("reply_txt");//取得回覆內容
		con.addReply(reply_txt, arti_id, user_id);//將回覆加入資料庫中
		
		Part photo = request.getPart("photo");//取得檔案
		String ck = fnt.getPhotoName(photo);//取得檔案的型態如(.jpg)
		int reply_id = con.getLastestReplyID();//取得最新的回覆ID
		if(!ck.equals("")) //如果為空，表示沒有上傳檔案
		{
			String location = "/Stock/images/reply_img/";//檔案讀取路徑
			String filename = arti_id+"_"+reply_id+ck;//設定檔案名稱
			photo.write(filename);//寫入檔案
			con.updateReplyPhoto(location+filename, reply_id);//將檔案路徑寫入資料庫
		}
		path += "?arti_id="+arti_id;//傳遞參數
		request.getRequestDispatcher(path).forward(request, response);
	}

}
