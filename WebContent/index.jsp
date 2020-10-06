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
	<div class="second-content">
		<%	//討論版顯示判斷
			if (session.getAttribute("Login") != null)
				out.print("<a href='http://localhost:8080/Stock/LoadArticle'>討論板</a>");
		%>
	</div>
	<div class="third-content">
		<%	//註冊、登入顯示判斷
			if (session.getAttribute("Login") == null)
			{
				out.print("<a class='section-item' href='links/user_signup.jsp' style='margin-left: 300'>註冊</a> ");
				out.print("<a class='section-item' id='member' href='links/user_login.jsp'>登入</a>");
			}
		%>
		<%	//會員管理顯示判斷
			if (session.getAttribute("Login") != null)
				out.print("<a href='http://localhost:8080/Stock/User_res'>會員管理</a>");
		%>
		<%	//股票查詢結果顯示判斷
			if (session.getAttribute("InqResult") != null)
				out.print("<p style='color:red'>" + session.getAttribute("InqResult") + "</p>");
			session.removeAttribute("InqResult");
		%>
		<%	//使用者名稱顯示判斷
			if (session.getAttribute("Login") != null)
				out.print("<p style='color:red'>" + session.getAttribute("Login") + "</p>");
		%>
		<%	//登出顯示判斷
			if (session.getAttribute("Login") != null)
				out.print("<a class='section-item'"
							+"href='http://localhost:8080/Stock/Logout'"
							+"style='margin-left: 300'>登出</a>");
		%>
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