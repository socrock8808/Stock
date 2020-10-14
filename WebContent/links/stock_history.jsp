<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../files/css/main.css">
<title>討論區</title>
</head>

<body class="is-preload">
	<div  class="section-content">
		<a href="../index.jsp">回首頁</a>
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
	<form id="search-form" method="GET"
		action="http://localhost:8080/Stock/LoadStockResult" style="margin: 5px auto">
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
	<% %>
	<div>
		<p>股票代碼:<%=request.getParameter("stock_id")%></p>
		<p>證券名稱:<%=request.getParameter("stock_name")%></p>
	</div>
	<table border="1">
		<tr valign=top class="table-colunm">
			<td align=center nowrap=nowrap><font>成交股數</font></td>
			<td align=center nowrap=nowrap><font>成交金額</font></td>
			<td align=center nowrap=nowrap><font>開盤價</font></td>
			<td align=center nowrap=nowrap><font>最高價</font></td>
			<td align=center nowrap=nowrap><font>最低價</font></td>
			<td align=center nowrap=nowrap><font>收盤價</font></td>
			<td align=center nowrap=nowrap><font>漲跌價差</font></td>
			<td align=center nowrap=nowrap><font>成交筆數</font></td>
			<td align=center nowrap=nowrap><font>日期</font></td>
		</tr>
		<%
			String[][] no = (String[][]) session.getAttribute("stock_history");
			for (int i = 0; i < (int) session.getAttribute("stock_hisCount"); i++) {
		%>
		<tr class="row">
			<td align="center" nowrap><%=no[i][2]%></td>
			<td align="center" nowrap><%=no[i][3]%></td>
			<td align="center" nowrap><%=no[i][4]%></td>
			<td align="center" nowrap><%=no[i][5]%></td>
			<td align="center" nowrap><%=no[i][6]%></td>
			<td align="center" nowrap><%=no[i][7]%></td>
			<td align="center" nowrap><%=no[i][8]%></td>
			<td align="center" nowrap><%=no[i][9]%></td>
			<td align="center" nowrap><%=no[i][10]%></td>
		</tr>
		<%
			}
		%>
	</table>
	<div style="margin: 1em 0 0 0; text-align: center; opacity: 0.3;">
		<img width="500" height="300" alt="圖片失效" border="1" src="images/fake.jpg">
	</div>
	 
<script src="../files/js/main2.js"></script>
</body>
</html>