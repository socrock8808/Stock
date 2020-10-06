<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>發佈文章</title>
<script type="text/javascript">

</script>

</head>

<body>
	<div class="#">
		<a href="../index.jsp">回首頁</a>
	</div>
	<div>
		<a href="http://localhost:8080/Stock/Logout">登出</a>
	</div>
	<div>
		<a href="board.jsp">回到討論板</a>
	</div>
	<form method="post" action="http://localhost:8080/Stock/NewArticle" name="article">
		<a>標題:</a><br> <input class="article" type="text" name="arti_title" required="required"
			size="40">
		<p></p>
		文章內容:<br>
		<textarea class="article" name="arti_txt" rows="18" cols="50"></textarea>
		<p></p>
		<input type="submit" value="傳送" action="#"> <input
			type="reset" value="重填">
		<p></p>
	</form>
</body>
</html>