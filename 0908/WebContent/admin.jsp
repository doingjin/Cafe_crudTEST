<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	<div align="center">
		<h1>😎 A D M I N 😎</h1>
		<hr>
		<br>
		<br>
		<table border="1">
			<thead>
				<tr align="center">
					<th>☕</th>
					<th>💲</th>
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
		<h3>new menu?😲</h3>
		<form method="post" action="control.jsp">
			<input type="hidden" name="action" value="newone"> 
			☕<input type="text" name="coff">&emsp;
			💲<input type="text" name="price"> <br>
			<br>
			<input type="submit" value="add!😉">
		</form>
		<br>
		<div id="box">
			<c:if test="${alert1!=null}">
				${alert1}
			</c:if>
		</div>
		<br>
		<br>
		<h3>change price?😲</h3>
		<form method="post" action="control.jsp">
			<input type="hidden" name="action" value="chgone">
			☕<select name="coff">
				<c:forEach var="v" items="${datas}">
					<option>${v.coff}</option>
				</c:forEach>
			</select>&emsp; 
			💲<input type="text" name="price"> <br>
			<br>
			<input type="submit" value="change!😉">
		</form>
		<br>
		<div id="box">
				<c:if test="${alert2!=null}">
				${alert2}
			</c:if>
			</div>
		<br>
		<br>
		<h3>delete menu?😲</h3>
		<form method="post" action="control.jsp">
			<input type="hidden" name="action" value="dltone">
			☕<select name="coff">
				<c:forEach var="v" items="${datas}">
					<option>${v.coff}</option>
				</c:forEach>
			</select>
			<br><br>
			<input type="submit" value="delete!😉">
		</form>
		<br>
		<div id="box">
				<c:if test="${alert3!=null}">
				${alert3}
			</c:if>
		</div>
		<br>
		<button onclick="location.href='control.jsp?action=main'">Back to Main💨</button>
	</div>
</body>
</html>