<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>文章內文</title>
</head>

<body>
	<div>
		<a href="../index.jsp" class="#">回首頁</a>
	</div>
	<div>
		<a href="http://localhost:8080/Stock/Logout">登出</a>
	</div>
	<div>
		<a href="board.jsp" class="#">回到討論板</a>
	</div>
	<div>
		<a href="#" class="#">文章編輯</a>
	</div>
	<div>
		<table border="0" class="art_content" style="width: 600px">
			<tr>
				<td width="900rem" colspan="2" align="center"><%=request.getParameter("arti_title") %></td>
			</tr>
			<tr>
				<td align="center"><%=request.getParameter("User_Name") %></td>
			</tr>
			<tr>
				<td align="center">最後更新時間</td>
				<td>瀏覽人數：<%=request.getParameter("arti_viewNum")%></td>
			</tr>
			<tr>
				<td width="80%"><%=request.getParameter("arti_txt") %></td>
			</tr>
			
		</table>
	</div>
	<!-- <div>
	<p>回覆文章</p>
		<form>
			<textarea cols="50" rows="10"></textarea>
			<br> <input type="submit" value="送出" action="#" /> <input
				type="reset" value="清除">
		</form>
	</div> -->

</body>
</html>