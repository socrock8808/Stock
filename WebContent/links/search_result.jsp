<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>股票代號查詢結果</title>
<link rel="stylesheet" href="files/css/main.css">
<!-- <style type="text/css">
table {
	border: 0;
	width: 500px;
}

font {
	color: #000000;
}

.table-title {
	background-color: #02F78E;
}

.table-colunm {
	background-color: #02F78E;
}

.row {
	background-color: #96FED1;
}
</style> -->

<script type="text/javascript" src="setting/js/#"></script>
</head>
<body>

	<%--@ page import="login.ConMysql"--%>
	<%--
		ConMysql con = new ConMysql();
		con.conDb();
		con.getStockData(column, id);
	--%>
	<%--
		out.prnint(data.getAttribute("data"));
	--%>

<div class="section-content">
	<a href="index.jsp">回首頁</a>
</div>

	<table>
		<tr class="title-bg">
			<td colspan=10 valign=top align=center class="table-title"><b><a>股票資訊</a></b></td>
		</tr>
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

	<div>
		<img src="https://fakeimg.pl/200x100/?retina=1&text=こんにちは&font=noto">
	</div>
</body>
<script src="files/js/main.js"></script>
</html>