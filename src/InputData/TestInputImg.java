package InputData;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.ConMysql;

/**
 * Servlet implementation class TestInputImg
 */
@WebServlet("/TestInputImg")
public class TestInputImg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		ConMysql con = new ConMysql();
		Base64.Encoder encode = Base64.getEncoder();
		String path = "/Users/Aspretica/Desktop/tt.jpg";
		String encodetxt="";
		FileInputStream src;
		try {
			src = new FileInputStream(path);
			byte[] pic;
			pic = new byte[src.available()];
			src.read(pic);
			encodetxt = encode.encodeToString(pic);
		} 
		catch (FileNotFoundException e) {} 
		catch (IOException e) {}
		con.conDb();
		con.addImg(encodetxt);
		request.getRequestDispatcher("/TestLoadImg").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
