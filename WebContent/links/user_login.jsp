<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登入畫面</title>
<link rel="stylesheet" href="../files/css/main.css">
<style type="text/css">
input[type="text"], input[type="password"], input[type="email"], select,
	textarea {
	display: inline;
	width: 13%;
}

p {
	margin: 2em 0 0 0;
	padding: 0;
}
</style>
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
		<p id="alert">
			<%
				if (session.getAttribute("LoginResult") != null)
					out.print("<font style='color:red'>" + session.getAttribute("LoginResult") + "</font>");
				session.removeAttribute("LoginResult");
			%>
			<%					
				if (session.getAttribute("RegisterResult") != null)
					out.print("<font style='color:green'>" + session.getAttribute("RegisterResult") + "</font>");
				session.removeAttribute("RegisterResult");
			%>
		</p>
		<form id="form1" method="post"
			action="http://<%=application.getAttribute("IP")%>:8080/Stock/Controller">
			<p style="text-align: center;">
				使用者名稱: <input type="text" name="user" size="20">
			</p>
			<p style="text-align: center;">
				使用者密碼: <input type="password" name="password" size="20">
			</p>
			<p style="text-align: center;">
				輸入驗證碼: <input type="text" name="LoginCheckImage" id="Image"
					size="20">
			</p>
			<p style="margin: 1em 0 0 0;">
				<img src="LoginCheckImage.jsp" alt="newImage">
			</p>
			<p style="margin: 0.8em 0 0 0;">
				<input style="margin: 0 1em 0 0;" type="submit"
					value="登入" /> <input type="reset" value="重填" />
			</p>
		</form>
	</div>
	<script src="../files/js/main2.js"></script>
</body>
</html>