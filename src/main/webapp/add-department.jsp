<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Department</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style type="text/css">
tr, td {
	padding: 10px !important;
}
</style>
</head>
<body>
	<a href="display-employee.jsp" class="btn btn-dark"> View Employee
	</a>
	<form name="action" action="AppServlet" method="post">
		<table>
			<tr>
				<td>Department name:</td>
				<td>
					<input type="text" name="departmentName" required="required">
				</td>
			</tr>
			<tr>
				<td>Office location:</td>
				<td>
					<input type="text" name="locationName" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" name="action" value="Add Department" class="btn btn-primary">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>