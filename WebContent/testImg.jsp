<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>股票分析</title>
<meta charset="utf-8">
<link rel="stylesheet" href="files/css/main.css">
</head>
<body class="a">
	<div>
		<img src="data:image/jpg;base64,<%=session.getAttribute("img")%>" width=200>
	</div>
	<div id="header" style="text-align: center">
		<h1>股票查詢</h1>

	</div>

	<form id="signup-form" method="GET"
		action="http://localhost:8080/Stock/InqStock">
		<input type="text" name="stock" id="stock" style="margin: 0px auto" placeholder="股票名稱或股票代號" />
		<input type="submit" value="查詢" />
	</form>
	<script src="files/js/main.js"></script>
</body>
</html>