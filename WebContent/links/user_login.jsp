<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Input data</title>
<link rel="stylesheet" href="../files/css/main.css">
</head>
<body>
	<div class="section-content">
	<a href="../index.jsp" class="card-link">回首頁</a>
	</div>
	<div class="third-content">
	<a class='section-item' href='links/user_signup.jsp' style='margin-left: 300'>註冊</a>
	</div>
	<div id="header" style="text-align: center">
	<form method="post" action="http://localhost:8080/Stock/Controller">
		<p>
			<font size="5"><b>Login</b></font>
			<%
				if(session.getAttribute("LoginResult") != null)
					out.print("<p style='color:red'>" + session.getAttribute("LoginResult") + "</p>");						
				session.removeAttribute("LoginResult");
			%>
		</p>
		<table  style="margin: 0px auto">
			<tr>
				<td>使用者名稱:</td>
				<td><input type="text" name="user" size="20"></td>
			</tr>
			<tr>
				<td>使用者密碼:</td>
				<td><input type="password" name="password" size="20"></td>
			</tr>
		</table>
		<input type="submit" value="登入" /> <input type="reset" value="取消" />
	</form>
	</div>
	<script src="../files/js/main.js"></script>
</body>
</html>