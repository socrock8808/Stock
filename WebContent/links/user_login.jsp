<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登入畫面</title>
<link rel="stylesheet" href="../files/css/main.css">
</head>
<body class="is-preload">
	<div class="section-content">
	<a href="../index.jsp">回首頁</a>
	</div>
	<div class="third-content">
	<a href='user_signup.jsp' style='margin-left: 300'>註冊</a>
	</div>
	<div id="header" style="text-align: center">
		<h1>Login</h1>
		<%
			if(session.getAttribute("LoginResult") != null)
				out.print("<p style='color:red'>" + session.getAttribute("LoginResult") + "</p>");						
			session.removeAttribute("LoginResult");
		%>
	</div>
	<form id="signup-form" method="post" style="margin: 0 auto;"
		action="http://<%=application.getAttribute("IP")%>:8080/Stock/Controller">
			<p>使用者名稱:</p>
			<input type="text" name="user" size="20">
			<p>使用者密碼:</p>
			<input type="password" name="password" size="20">
		<p style="text-align: center;">
			<input style="margin: 0 1em 0 0;" type="submit" value="登入" />
			<input type="reset" value="取消" />
		</p>
	</form>
	<div style="padding: 18px 0 200px 0;"></div>
	<script src="../files/js/main2.js"></script>
</body>
</html>