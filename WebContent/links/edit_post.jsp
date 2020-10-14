<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../files/css/main.css">
<title>編輯文章</title>

</head>

<body class="is-preload">
	<div class="section-content">
		<a href="../index.jsp">回首頁</a>
		<a href="board.jsp" style="margin: 0 0 0 3em;">回到討論板</a>
	</div>
	<div class="third-content">
		<a href="http://<%=application.getAttribute("IP")%>:8080/Stock/Logout">登出</a>
	</div>
	<div id="header" style="text-align: center;">
		<form method="post" action="http://<%=application.getAttribute("IP")%>:8080/Stock/UpdateArticle"
					 name="article" enctype="multipart/form-data">
		<table style="margin: 1em auto;">
			<tr>
				<td style="text-align: left;">標題:</td>
			</tr>
			<tr>
				<td><input class="article" type="text" required="required"
			size="40" value="<%=request.getParameter("arti_title") %>"></td>
			</tr>
			<tr>
				<td style="text-align: left;">文章內容:</td>
			</tr>
			<tr>
				<td><textarea class="article" rows="13" cols="50"><%= request.getParameter("arti_txt")%></textarea></td>
			</tr>
		</table>
		<p style="text-align: center;">
			<input style="margin: 0 1em 0 0;" type="submit" value="確定修改" >
			<input type="button" value="返回" onClick="history.back()" />
		</p>
	</form>
	</div>
</body>
<script src="../files/js/main2.js"></script>
</html>