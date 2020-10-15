package article.content;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Part;
/*取的上傳檔案型態的方法*/
public class FileNameTool {
	public String getPhotoName(Part part) {
		Pattern fileNameRegex = Pattern.compile("filename=\"(.*)\"");
		String header = part.getHeader("Content-Disposition");//取得檔案資訊
		Matcher matcher = fileNameRegex.matcher(header);//用正規表示法搜尋檔案名稱
		matcher.find();
		String filename = matcher.group(1);//撈出檔案名稱
		if( !filename.equals(""))//如果有名稱，取出檔案型態名稱
			return filename.substring(filename.lastIndexOf("."));
		else
			return "";
	}
}
