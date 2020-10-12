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
		<a href="http://<%=application.getAttribute("IP")%>:8080/Stock/Logout" >登出</a>
	</div>
	<div>
		<a href="write_post.jsp">發佈文章</a>
	</div>
	<table border="1">
		<tr class="title">
			<td width="90">編號</td>
			<td width="400">文章標題</td>
			<td width="120">作者</td>
			<td width="90">日期</td>
		</tr>
		<%
			String[][] no = (String[][]) session.getAttribute("array");
			for (int i = 0; i < (int) session.getAttribute("arti_count"); i++) {
		%>

		<tr>
			<td width="90">No.<%=no[i][0]%></td>
			<td width="400"><a href="http://<%=application.getAttribute("IP")%>:8080/Stock/LoadContent?arti_id=<%=no[i][0]%>"><%=no[i][1]%></a></td>
			<td width="120"><%=no[i][2]%></td>
			<td width="90"><%=no[i][3]%></td>
		</tr>
		<%
			}
		%>
	</table>
	<div style="margin: 2em 0 0 0; text-align: center;">
	<%  
		int lastestId = (int)session.getAttribute("LastestId");
		int id = (int)session.getAttribute("id");
		int count = (int)session.getAttribute("ArtiCount")%10;
		if( id < (lastestId-10))
		{%>
			<a href="http://<%=application.getAttribute("IP")%>:8080/Stock/FirstArticle">第一頁</a>
			<a href="http://<%=application.getAttribute("IP")%>:8080/Stock/PreArticle">上一頁</a>
	<%	}%>
	<%
		if( id % 10 == 0)
		{
			if( id > count)
			{%>
				<a href="http://<%=application.getAttribute("IP")%>:8080/Stock/NextArticle">下一頁</a>
				<a href="http://<%=application.getAttribute("IP")%>:8080/Stock/LastArticle">最末頁</a>
			<%}
		}
		else
		{
			if( id >= count)
			{%>
				<a href="http://<%=application.getAttribute("IP")%>:8080/Stock/NextArticle">下一頁</a>
				<a href="http://<%=application.getAttribute("IP")%>:8080/Stock/LastArticle">最末頁</a>
			<%}
		}
	%>
	</div>
</body>
</html>

<%-- 
使用forward將36行改為
String[][] no = request.getAttribute("array");
使用session將36行改為
String[][] no = (String[][]) session.getAttribute("array");
--%>
