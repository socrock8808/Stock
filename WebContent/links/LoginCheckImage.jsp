<%@page contentType="image/jpeg" pageEncoding="UTF-8"%>
<%@page import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"%>
<!DOCTYPE html>
<html>
<body>
	<%!Color getRandColor(int fc, int bc) {
		//給定範圍獲得隨機顏色
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}%>

	<%
	//設定頁面不暫存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	// 在記憶體中建立圖像
	int width = 100, height = 40;
	BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	// 取得 Graphics物件
	Graphics g = image.getGraphics();
	//生成隨機類
	Random random = new Random();
	// 設定背景色
	g.setColor(getRandColor(200, 250));
	g.fillRect(0, 0, width, height);
	//設定字體
	g.setFont(new Font("Times New Roman", Font.PLAIN, 32));
	// 隨機產生155條干擾線
	g.setColor(getRandColor(160, 200));

	for (int i = 0; i < 222; i++) {
		int x = random.nextInt(width);
		int y = random.nextInt(height);
		int xl = random.nextInt(30);
		int yl = random.nextInt(30);
		g.drawLine(x, y, x + xl, y + yl);
	}
	// 取隨機產生的認證碼(4位數)
	String ck = "";

	for (int i = 0; i < 4; i++) {
		String rand = String.valueOf(random.nextInt(10));
		ck += rand;
		// 將認證碼顯示到圖像中
		g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
		g.drawString(rand, 23 * i + 7, 30);
	}
	// 將認證碼存入SESSION
	session.setAttribute("LoginCheckImage", ck);
	// 圖像生效
	g.dispose();
	//
	out.clear();
	out = pageContext.pushBody();
	// 輸出圖像到頁面
	ImageIO.write(image, "JPEG", response.getOutputStream());
	%>
</body>
</html>