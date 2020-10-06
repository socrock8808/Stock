<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>sign_result</title>
<style type="text/css">
table {
	width: 500px;
	cols: 20;
	table-layout: fixed;
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
	margin:; <!--
	position: relative;
	-->
}
</style>
<script type="text/javascript">
	//window.onbeforeunload = function(event) {
	//	return "";
	//}
	function home() {
		location.href="../index.jsp";
		//history.back();
	}
	function modify() {
		document.getElementById("refresh1").innerHTML = '<input type="submit" value="送出" />';
		
		document.getElementById("password").innerHTML = '<input type="text" name="User_Password" autocomplete="off" pattern="[a-zA-Z0-9]{8,16}" placeholder="<%
			out.print(request.getParameter("User_Password"));
		%>" />';
		document.getElementById("name").innerHTML = '<input type="text" name="User_Name" placeholder="<%
			out.print(session.getAttribute("User_Name"));
		%>" />';
		document.getElementById("email").innerHTML = '<input type="email" name="User_Email" placeholder="<%
			out.print(request.getParameter("User_Email"));
		%>" />';
		
	}
</script>
</head>

<body>
	<div>
		<a href="../index.jsp">回首頁</a>
	</div>
	<div>
		<h1>會員資料</h1>
	</div>
	<div>
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
		<form class="form1" method="post" action="http://localhost:8080/Stock/UpdateUser">
			<table class="#" border="1">
				<tr>
					<td class="row1">帳號</td>
					<td class="row2" id="user"><%=request.getParameter("User_Account")%>
					</td>
				</tr>
				<tr>
					<td class="row1">密碼</td>
					<td class="row2" id="password"><%=request.getParameter("User_Password")%><a
						style="margin-left: 300;"></a></td>
				</tr>
				<tr>
					<td class="row1">暱稱</td>
					<td class="row2" id="name"><%=session.getAttribute("User_Name")%>
					</td>
				</tr>
				<tr>
					<td class="row1">性別</td>
					<td class="row2" id="gender"><%=str1%></td>
				</tr>
				<tr>
					<td class="row1">信箱</td>
					<td class="row2" id="email"><%=request.getParameter("User_Email")%>
					</td>
				</tr>
				<tr>
					<td class="row1">生日</td>
					<td class="row2" id="birthday"><%=request.getParameter("User_Birthday")%>
					</td>
				</tr>
			</table>
			<br> <input type="button" value="修改" onClick="modify()" /> <a
				id="refresh1"></a>
		</form>
		<input type="button" value="返回" onClick="home()" />
	</div>
</body>
</html>
<!-- 中文轉碼 -->
<%-- if(getParameter("User_Name")){
			URLDecoder.decode(request.getParameter("User_Name"), "UTF-8")
			} 
		
		}--%>