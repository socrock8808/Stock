<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>註冊帳號</title>
<link rel="stylesheet" href="../files/css/main.css">
<script>
	function checkpw() {
		var p1 = document.getElementById("pw1").value;
		var p2 = document.getElementById("pw2").value;
		if (p1 == p2) {
			document.getElementById("chk").innerHTML = "<font color='green'>密碼相同</font>";
			document.getElementById("submit").disabled = false;
		} else {
			document.getElementById("chk").innerHTML = "<font color='red'>密碼不相同</font>";
			document.getElementById("submit").disabled = true;
		}
	}
</script>
<script type="text/javascript">
	  var xmlHTTP;

      function check()
      {  
        if(window.ActiveXObject)
        {
          xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
        }
        else if(window.XMLHttpRequest)
        {
          xmlHTTP=new XMLHttpRequest();
        }
        var ac = document.getElementById("account").value;
        xmlHTTP.open("GET",'http://<%=application.getAttribute("IP")%>:8080/Stock/CheckAccount?User_Account='
								+ ac, true);

		xmlHTTP.onreadystatechange = function check_status() {
			if (xmlHTTP.readyState == 4) {
				if (xmlHTTP.status == 200) {
					var str = xmlHTTP.responseText;
					document.getElementById("message").innerHTML = str;
				}
			}
		}
		xmlHTTP.send();
	}
</script>
<style type="text/css">
/* input[type=date]::-webkit-datetime-edit { width:10em; background-color: black; } */
input[type="date"]::-webkit-datetime-edit-text {
	color: black;
	padding: 0 .3em;
}

input[type="date"]::-webkit-datetime-edit-year-field {
	color: black;
}

input[type="date"]::-webkit-datetime-edit-month-field {
	color: black;
}

input[type="date"]::-webkit-datetime-edit-day-field {
	color: black;
}

input [type="text"], input[type="password"], input[type="email"], input[type="date"],
	select, textarea {
	display: inline;
	width: 100%;
}

img {
	vertical-align: middle;
}

span {
	vertical-align: middle;
}

.radio {
	vertical-align: middle;
	display: inline;
	float: none;
}
</style>
</head>
<body class="is-preload">
	<div class="section-content">
		<a href="../index.jsp">回首頁</a>
	</div>
	<div id="header" style="text-align: center">
		<h1 style="margin: 0;">Sign up</h1>
	</div>
	<form method="post" id="signup-form" style="margin: 0 auto;"
		action="http://<%=application.getAttribute("IP")%>:8080/Stock/Servlet_Input_signup">
		<table style="text-align: center; border: 0;">
			<tr>
				<td>帳號:</td>
				<td><input type="text" name="User_Account" required size="20"
					style="margin: 0.5em 0 0 0;" id="account"> <span
					id="message"></span></td>
				<td><input type="button" name="aa" value="驗證" onClick="check()"
					required size="20" class="register-submit"></td>
			</tr>
			<tr>
				<td>密碼:</td>
				<td><input type="text" name="User_Password" id="pw1"
					autocomplete="off" pattern="[a-zA-Z0-9]{8,16}"
					placeholder="請輸入8-16位字元" required size="20"
					style="margin: 0.5em 0 0 0;"></td>
			</tr>
			<tr>
				<td>確認密碼:</td>
				<td><input type="text" name="confirm_Password" id="pw2"
					autocomplete="off" pattern="[a-zA-Z0-9]{8,16}"
					placeholder="再一次輸入密碼" onkeyup="checkpw()" required size="20"
					style="margin: 0.5em 0 0 0;"><span id="chk"></span></td>
			</tr>
			<tr>
				<td>暱稱:</td>
				<td><input type="text" name="User_Name" required size="20"
					style="margin: 0.5em 0 0 0;"></td>
			</tr>
			<tr>
				<td>性別:</td>
				<td class="radio"><input type="radio" id="male"
					name="User_Gender" required value="1"> <label for="male"
					style="margin: 10px 0 0 0;">男</label> <input type="radio"
					id="female" name="User_Gender" value="0" required
					style="margin: 0 0 0 0.1em;"> <label for="female">女</label></td>
			</tr>
			<tr>
				<td>信箱:</td>
				<td><input type="email" name="User_Email" required size="20"
					style="margin: 0;"></td>
			<tr>
				<td>生日:</td>
				<td><input type="Date" name="User_Birthday" required size="20"
					style="margin: 0.5em 0 0 0;"></td>
			</tr>
			<tr>
				<td>輸入驗證碼:</td>
				<td><input type="text" name="LoginCheckImage" id="Image"
					size="20" style="margin: 0.5em 0 0 0;"></td>
				<td><div>
						<img src="LoginCheckImage.jsp" alt="newImage">
					</div></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<span>
						<%
							if (session.getAttribute("RegisterResult") != null)
								out.print("<font style='color:red'>" + session.getAttribute("RegisterResult") + "</font>");
							session.removeAttribute("RegisterResult");
						%>
					</span>
				</td>
			</tr>
		</table>
		<p style="text-align: center;">
			<input style="margin: 0 1em 0 0;" type="submit" id="submit"
				value="確定"> <input type="reset" value="重設">
		</p>
	</form>
	<script src="../files/js/main2.js"></script>
</body>
</html>