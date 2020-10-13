<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>股票代號查詢結果</title>
<link rel="stylesheet" href="files/css/main.css">

</head>
<body class="is-preload">

<div class="section-content">
	<a style='margin: 0 1em 0 0;' href="index.jsp">回首頁</a>
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
<div class="header" style="text-align: center;">
	<h1>股票資訊</h1>
</div>
<form id="search-form" method="GET"
		action="http://localhost:8080/Stock/InqStock" style="margin: 5px auto">
		<input type="text" name="stock" id="stock" placeholder="股票名稱或股票代號" />
		<input type="submit" style="margin: 0 0 0 1em;" value="查詢" />
	</form>
	<div style="padding: 0 0 0 25%;">
		<%	//股票查詢結果顯示判斷
			if (session.getAttribute("InqResult") != null)
				out.print("<p style='color:red;'>" + session.getAttribute("InqResult") + "</p>");
			session.removeAttribute("InqResult");
		%>
	</div>
	<div style="margin: 0 0 0 auto;">
		<%
			if(session.getAttribute("Login") != null)
			{%>
				<a href='http://<%=application.getAttribute("IP")%>:8080/Stock/NewSelfStock?stock_id=<%= request.getParameter("stock_id")%>'>加入自選股</a>
			<%}
			else
			{%>
				<a href='http://<%=application.getAttribute("IP")%>:8080/Stock/links/user_login.jsp'>加入自選股</a>
			<%}
		%>
		
	</div>
	<table border="1">
		<tr valign=top class="table-colunm">
			<td align=center nowrap=nowrap><font>股票代碼</font></td>
			<td align=center nowrap=nowrap><font>證券名稱</font></td>
			<td align=center nowrap=nowrap><font>成交股數</font></td>
			<td align=center nowrap=nowrap><font>成交金額</font></td>
			<td align=center nowrap=nowrap><font>開盤價</font></td>
			<td align=center nowrap=nowrap><font>最高價</font></td>
			<td align=center nowrap=nowrap><font>最低價</font></td>
			<td align=center nowrap=nowrap><font>收盤價</font></td>
			<td align=center nowrap=nowrap><font>漲跌價差</font></td>
			<td align=center nowrap=nowrap><font>成交筆數</font></td>
		</tr>
		<tr class="row">
			<td align="center" nowrap>
				<%
					out.print(request.getParameter("stock_id"));
				%>
			</td>
			<td align="center" nowrap>
				<%
					out.print(session.getAttribute("stock_name"));
				%>
			</td>
			<td align="center" nowrap>
				<%
					out.print(request.getParameter("stock_trade"));
				%>
			</td>
			<td align="center" nowrap>
				<%
					out.print(request.getParameter("stock_trunover"));
				%>
			</td>
			<td align="center" nowrap>
				<%
					out.print(request.getParameter("stock_open"));
				%>
			</td>
			<td align="center" nowrap>
				<%
					out.print(request.getParameter("stock_max"));
				%>
			</td>
			<td align="center" nowrap>
				<%
					out.print(request.getParameter("stock_min"));
				%>
			</td>
			<td align="center" nowrap>
				<%
					out.print(request.getParameter("stock_close"));
				%>
			</td>
			<td align="center" nowrap>
				<%
					out.print(request.getParameter("stock_diff"));
				%>
			</td>
			<td align="center" nowrap>
				<%
					out.print(request.getParameter("stock_transaction"));
				%>
			</td>
		</tr>
	</table>
	<div style="margin: 1em 0 0 0; text-align: center; opacity: 0.3;">
		<img width="500" height="300" alt="圖片失效" border="1" src="images/fake.jpg">
	</div>
</body>
<script src="files/js/main.js"></script>
</html>