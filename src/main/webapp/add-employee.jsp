<%@page import="com.bean.Employee"%>
<%@page import="com.bean.Department"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.AppDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
Employee employee = (Employee) request.getAttribute("employee");
if (employee != null) {
%>
<title>Update Employee</title>
<%
} else {
%>
<title>Add Employee</title>
<%
}
%>
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
	<a href="display-employee.jsp" class="btn btn-dark">View Employee</a>
	<form name="action" action="AppServlet" method="post">
		<table>
			<tr>
				<%
				if (employee != null) {
				%>
				<td><input type="hidden" value="<%=employee.getEmployeeId()%>"
					name="employeeId" required="required"></td>
				<%
				}
				%>
			</tr>
			<tr>
				<td>First name:</td>
				<%
				if (employee != null) {
				%>
				<td>
					<input type="text" value="<%=employee.getFirstName()%>"name="firstName" required="required">
				</td>
				<%
				} else {
				%>
				<td>
					<input type="text" name="firstName" required="required">
				</td>
				<%
				}
				%>
			</tr>
			<tr>
				<td>Last name:</td>
				<%
				if (employee != null) {
				%>
				<td>
					<input type="text" value="<%=employee.getLastName()%>" name="lastName" required="required">
				</td>
				<%
				} else {
				%>
				<td>
					<input type="text" name="lastName" required="required">
				</td>
				<%
				}
				%>
			</tr>
			<tr>
				<td>Department:</td>
				<td>
					<select name="department">
							<option>Please select</option>
							<%
							List<Department> list = AppDao.getAlldepartments();
							if (employee != null) {
								for (Department d : list) {
									if (employee.getDepartment().getDepartmentId().equals(d.getDepartmentId())) {
							%>
							<option value="<%=d.getDepartmentId()%>" selected="selected"><%=d.getDepartmentName()%></option>
							<%
							} else {
							%>
							<option value="<%=d.getDepartmentId()%>"><%=d.getDepartmentName()%></option>
							<%
							}
							}
							} else {
							for (Department dep : list) {
							%>
							<option value="<%=dep.getDepartmentId()%>"><%=dep.getDepartmentName()%></option>
							<%
							}
							}
							%>
					</select>
				</td>
			</tr>
			<tr>
				<td>email:</td>
				<%
				if (employee != null) {
				%>
				<td>
					<input type="text" value="<%=employee.getEmail()%>" name="email" required="required">
				</td>
				<%
				} else {
				%>
				<td>
					<input type="text" name="email" required="required">
				</td>
				<%
				}
				%>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<%
					if (employee != null) {
					%> 
					<input type="submit" value="Update Employee" name="action" required="required" class="btn btn-primary"> 
					<%
					} else {
					%> 
					<input type="submit" value="Add Employee" name="action" required="required" class="btn btn-primary"> 
					<%
 					}
 					%>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>