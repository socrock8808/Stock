<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>股票代號查詢結果</title>
<link rel="stylesheet" href="files/css/main.css">

<script type="text/javascript" src="setting/js/#"></script>
</head>
<body class="is-preload">

<div class="section-content">
	<a href="index.jsp">回首頁</a>
</div>
	<div class="header" style="text-align: center;">
		<h1>股票資訊</h1>
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