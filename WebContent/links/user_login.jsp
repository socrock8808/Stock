<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Input data</title>
</head>
<body>

	<form method="post" action="http://localhost:8080/Stock/Controller">
		<p align="left">
			<font size="5"><b>Login</b></font>
			<%
				if(session.getAttribute("LoginResult") != null)
					out.print("<p style='color:red'>" + session.getAttribute("LoginResult") + "</p>");						
				session.removeAttribute("LoginResult");
			%>
		</p>
		<p align="left">
			使用者名稱 <input type="text" name="user" size="20">
		<P></P>
		使用者密碼 <input type="password" name="password" size="20">
		<p></p>
		<input type="submit" value="登入" /> <input type="reset" value="取消" />
	</form>
	<a href="../index.jsp" class="card-link">回首頁</a>
</body>
</html>