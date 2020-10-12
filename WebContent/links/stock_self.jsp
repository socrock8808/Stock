<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../files/css/main.css">
<script src="../files/js/main.js"></script>
<title>討論區</title>
</head>

<body>
	<div  class="section-content">
		<a href="../index.jsp">回首頁</a>
	</div>
	<div class="third-content">
		<a href="http://localhost:8080/Stock/Logout">登出</a>
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
		<%
			String[][] no = (String[][]) session.getAttribute("stock_result");
			for (int i = 0; i < (int) session.getAttribute("stock_count"); i++) {
		%>
		<tr class="row">
			<td align="center" nowrap>
				<%=no[i][0]%>
			</td>
			<td align="center" nowrap>
				<%=no[i][1]%>
			</td>
			<td align="center" nowrap>
				<%=no[i][2]%>
			</td>
			<td align="center" nowrap>
				<%=no[i][3]%>
			</td>
			<td align="center" nowrap>
				<%=no[i][4]%>
			</td>
			<td align="center" nowrap>
				<%=no[i][5]%>
			</td>
			<td align="center" nowrap>
				<%=no[i][6]%>
			</td>
			<td align="center" nowrap>
				<%=no[i][7]%>
			</td>
			<td align="center" nowrap>
				<%=no[i][8]%>
			</td>
			<td align="center" nowrap>
				<%=no[i][9]%>
			</td>
			<td>
				<a href="http://localhost:8080/Stock/DeleteSelfStock?stock_id=<%=no[i][0]%>">刪除</a>
			</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>

<%-- 
使用forward將36行改為
String[][] no = request.getAttribute("array");
使用session將36行改為
String[][] no = (String[][]) session.getAttribute("array");
--%>
