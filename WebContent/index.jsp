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
<body class="is-preload">
	<div class="section-content">
		<%	//討論版顯示判斷
			if (session.getAttribute("Login") != null)
				out.print("<a style='margin: 0 1em 0 0;' href='http://"+application.getAttribute("IP")+":8080/Stock/LoadArticle'>討論板</a>");
		%>
		<%	//自選股顯示判斷
			if (session.getAttribute("Login") != null)
				out.print("<a href='http://"+application.getAttribute("IP")+":8080/Stock/LoadSelfStock'>自選股</a>");
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
				out.print("<a style='margin: 0 1em 0 0;' href='http://"+application.getAttribute("IP")+":8080/Stock/User_res'>會員管理</a>");
		%>
		<%	//登出顯示判斷
			if (session.getAttribute("Login") != null)
				out.print("<a class='section-item'"
							+"href='http://"+application.getAttribute("IP")+":8080/Stock/Logout'"
							+"style='margin-left: 300'>登出</a>");
		%>
		<%	//使用者名稱顯示判斷
			if (session.getAttribute("Login") != null)
				out.print("<br><span style='margin: 0 3em 0 0; color:#45eda4'>" + session.getAttribute("Login") + "</span><p>您好！</p>");
		%>
	</div>
	<div id="header" style="text-align: center">
		<h1>股票查詢</h1>

	</div>

	<form id="search-form" method="GET"
		action="http://<%=application.getAttribute("IP")%>:8080/Stock/InqStock" style="margin: 5px auto">
		<input type="text" name="stock" id="stock" placeholder="股票名稱或股票代號" />
		<input type="submit" style="margin: 0 0 0 1em;" value="查詢" />
	</form>
	<div style="padding: 0 0 200px 25%;">
		<%	//股票查詢結果顯示判斷
			if (session.getAttribute("InqResult") != null)
				out.print("<p style='color:red;'>" + session.getAttribute("InqResult") + "</p>");
			session.removeAttribute("InqResult");
		%>
	</div>
	<script src="files/js/main.js"></script>
</body>
</html>