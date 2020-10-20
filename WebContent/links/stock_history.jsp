<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../files/css/main.css">
<style type="text/css">
div, p {
	vertical-align: inline;
}
</style>
<title>股票歷史資料</title>
</head>

<body class="is-preload">
	<div  class="section-content">
		<a href="../index.jsp">回首頁</a>
	</div>
	<div class="third-content">
		<%	//註冊、登入顯示判斷
			if (session.getAttribute("Login") == null)
			{
				out.print("<a class='section-item' href='user_signup.jsp' style='margin-left: 300'>註冊</a> ");
				out.print("<a class='section-item' id='member' href='user_login.jsp'>登入</a>");
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
	<div>
		<p>股票代碼:<%=request.getParameter("stock_id")%></p>
		<p>證券名稱:<%=request.getParameter("stock_name")%></p>
	</div>
	<table border="1" style="margin: 0;">
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
			String a;
			for (int i = 0; i < (int) session.getAttribute("stock_hisCount"); i++) {
				if(Float.parseFloat(no[i][8]) == 0)
					a = "";
				else if( Float.parseFloat(no[i][8]) > 0)
					a = "style='color:red'";
				else
					a = "style='color:green'";
		%>
		<tr class="row">
			<td align="center" nowrap><%=no[i][2]%></td>
			<td align="center" nowrap><%=no[i][3]%></td>
			<td align="center" nowrap><%=no[i][4]%></td>
			<td align="center" nowrap><%=no[i][5]%></td>
			<td align="center" nowrap><%=no[i][6]%></td>
			<td align="center" nowrap <%=a%>><%=no[i][7]%></td>
			<td align="center" nowrap <%=a%>><%=no[i][8]%></td>
			<td align="center" nowrap><%=no[i][9]%></td>
			<td align="center" nowrap><%=no[i][10]%></td>
		</tr>
		<%
			}
		%>
	</table>
	<div id="chartContainer" style="width: 100%;"></div>
	 
<script src="../files/js/main2.js"></script>
<!-- new -->
<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.stock.min.js"></script>
<script type="text/javascript">
window.onload = function () {
  var dataPoints = [];
  var stockChart = new CanvasJS.StockChart("chartContainer",{
    theme: "light2",
    charts: [{
      title: {
        text: '<%=request.getParameter("stock_id")%> <%=request.getParameter("stock_name")%>'
      },
      axisY: {
        prefix: "$"
      },
      data: [{
        type: "candlestick",
        yValueFormatString: "$#,###.##",
        dataPoints : dataPoints
      }]
    }] /* ,
    navigator: {
      slider: {
        minimum: new Date(2018, 04, 01),
        maximum: new Date(2018, 07, 31)
      }
    } */
  });
  $.getJSON("https://canvasjs.com/data/docs/btcusd2018.json", function(data) {
    /* for(var i = 0; i < data.length; i++){
      dataPoints.push({x: new Date(data[i].date), y: [Number(data[i].open), Number(data[i].high), Number(data[i].low), Number(data[i].close)]});
    } */
    <%
		for (int i = 0; i < (int) session.getAttribute("stock_hisCount"); i++){%>
			dataPoints.push({x:new Date("<%=no[i][10]%>"), y:[Number(<%=no[i][4]%>),Number(<%=no[i][5]%>),Number(<%=no[i][6]%>),Number(<%=no[i][7]%>)]});
		<%}
    %>
    stockChart.render();
  });
}
</script>

<!-- new -->
</body>
</html>