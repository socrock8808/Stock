<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>股票分析</title>
<meta charset="utf-8">
<link rel="stylesheet" href="files/css/main.css">
</head>
<%if(application.getAttribute("IP") == null )
	application.setAttribute("IP", "localhost");%>
<body class="a">
	<div class="section-content">
		<%	//討論版顯示判斷
			if (session.getAttribute("Login") != null)
				out.print("<a href='http://"+application.getAttribute("IP")+":8080/Stock/LoadArticle'>討論板</a>");
		%>
		<a href="#">自選股</a>
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
				out.print("<a href='http://"+application.getAttribute("IP")+":8080/Stock/User_res'>會員管理</a>");
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
							+"href='http://"+application.getAttribute("IP")+":8080/Stock/Logout'"
							+"style='margin-left: 300'>登出</a>");
		%>
	</div>
	<div id="header" style="text-align: center">
		<h1>股票查詢</h1>

	</div>

	<form id="signup-form" method="GET"
		action="http://<%=application.getAttribute("IP")%>:8080/Stock/InqStock" style="margin: 5px auto">
		<input type="text" name="stock" id="stock" placeholder="股票名稱或股票代號" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" style="margin: 0px" value="查詢" />
	</form>
	<script src="files/js/main.js"></script>
</body>
</html>