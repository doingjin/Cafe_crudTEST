<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to the Cafeโ</title>
<style type="text/css">
h1, h3 {
	text-align: center;
}

table {
	width: 50%;
	align: center;
}

thead {
	background: cornflowerblue;
}

tbody {
	background: lightgreen;
	font-style: italic;
}

td {
	width: 50%;
}

#box {
	display: block;
	width: 300px;
	height: 100px;
	border: 1px solid cornflowerblue;
	line-height: 100px;
}
</style>
</head>
<body>
	<h1>๐Welcome to the Cafe๐</h1>
	<hr>
	<br>
	<br>
	<div align="center">
		<table border="1">
			<thead>
				<tr align="center">
					<th>โ</th>
					<th>๐ฒ</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="v" items="${datas}">
					<tr align="center">
						<td>${v.coff}</td>
						<td>${v.price}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<br><br>
		<h3>order?๐ฒ</h3>
		
			<form method="post" action="control.jsp">
				<input type="hidden" name="action" value="getone">
				<select name="coff">
					<option value="">โ</option>
					<c:forEach var="v" items="${datas}">
						<option>${v.coff}</option>
					</c:forEach>
				</select>&emsp; <input type="number" name="cnt" min="1" max="3">&emsp;
				<input type="submit" value="order!๐">
			</form>
			<br>
			<div id="box">
				<c:if test="${total != null}">
					โ${data.coff}์ ์ด ๊ธ์ก์ ${total}์์๋๋ค.
				</c:if>
			</div>
			<br>
			<button onclick="location.href='control.jsp?action=admin'">Go to ADMIN๐</button>
			
			
		</div>
		
</body>
</html>