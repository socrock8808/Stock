<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../files/css/main.css">
<title>發佈文章</title>
<script type="text/javascript">

</script>

</head>

<body>
	<div class="section-content">
		<a href="../index.jsp">回首頁</a>
		<a href="board.jsp" style="margin: 0 0 0 3em;">回到討論板</a>
	</div>
	<div class="third-content">
		<a href="http://<%=application.getAttribute("IP")%>:8080/Stock/Logout">登出</a>
	</div>
	<div id="header" style="text-align: center;">
		<form method="post" action="http://<%=application.getAttribute("IP")%>:8080/Stock/NewArticle"
					 name="article" enctype="multipart/form-data">
		<table style="margin: 1em auto;">
			<tr>
				<td style="text-align: left;">標題:</td>
			</tr>
			<tr>
				<td><input class="article" type="text" name="arti_title" required="required"
			size="40"></td>
			</tr>
			<tr>
				<td style="text-align: left;">文章內容:</td>
			</tr>
			<tr>
				<td><textarea class="article" name="arti_txt" rows="13" cols="50"></textarea></td>
			</tr>
			<tr>
				<td style="text-align: left;">上傳照片:<input type="file" name="photo" /></td>
			</tr>
		</table>
		<p style="text-align: center;">
			<input style="margin: 0 1em 0 0;" type="submit" value="傳送" >
			<input type="reset" value="重填">
		</p>
	</form>
	</div>
</body>
<script src="../files/js/main.js"></script>
</html>