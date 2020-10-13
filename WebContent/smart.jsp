<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("input").keyup(function() {
			function getValues() {
				$(".form-control").val();
			}
		});
	});
</script>
<script type="text/javascript">
	var xmlHTTP;

	function check() {
		if (window.ActiveXObject) {
			xmlHTTP = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHTTP = new XMLHttpRequest();
		}
		var ac = document.getElementById("account").value;
		xmlHTTP.open("GET",
				"http://localhost:8080/Stock/Smart?stock_inq=" + $(".form-control").val(),
				true);

		xmlHTTP.onreadystatechange = function check_status() {
			if (xmlHTTP.readyState == 4) {
				if (xmlHTTP.status == 200) {
					var str = xmlHTTP.responseText;
					var strArray = str.split(",");
					if (strArray[0] != null) {
					document.getElementById("0").value = strArray[0];
					document.getElementById("1").value = strArray[1];
					document.getElementById("2").value = strArray[2];
					document.getElementById("3").value = strArray[3];
					document.getElementById("4").value = strArray[4];
					document.getElementById("5").value = strArray[5];
					document.getElementById("6").value = strArray[6];
					document.getElementById("7").value = strArray[7];
					document.getElementById("8").value = strArray[8];
					document.getElementById("9").value = strArray[9];
					}
				}
			}
		}
		xmlHTTP.send();
	}
</script>
</head>
<body>
	<span style="font-size: 14px;"> <input type="text"
		class="form-control" aria-describedby="basic-addon1" list="category">
		<datalist id="category">
			<option id="0" value="#">
			<option id="1" value="#">
			<option id="2" value="#">
			<option id="3" value="#">
			<option id="4" value="#">
			<option id="5" value="#">
			<option id="6" value="#">
			<option id="7" value="#">
			<option id="8" value="#">
			<option id="9" value="#">
		</datalist>
	</span>

</body>
</html>