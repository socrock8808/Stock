<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>股票分析</title>
<meta charset="utf-8">
<link rel="stylesheet" href="files/css/#">
</head>
<body class="a">
	<div class="second-content">
		<a href="http://localhost:8080/Stock/LoadArticle">討論板</a>
	</div>
	<div class="third-content">
		<a class="section-item" href="links/user_signup.jsp"
			style="margin-left: 300">註冊</a> 
		<a class="section-item" id="member"
			href="links/user_login.jsp">登入</a>
		<a href="http://localhost:8080/Stock/User_res">會員管理</a>

		<%
			if (session.getAttribute("InqResult") != null)
				out.print("<p style='color:red'>" + session.getAttribute("InqResult") + "</p>");
			session.removeAttribute("InqResult");
		%>
		<%
			if (session.getAttribute("Login") != null)
				out.print("<p style='color:red'>" + session.getAttribute("Login") + "</p>");
		%>
	</div>
	<div class="fuorth-content">
		<a class="section-item" href="http://localhost:8080/Stock/Logout"
			style="margin-left: 300">登出</a>
	</div>
	<div id="header" style="text-align: center">
		<h1>股票查詢</h1>

	</div>

	<form id="signup-form" method="GET"
		action="http://localhost:8080/Stock/InqStock">
		<input type="stock" name="stock" id="stock" placeholder="股票名稱或股票代號" />
		<input type="submit" value="查詢" />
	</form>
	<!-- 	<form id="signup-form" method="GET" action="http://localhost:8080/Stock/InqStock">
		<input type="stock" name="stock" id="stock" placeholder="股票名稱或股票代號" />
		<input type="submit" value="查詢"  />
	</form>
	研究一下div能不能當成form來用 -->

	<script src="files/js/#"></script>

</body>
</html>