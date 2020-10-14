<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>股票代號查詢結果</title>
<link rel="stylesheet" href="files/css/main.css">
<style>
.table-colunm {
	/*background-color: balck;
	opacity: 0.6;
	font-color: white;*/
	
}
</style>
</head>
<body class="is-preload">

	<div class="section-content">
		<a style='margin: 0 1em 0 0;' href="index.jsp">回首頁</a>
	</div>
	<div class="third-content">
		<%
			//註冊、登入顯示判斷
			if (session.getAttribute("Login") == null) {
				out.print("<a class='section-item' href='links/user_signup.jsp' style='margin-left: 300'>註冊</a> ");
				out.print("<a class='section-item' id='member' href='links/user_login.jsp'>登入</a>");
			}
		%>
		<%
			//會員管理顯示判斷
			if (session.getAttribute("Login") != null)
				out.print("<a style='margin: 0 1em 0 0;' href='http://" + application.getAttribute("IP")
						+ ":8080/Stock/User_res'>會員管理</a>");
		%>
		<%
			//登出顯示判斷
			if (session.getAttribute("Login") != null)
				out.print("<a class='section-item'" + "href='http://" + application.getAttribute("IP")
						+ ":8080/Stock/Logout'" + "style='margin-left: 300'>登出</a>");
		%>
		<%
			//使用者名稱顯示判斷
			if (session.getAttribute("Login") != null)
				out.print("<br><span style='margin: 0 3em 0 0; color:#45eda4'>" + session.getAttribute("Login")
						+ "</span><p>您好！</p>");
		%>
	</div>
	<div class="header" style="text-align: center;">
		<h1>股票資訊</h1>
	</div>
	<form id="search-form" method="GET"
		action="http://localhost:8080/Stock/LoadStockResult" style="margin: 5px auto">
		<input type="text" name="stock" id="stock" placeholder="股票名稱或股票代號" />
		<input type="submit" style="margin: 0 0 0 1em;" value="查詢" />
	</form>
	<div style="padding: 0 0 0 25%;">
		<%/*
			//股票查詢結果顯示判斷
			if (session.getAttribute("InqResult") != null)
				out.print("<p style='color:red;'>" + session.getAttribute("InqResult") + "</p>");
		*/%>
	</div>
	<%
		if( session.getAttribute("InqResult") != null){%>
			<div style="width: 5em; height: 1.6em; text-align: center; background-color: #828282; opacity: 0.8; margin: 1em auto 5px 2em; border-radius: 8px;">
				<h4>搜尋結果</h4>
			</div>
			<table border="1">
				<tr valign=top class="table-colunm">
					<td align=center nowrap=nowrap width="10%"><font>股票代碼</font></td>
					<td align=center nowrap=nowrap width="10%"><font>證券名稱</font></td>
					<td align=center nowrap=nowrap width="11%"><font>成交股數</font></td>
					<td align=center nowrap=nowrap width="18%"><font>成交金額</font></td>
					<td align=center nowrap=nowrap width="7%"><font>開盤價</font></td>
					<td align=center nowrap=nowrap width="7%"><font>最高價</font></td>
					<td align=center nowrap=nowrap width="7%"><font>最低價</font></td>
					<td align=center nowrap=nowrap width="7%"><font>收盤價</font></td>
					<td align=center nowrap=nowrap width="5%"><font>漲跌價差</font></td>
					<td align=center nowrap=nowrap width="12%"><font>成交筆數</font></td>
				</tr>
				<%
					String seh;
					if(request.getParameter("stock_id") != null){
						if(Float.parseFloat(request.getParameter("stock_diff")) == 0)
							seh = "";
						else if( Float.parseFloat(request.getParameter("stock_diff")) > 0)
							seh = "style='color:red'";
						else
							seh = "style='color:green'";%>
						<tr class="row">
							<td align="center" nowrap>
								<a href='http://<%=application.getAttribute("IP")%>:8080/Stock/LoadHisStock?stock_id=<%=request.getParameter("stock_id")%>'>
									<%=request.getParameter("stock_id")%>
								</a>
							</td>
							<td align="center" nowrap>
								<a href='http://<%=application.getAttribute("IP")%>:8080/Stock/LoadHisStock?stock_id=<%=request.getParameter("stock_id")%>'>
									<%=request.getParameter("stock_name")%>
								</a>
							</td>
							<td align="center" nowrap>
								<%=request.getParameter("stock_trade")%>
							</td>
							<td align="center" nowrap>
								<%=request.getParameter("stock_trunover")%>
							</td>
							<td align="center" nowrap>
								<%=request.getParameter("stock_open")%>
							</td>
							<td align="center" nowrap>
								<%=request.getParameter("stock_max")%>
							</td>
							<td align="center" nowrap>
								<%=request.getParameter("stock_min")%>
							</td>
							<td align="center" nowrap <%=seh%>>
								<%=request.getParameter("stock_close")%>
							</td>
								<td align="center" nowrap <%=seh%>>
								<%=request.getParameter("stock_diff")%>
							</td>
							<td align="center" nowrap>
								<%=request.getParameter("stock_transaction")%>
							</td>
							<td nowrap=nowrap width="6%">
								<%
									if (session.getAttribute("Login") != null) {%> 
								<a
									href='http://<%=application.getAttribute("IP")%>:8080/Stock/NewSelfStock?stock_id=<%=request.getParameter("stock_id")%>'>加入自選股</a>
									<%} else {%>
								<a
									href='http://<%=application.getAttribute("IP")%>:8080/Stock/links/user_login.jsp'>加入自選股</a>
						
									<%}
								%>
							</td>
						</tr>	
					<%}else{%>
						<tr><td align="center" colspan="10" style='color:red;'>查無資料</td></tr>
					<%}
				%>
			</table>	
		<%}
	session.removeAttribute("InqResult");
	%>
	<%
		if( session.getAttribute("Login") != null){%>
			<div style="width: 5em; letter-spacing: 2px;height: 1.6em; text-align: center; background-color: #828282; opacity: 0.8; margin: 1em auto 5px 2em; border-radius: 8px;">
				<h4>自選股</h4>
			</div>
			<table border="1">
				<tr valign=top class="table-colunm">
					<td align=center nowrap=nowrap width="10%"><font>股票代碼</font></td>
					<td align=center nowrap=nowrap width="10%"><font>證券名稱</font></td>
					<td align=center nowrap=nowrap width="11%"><font>成交股數</font></td>
					<td align=center nowrap=nowrap width="18%"><font>成交金額</font></td>
					<td align=center nowrap=nowrap width="7%"><font>開盤價</font></td>
					<td align=center nowrap=nowrap width="7%"><font>最高價</font></td>
					<td align=center nowrap=nowrap width="7%"><font>最低價</font></td>
					<td align=center nowrap=nowrap width="7%"><font>收盤價</font></td>
					<td align=center nowrap=nowrap width="5%"><font>漲跌價差</font></td>
					<td align=center nowrap=nowrap width="12%"><font>成交筆數</font></td>
				</tr>
				<!-- (int) session.getAttribute("stock_count") -->
				<% 
					if( (int)session.getAttribute("stock_count") > 0){%>
						<%
							String sef;
							String[][] no = (String[][]) session.getAttribute("stock_result");
							for (int i = 0; i < (int) session.getAttribute("stock_count"); i++) {
								if(Float.parseFloat(no[i][8]) == 0)
									sef = "";
								else if( Float.parseFloat(no[i][8]) > 0)
									sef = "style='color:red'";
								else
									sef = "style='color:green'";
						%>
						<tr class="row">
							<td align="center" nowrap>
								<a href='http://<%=application.getAttribute("IP")%>:8080/Stock/LoadHisStock?stock_id=<%=no[i][0]%>'>
									<%=no[i][0]%>
								</a>
							</td>
							<td align="center" nowrap>
								<a href='http://<%=application.getAttribute("IP")%>:8080/Stock/LoadHisStock?stock_id=<%=no[i][0]%>'>
									<%=no[i][1]%>
								</a>
							</td>
							<td align="center" nowrap><%=no[i][2]%></td>
							<td align="center" nowrap><%=no[i][3]%></td>
							<td align="center" nowrap><%=no[i][4]%></td>
							<td align="center" nowrap><%=no[i][5]%></td>
							<td align="center" nowrap><%=no[i][6]%></td>
							<td align="center" nowrap <%=sef%>><%=no[i][7]%></td>
							<td align="center" nowrap <%=sef%>><%=no[i][8]%></td>
							<td align="center" nowrap><%=no[i][9]%></td>
							<td nowrap=nowrap width="6%"><a
								href="http://localhost:8080/Stock/DeleteSelfStock?stock_id=<%=no[i][0]%>">刪除</a>
							</td>
						</tr>
						<%
							}
						%>
					<%}
					else{%>
						<tr><td align="center" colspan="10">目前沒有自選股資料</td></tr>
					<%}
				%>
			</table>
		<%}
	%>
	
</body>
<script src="files/js/main.js"></script>
</html>