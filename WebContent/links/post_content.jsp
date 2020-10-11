<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="../files/css/main.css">
<script src="../files/js/main.js"></script>
<title>文章內文</title>
<!-- <style type="text/css">
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
	background-color:#F0F0F0;
	margin-top:auto;
	margin-left:auto;
	margin-right:75%;
	margin-bottom:5px;
}
</style> -->
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
	<%
		String[][] reply = (String[][])session.getAttribute("reply");
		int RCount = Integer.parseInt(request.getParameter("reply_count"));
		if( RCount > 0)
		{
			for(int i=0;i<RCount;i++){
			%>
				<div>
					<div class="post reply">
						<div>
							<span><%=reply[i][4] %></span>
							<br>
							<%=reply[i][2] %> 
							<br>
							<%=reply[i][1] %>
						</div>
						<%if(reply[i][3] != null){%>
							<div>
								<img src="<%=reply[i][3] %>" 
									style="height: 125px; width: 110px;">
							</div>							
						<%} %>
					</div>
				</div>
			
			<%}
		}
	%>
	<br><!-- 以下為回覆書寫區 -->
	<div>
		<span style='color:red'><%=session.getAttribute("Login")%></span>
		<form action="http://localhost:8080/Stock/NewReply?arti_id=<%=request.getParameter("arti_id")%>"
		 		method="post" enctype="multipart/form-data">
			<textarea name="reply_txt" rows="5" cols="50">請輸入內容</textarea>
			<input type="submit" value="送出" name="upload"><br>
			上傳照片:<input type="file" name="photo" />
		
		</form>
	</div>

</body>
</html>