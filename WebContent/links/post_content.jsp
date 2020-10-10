<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>文章內文</title>
<style type="text/css">
div {
    display: block;
}

body {
    background: #eef2ff url(/image/fade-blue.png) top center repeat-x;
    color: #000;
    font-family: arial,helvetica,sans-serif;
    font-size: 10pt;
    margin-left: 0;
    margin-right: 0;
    margin-top: 5px;
    padding-left: 5px;
    padding-right: 5px;
}

html {
    -moz-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
    -ms-text-size-adjust: 100%;
}

.post {
	background-color:gray;
	margin-top:auto;
	margin-left:auto;
	margin-right:60%;
	margin-bottom:5px;
}
</style>
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
			<%
				if(request.getParameter("arti_img") != null)
				{
					out.print("<tr><td><img width='300px' src='"+request.getParameter("arti_img")+"'></td></tr>");
				}
			%>
		</table>
	</div>
	<br><!-- 以下為回覆本文區 -->
	
	<div>
		<div class="post reply">
			<div>
				<span>Anonymous</span>
				<br>
				10/08/20(Thu)17:00:25 
				<br>
				File:
			</div>
			<div>
				<a href="//is2.4chan.org/c/1602190825059.png" target="_blank">
					<img src="//i.4cdn.org/c/1602190825059s.jpg" 
						alt="233 KB" data-md5="GfpuDdW9fCq1dlvq7Ew05w==" 
						style="height: 125px; width: 110px;">
				</a>
			</div>
		</div>
	</div>
	
	<br><!-- 以下為回覆書寫區 -->
	<div>
		<span style='color:red'><%=session.getAttribute("Login")%></span>
		<form action="http://localhost:8080/Stock/__?arti_id=<%=request.getParameter("arti_id")%>"
		 		method="post" enctype="multipart/form-data">
			<textarea name="reply_txt" rows="5" cols="50">請輸入內容</textarea>
			<input type="submit" value="送出" name="upload"><br>
			上傳照片:<input type="file" name="photo" />
		
		</form>
	</div>

</body>
</html>