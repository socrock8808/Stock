<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>sign_result</title>
<link rel="stylesheet" href="../files/css/main.css">
<script type="text/javascript">
	function home() {
		location.href="../index.jsp";
	}
	function modify() {
		document.getElementById("refresh1").innerHTML = '<input type="submit" value="送出" />';
		
		document.getElementById("password").innerHTML = '<input type="text" name="User_Password" autocomplete="off" pattern="[a-zA-Z0-9]{8,16}" value="<%
			out.print(request.getParameter("User_Password"));
		%>" />';
		document.getElementById("name").innerHTML = '<input type="text" name="User_Name" value="<%
			out.print(session.getAttribute("User_Name"));
		%>" />';
		document.getElementById("email").innerHTML = '<input type="email" name="User_Email" value="<%
			out.print(request.getParameter("User_Email"));
		%>" />';
		
	}
</script>
</head>

<body>
	<div class="section-content">
		<a href="../index.jsp">回首頁</a>
	</div>
	<div id="header" style="text-align: center">
		<h1>會員資料</h1>
	</div>
	<div id="header" style="text-align: center">
		<%
			String sex = request.getParameter("User_Gender");
			String str1 = "";
			if (sex.equals("0")) {
				str1 = "女";

			} else {
				str1 = "男";
			}
			;
		%>
		<form id="signup-form" method="post" action="http://<%=application.getAttribute("IP")%>:8080/Stock/UpdateUser">
			<table  style="width: 400px; margin: 0 auto;">
				<tr>
					<td class="row1">帳號:</td>
					<td class="row2" id="user"><%=request.getParameter("User_Account")%>
					</td>
				</tr>
				<tr>
					<td class="row1">密碼:</td>
					<td class="row2" id="password"><%=request.getParameter("User_Password")%><a
						style="margin-left: 300;"></a></td>
				</tr>
				<tr>
					<td class="row1">暱稱:</td>
					<td class="row2" id="name"><%=session.getAttribute("User_Name")%>
					</td>
				</tr>
				<tr>
					<td class="row1">性別:</td>
					<td class="row2" id="gender"><%=str1%></td>
				</tr>
				<tr>
					<td class="row1">信箱:</td>
					<td class="row2" id="email"><%=request.getParameter("User_Email")%>
					</td>
				</tr>
				<tr>
					<td class="row1">生日:</td>
					<td class="row2" id="birthday"><%=request.getParameter("User_Birthday")%>
					</td>
				</tr>
			</table>
			<span id="refresh1"><input type="button" value="修改" onClick="modify()" /></span>
			<input type="button" value="返回" onClick="home()" />
		</form>		
	</div>
</body>
<script src="../files/js/main2.js"></script>
</html>
