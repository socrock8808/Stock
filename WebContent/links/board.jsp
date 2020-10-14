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
		<a href="http://<%=application.getAttribute("IP")%>:8080/Stock/Logout" >登出</a>
	</div>
	<div style="margin: 0 2em 1em auto">
		<input type="button" value="發布文章" onclick="location.href='write_post.jsp'" />
	</div>
	<table border="1">
		<tr class="title" style="letter-spacing: 13px; text-align: center;">
			<td width="90"><h4>編號</h4></td>
			<td width="400"><h4>文章標題</h4></td>
			<td width="120"><h4>作者</h4></td>
			<td width="90"><h4>日期</h4></td>
		</tr>
		<%
			String[][] no = (String[][]) session.getAttribute("array");
			for (int i = 0; i < (int) session.getAttribute("arti_count"); i++) {
		%>

		<tr style="text-align: center;">
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
<script src="../files/js/main.js"></script>
</html>

<%-- 
使用forward將36行改為
String[][] no = request.getAttribute("array");
使用session將36行改為
String[][] no = (String[][]) session.getAttribute("array");
--%>
