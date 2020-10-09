package article.content;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Part;

public class FileNameTool {
	public String getPhotoName(Part part) {
		Pattern fileNameRegex = Pattern.compile("filename=\"(.*)\"");
		String header = part.getHeader("Content-Disposition");
		Matcher matcher = fileNameRegex.matcher(header);
		matcher.find();
		String filename = matcher.group(1);
		if( !filename.equals(""))
			return filename.substring(filename.lastIndexOf("."));
		else
			return "";
	}
}
