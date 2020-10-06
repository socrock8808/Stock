<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>sign_result  ok版</title>
<style type="text/css">
table {
	width: 500px; <!--
	position: fixed;
	-->
}

.row1 {
	width: 50px;
	text-align: center
}

.row2 {
	width: 400px;
	text-align: left;
}

.form1 {
	margin:;
	position: relative;
}
</style>
<script type="text/javascript">
	function modify() {
		document.getElementById("user").innerHTML = '<input type="text" placeholder="ian" />';
		document.getElementById("password").innerHTML = '<input type="text" placeholder="ian" />';
		document.getElementById("nickname").innerHTML = '<input type="text" placeholder="ian" />';
		document.getElementById("gender").innerHTML = '<input type="text" placeholder="ian" />';
		document.getElementById("email").innerHTML = '<input type="text" placeholder="ian" />';
		document.getElementById("birthday").innerHTML = '<input type="text" placeholder="ian" />';
	}
</script>
</head>

<body>
	<div>
		<h1>會員資料</h1>
	</div>
	<div>
		<table class="#" border="1">
			<tr>
				<td class="row1">帳號</td>
				<td class="row2" id="user">
					<%
						out.print(request.getParameter("User_Account"));
					%>
				</td>
			</tr>
			<tr>
				<td class="row1">密碼</td>
				<td class="row2" id="password">
					<%
						out.print(request.getParameter("User_Password"));
					%>
				</td>
			</tr>
			<tr>
				<td class="row1">暱稱</td>
				<td class="row2" id="nickname">
					<%
						out.print(session.getAttribute("User_Name"));
					%>
				</td>
			</tr>
			<tr>
				<td class="row1">性別</td>
				<td class="row2" id="gender">
					<%
						out.print(request.getParameter("User_Gender"));
					%>
				</td>
			</tr>
			<tr>
				<td class="row1">信箱</td>
				<td class="row2" id="email">
					<%
						out.print(request.getParameter("User_Email"));
					%>
				</td>
			</tr>
			<tr>
				<td class="row1">生日</td>
				<td class="row2" id="birthday">
					<%
						out.print(request.getParameter("User_Birthday"));
					%>
				</td>
			</tr>
		</table>
	</div>
	<br>
	<div>
		<form class="form1">
			<input type="button" value="修改" onClick="modify()" />
		</form>
	</div>
</body>
</html>
