<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>文章內文</title>
</head>

<body>
	<div>
		<a href="../index.jsp" class="#">回首頁</a>
	</div>
	<div>
		<a href="http://localhost:8080/Stock/Logout">登出</a>
	</div>
	<div>
		<%
			String back = "";
			if(session.getAttribute("LastestArticle") != null)
				back = "board.jsp";
			else
				back = "http://localhost:8080/Stock/LoadArticle";
		%>
		<a href="<%=back%>" class="#">回到討論板</a>
	</div>
	<div>
		<%
			String arti_User_id=request.getParameter("User_id");
			String User_id = (String)session.getAttribute("UID");
			if( User_id.equals(arti_User_id))
				out.print("<a href='#?arti_id="+request.getParameter("arti_id")+"' class='#'>文章編輯</a>");
		%>
	</div>
	<div>
		<table border="1" class="art_content" style="width: 600px">
			<tr>
				<td width="900rem" colspan="2" align="center"><%=request.getParameter("arti_title") %></td>
			</tr>
			<tr>
				<td align="center">作者：<%=request.getParameter("User_Name") %></td>
			</tr>
			<tr>
				<td align="center">最後更新時間：<%=request.getParameter("arti_update") %></td>
				<td>瀏覽人數：<%=request.getParameter("arti_viewNum")%></td>
			</tr>
			<tr>
				<td width="80%">內文：<%=request.getParameter("arti_txt") %></td>
			</tr>
			<%-- <tr>
				<td><img alt="" src='<%=request.getParameter("arti_img")%>'></td>
				<td><img alt="" src=/Stock/files/arti_img/51.jpg></td>
				
			</tr> --%>
			
		</table>
	</div>
	<!-- <div>
	<p>回覆文章</p>
		<form>
			<textarea cols="50" rows="10"></textarea>
			<br> <input type="submit" value="送出" action="#" /> <input
				type="reset" value="清除">
		</form>
	</div> -->

</body>
</html>