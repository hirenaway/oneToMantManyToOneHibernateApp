<%@page import="com.dao.AppDao"%>
<%@page import="com.bean.Employee"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of employee</title>
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
	<a href="add-employee.jsp" class="btn btn-primary">Add Employee</a>
	<form method="post" action="AppServlet">
		<table width=100% border="1" cellpadding="10px" cellspacing="10px">
			<tr>
				<td>ID</td>
				<td>First Name</td>
				<td>Last name</td>
				<td>Email</td>
				<td>Department Id</td>
				<td>Department</td>
				<td>Location</td>
				<td>Edit</td>
				<td>Delete</td>
			</tr>
			<%
			List<Employee> employeeList = AppDao.getAllEmployee();
			if (!employeeList.isEmpty()) {
				for (Employee em : employeeList) {
			%>
			<tr>
				<td><%=em.getEmployeeId()%></td>
				<td><%=em.getFirstName()%></td>
				<td><%=em.getLastName()%></td>
				<td><%=em.getEmail()%></td>
				<td><%=em.getDepartment().getDepartmentId()%></td>
				<td><%=em.getDepartment().getDepartmentName()%></td>
				<td><%=em.getDepartment().getOfficeLocation()%></td>
				<td>
					<form name="edit" method="post" action="AppServlet">
						<input type="hidden" name="empId" value="<%=em.getEmployeeId()%>">
						<input type="submit" name="action" value="Edit" class="btn btn-primary" />
					</form>
				</td>
				<td>
					<form name="delete" method="post" action="AppServlet">
						<input type="hidden" name="empId" value="<%=em.getEmployeeId()%>">
						<input type="submit" name="action" value="Delete" class="btn btn-danger" />
					</form>
				</td>
			</tr>
			<%
			}
			}
			%>
		</table>
	</form>
</body>
</html>