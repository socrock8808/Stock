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
	</div>
	<div class="third-content">
		<a href="http://localhost:8080/Stock/Logout">登出</a>
	</div>
	<div>
		<a href="board.jsp">回到討論板</a>
	</div>
	<form method="post" action="http://localhost:8080/Stock/NewArticle"
					 name="article" enctype="multipart/form-data">
		<table>
			<tr>
				<td>標題:</td>
			</tr>
			<tr>
				<td><input class="article" type="text" name="arti_title" required="required"
			size="40"></td>
			</tr>
			<tr>
				<td>文章內容:</td>
			</tr>
			<tr>
				<td><textarea class="article" name="arti_txt" rows="18" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>上傳照片:<input type="file" name="photo" /></td>
			</tr>
		</table>
		<input type="submit" value="傳送" > <input
			type="reset" value="重填">
	</form>
</body>
<script src="../files/js/main.js"></script>
</html>